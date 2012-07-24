//
//  DCTMusicModel.m
//  DCTMusicModel
//
//  Created by Daniel Tull on 19.07.2012.
//
//

#import "DCTMusicModel.h"
#import <DCTCoreDataStack/DCTCoreDataStack.h>
#import <MediaPlayer/MediaPlayer.h>

static NSBundle *_bundle = nil;

@implementation DCTMusicModel {
	__strong DCTCoreDataStack *_coreDataStack;
	__strong NSManagedObjectContext *backgroundContext;
}

- (id)init {
	self = [super init];
	if (!self) return nil;
	
	BOOL needsUpdating = NO;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	NSURL *updatedDateURL = [[self class] _lastUpdatedFileURL];
	NSURL *storeURL = [[[self class] _applicationDocumentsDirectory] URLByAppendingPathComponent:@"DCTMusicModel"];
	NSURL *modelURL = [[self class] managedObjectModelURL];
	
	if (![fileManager fileExistsAtPath:[updatedDateURL path]]) {
		needsUpdating = YES;
	} else {
		NSDictionary *attributes = [fileManager attributesOfItemAtPath:[updatedDateURL path] error:nil];
		NSDate *storeDate = [attributes objectForKey:NSFileCreationDate];
		NSDate *libraryLastModified = [[MPMediaLibrary defaultMediaLibrary] lastModifiedDate];
	
		if ([libraryLastModified compare:storeDate] == NSOrderedDescending)
			needsUpdating = YES;
	}
	
	if (needsUpdating) [fileManager removeItemAtURL:storeURL error:nil];
	
	_coreDataStack = [[DCTCoreDataStack alloc] initWithStoreURL:storeURL
													  storeType:NSSQLiteStoreType
												   storeOptions:nil
											 modelConfiguration:nil
													   modelURL:modelURL];
	
	backgroundContext = [_coreDataStack newWorkerManagedObjectContext];
		
	if (needsUpdating) [self _import];
	
	return self;
}



- (void)_import {
	
	_importing = YES;
	UIApplication *app = [UIApplication sharedApplication];
	UIBackgroundTaskIdentifier backgroundTaskIdentifier = [app beginBackgroundTaskWithExpirationHandler:NULL];
	
	[backgroundContext performBlock:^{
		
		MPMediaQuery *mediaQuery = [MPMediaQuery new];
		NSArray *items = mediaQuery.items;
		CGFloat count = (CGFloat)[items count];
		
		NSMutableDictionary *artistsDictionary = [NSMutableDictionary new];
		NSMutableDictionary *composersDictionary = [NSMutableDictionary new];
		NSMutableDictionary *genresDictionary = [NSMutableDictionary new];
		NSMutableDictionary *albumsDictionary = [NSMutableDictionary new];
		NSMutableDictionary *songsDictionary = [NSMutableDictionary new];
		
		[items enumerateObjectsUsingBlock:^(MPMediaItem *item, NSUInteger index, BOOL *stop) {
			
			DCTSong *song = [DCTSong insertInManagedObjectContext:backgroundContext];
			song.identifier = [item valueForProperty:MPMediaItemPropertyPersistentID];
			song.title = [item valueForProperty:MPMediaItemPropertyTitle];
			song.trackNumber = [item valueForProperty:MPMediaItemPropertyAlbumTrackNumber];
			song.lyrics = [item valueForProperty:MPMediaItemPropertyLyrics];
			song.discNumber = [item valueForProperty:MPMediaItemPropertyDiscNumber];
			
			DCTArtist *artist = nil;
			NSString *artistName = [item valueForProperty:MPMediaItemPropertyArtist];
			if (artistName.length > 0) {
				artist = [artistsDictionary objectForKey:artistName];
				if (!artist) {
					artist = [DCTArtist insertInManagedObjectContext:backgroundContext];
					artist.name = artistName;
					[artistsDictionary setObject:artist forKey:artistName];
				}
				song.artist = artist;
			}
			
			NSString *albumTitle = [item valueForProperty:MPMediaItemPropertyAlbumTitle];
			if (albumTitle.length > 0) {
				DCTAlbum *album = [albumsDictionary objectForKey:albumTitle];
				if (!album) {
					album = [DCTAlbum insertInManagedObjectContext:backgroundContext];
					album.title = albumTitle;
					album.artist = artist;
					album.trackCount = [item valueForProperty:MPMediaItemPropertyAlbumTrackCount];
					album.discCount = [item valueForProperty:MPMediaItemPropertyDiscCount];
					[albumsDictionary setObject:album forKey:albumTitle];
				}
				song.album = album;
			}
			
			NSString *genreName = [item valueForProperty:MPMediaItemPropertyGenre];
			if (genreName.length > 0) {
				DCTGenre *genre = [genresDictionary objectForKey:genreName];
				if (!genre) {
					genre = [DCTGenre insertInManagedObjectContext:backgroundContext];
					genre.name = genreName;
					[genresDictionary setObject:genre forKey:genreName];
				}
				song.genre = genre;
			}
			
			NSString *composerName = [item valueForProperty:MPMediaItemPropertyComposer];
			if (composerName.length > 0) {
				DCTComposer *composer = [composersDictionary objectForKey:composerName];
				if (!composer) {
					composer = [DCTComposer insertInManagedObjectContext:backgroundContext];
					composer.name = composerName;
					[composersDictionary setObject:composer forKey:composerName];
				}
				song.composer = composer;
			}
			
			[songsDictionary setObject:song forKey:song.identifier];
			
			if (index % 500 != 0) return;
					
			[backgroundContext dct_saveWithCompletionHandler:^(BOOL success, NSError *error) {
				[self _percentComplete:0.5f*index/count];
			}];
		}];
				
		MPMediaQuery *playlistsQuery = [MPMediaQuery playlistsQuery];
		NSArray *mediaPlaylists = [playlistsQuery collections];
		count = (CGFloat)[mediaPlaylists count];
		
		[mediaPlaylists enumerateObjectsUsingBlock:^(MPMediaPlaylist *mediaPlaylist, NSUInteger index, BOOL *stop) {
			
			DCTPlaylist *playlist = [DCTPlaylist insertInManagedObjectContext:backgroundContext];
			playlist.name = [mediaPlaylist valueForProperty:MPMediaPlaylistPropertyName];
			
			[mediaPlaylist.items enumerateObjectsUsingBlock:^(MPMediaItem *item, NSUInteger idx, BOOL *stop) {
				DCTSong *song = [songsDictionary objectForKey:[item valueForProperty:MPMediaItemPropertyPersistentID]];
				if (song) [playlist addSongsObject:song];
			}];
			
			[backgroundContext dct_saveWithCompletionHandler:^(BOOL success, NSError *error) {
				[self _percentComplete:0.5f+(0.5f*index/count)];
			}];
		}];
		
		[backgroundContext dct_saveWithCompletionHandler:^(BOOL success, NSError *error) {
			[@"Blah blah" writeToFile:[[[self class] _lastUpdatedFileURL] path]
						   atomically:YES
							 encoding:NSUTF8StringEncoding
								error:nil];
			[app endBackgroundTask:backgroundTaskIdentifier];
			[self _percentComplete:1.0f];
			_importing = NO;
		}];
	}];
}

- (void)_percentComplete:(CGFloat)percentage {
	
	if (self.importHandler == NULL) return;
	
	dispatch_async(dispatch_get_main_queue(), ^{
		self.importHandler(percentage, (percentage >= 1.0f));
	});
}

- (NSManagedObjectContext *)managedObjectContext {
	return _coreDataStack.managedObjectContext;
}

+ (NSURL *)managedObjectModelURL {
	return [[self bundle] URLForResource:@"DCTMusicModel" withExtension:@"momd"];
}

+ (NSBundle *)bundle {
	
	static dispatch_once_t bundleToken;
	dispatch_once(&bundleToken, ^{
		NSDirectoryEnumerator *enumerator = [[NSFileManager new] enumeratorAtURL:[[NSBundle mainBundle] bundleURL]
													  includingPropertiesForKeys:nil
																		 options:NSDirectoryEnumerationSkipsHiddenFiles
																	errorHandler:NULL];
		
		for (NSURL *URL in enumerator)
			if ([[URL lastPathComponent] isEqualToString:@"DCTMusicModel.bundle"])
				_bundle = [NSBundle bundleWithURL:URL];
	});
	
	return _bundle;
}

+ (NSURL *)_lastUpdatedFileURL {
	return [[self _applicationDocumentsDirectory] URLByAppendingPathComponent:@"DCTMusicModel.updated"];
}

+ (NSURL *)_applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
