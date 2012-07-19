//
//  DTMusicModelController.m
//  iPod
//
//  Created by Daniel Tull on 07.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTMusicModelController.h"
#import "DTDataInformation.h"
#import "DTSong+Extras.h"

NSString *DTSongString = @"DTSong";
NSString *DTGenreString = @"DTGenre";
NSString *DTArtistString = @"DTArtist";
NSString *DTAlbumString = @"DTAlbum";
NSString *DTPlaylistString = @"DTPlaylist";
NSString *DTComposerString = @"DTComposer";
NSString *DTDataInformationString = @"DTDataInformation";

NSString *DTMusicModelWillBeginUpdatingNotification = @"DTMusicModelWillBeginUpdatingNotification";
NSString *DTMusicModelDidBeginUpdatingNotification = @"DTMusicModelDidBeginUpdatingNotification";
NSString *DTMusicModelDidEndUpdatingNotification = @"DTMusicModelDidEndUpdatingNotification";
NSString *DTMusicModelUpdatingProgressNotification = @"DTMusicModelUpdatingProgressNotification";

NSString *DTMusicModelAmountOfTracksToProcessKey = @"DTMusicModelAmountOfTracksToProcessKey";
NSString *DTMusicModelAmountOfTracksFinishedProcessingKey = @"DTMusicModelAmountOfTracksFinishedProcessingKey";
NSString *DTMusicModelAmountOfPlaylistsToProcessKey = @"DTMusicModelAmountOfPlaylistsToProcessKey";
NSString *DTMusicModelAmountOfPlaylistsFinishedProcessingKey = @"DTMusicModelAmountOfPlaylistsFinishedProcessingKey";
NSString *DTMusicModelUpdatingProgressPercentageKey = @"DTMusicModelUpdatingProgressPercentageKey";

@interface DTMusicModelController () // Private Methods

- (NSArray *)sortDescriptorArrayWithDescriptorWithKey:(NSString *)key;

- (NSArray *)fetchAllEntitiesForName:(NSString *)entityName;
- (NSArray *)fetchAllEntitiesForName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)fetchAllEntitiesForName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors batchSize:(NSUInteger)batchSize;

- (NSManagedObject *)managedObjectOfType:(NSString *)type withPredicate:(NSPredicate *)predicate;

- (void)setupMusicData;

- (NSURL *)storeURL;

- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSString *)applicationDocumentsDirectory;
@end


@implementation DTMusicModelController

@synthesize managedObjectContext, isSettingUp;

- (id)init {
	
	
	if (!(self = [super init]))
		return nil;
	
	NSEntityDescription *entity = [NSEntityDescription entityForName:DTDataInformationString inManagedObjectContext:self.managedObjectContext];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];	
	NSError *error = nil;
	NSArray *fetchResult = [self.managedObjectContext executeFetchRequest:request error:&error];
	[request release];
	
	if (error) {
		NSLog(@"%@ Fetch Error", self);
		return nil;
	}
	
	if ([fetchResult count] == 0) {
		NSLog(@"%@:%@", self, NSStringFromSelector(_cmd));
		[NSThread detachNewThreadSelector:@selector(setupMusicData) toTarget:self withObject:nil];
		return self;
	}
	
	DTDataInformation *dataInfo = [fetchResult objectAtIndex:0];
		
#ifndef __IPHONE_3_1
#warning lastModifiedDate is broken on iPhone OS version 3.0, this will cause the data store to update ever launch of the application.
#endif	
	NSDate *libraryLastModified = [[MPMediaLibrary defaultMediaLibrary] lastModifiedDate];
	NSDate *dataLastUpdated = dataInfo.lastUpdated;
		
	NSLog(@"%@:%@ library:%@ coredata:%@", self, NSStringFromSelector(_cmd), libraryLastModified, dataLastUpdated);
		
	if ([libraryLastModified compare:dataLastUpdated] == NSOrderedDescending)
		[NSThread detachNewThreadSelector:@selector(setupMusicData) toTarget:self withObject:nil];
	
	return self;
}

- (void)dealloc {
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
	[super dealloc];
}

#pragma mark -
#pragma mark Specific Item Retrieval

- (DTAlbum *)albumWithTitle:(NSString *)albumTitle artist:(DTArtist *)artist {
	
	if (self.isSettingUp) return nil;
		
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title == %@ AND artist == %@", albumTitle, artist];
	return (DTAlbum *)[self managedObjectOfType:DTAlbumString withPredicate:predicate];
}

- (DTGenre *)genreNamed:(NSString *)genreName {
	
	if (self.isSettingUp) return nil;
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", genreName];
	return (DTGenre *)[self managedObjectOfType:DTGenreString withPredicate:predicate];	
}

- (DTArtist *)artistNamed:(NSString *)artistName {
	
	if (self.isSettingUp) return nil;
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", artistName];
	return (DTArtist *)[self managedObjectOfType:DTArtistString withPredicate:predicate];
}

- (DTComposer *)composerNamed:(NSString *)composerName {
	
	if (self.isSettingUp) return nil;
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", composerName];
	return (DTComposer *)[self managedObjectOfType:DTComposerString withPredicate:predicate];
}

- (DTSong *)songWithIdentifier:(NSNumber *)identifier {

	if (self.isSettingUp) return nil;	
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", identifier];
	return (DTSong *)[self managedObjectOfType:DTSongString withPredicate:predicate];
}

#pragma mark -
#pragma mark Collection Retrieval

- (NSArray *)allSongs {
	if (self.isSettingUp) return nil;
	return [self fetchAllEntitiesForName:DTSongString sortDescriptors:[self sortDescriptorArrayWithDescriptorWithKey:@"title"] batchSize:6];
}

- (NSArray *)allArtists {
	if (self.isSettingUp) return nil;
	return [self fetchAllEntitiesForName:DTArtistString sortDescriptors:[self sortDescriptorArrayWithDescriptorWithKey:@"name"] batchSize:6];
}

- (NSArray *)allAlbums {
	if (self.isSettingUp) return nil;
	return [self fetchAllEntitiesForName:DTAlbumString sortDescriptors:[self sortDescriptorArrayWithDescriptorWithKey:@"title"] batchSize:6];
}

- (NSArray *)allComposers {
	if (self.isSettingUp) return nil;
	return [self fetchAllEntitiesForName:DTComposerString sortDescriptors:[self sortDescriptorArrayWithDescriptorWithKey:@"name"] batchSize:6];
}

- (NSArray *)allGenres {
	if (self.isSettingUp) return nil;
	return [self fetchAllEntitiesForName:DTGenreString sortDescriptors:[self sortDescriptorArrayWithDescriptorWithKey:@"name"] batchSize:6];
}

- (NSArray *)allPlaylists {
	if (self.isSettingUp) return nil;
	return [self fetchAllEntitiesForName:DTPlaylistString sortDescriptors:[self sortDescriptorArrayWithDescriptorWithKey:@"name"] batchSize:6];
}

#pragma mark -
#pragma mark Private

- (void)setupMusicData {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	//[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelWillBeginUpdatingNotification object:self userInfo:nil];
	
	[self performSelectorOnMainThread:@selector(sendDTMusicModelWillBeginUpdatingNotification) withObject:nil waitUntilDone:YES];
	
	self.isSettingUp = YES;
	
	NSInteger progressAmount = 0;
	
	NSError *removeerror;
	NSURL *storeURL = [self storeURL];
	[[NSFileManager defaultManager] removeItemAtPath:storeURL.path error:&removeerror];
	[persistentStoreCoordinator release];
	persistentStoreCoordinator = nil;
	[managedObjectContext release];
	managedObjectContext = nil;
	
	NSManagedObjectContext *theManagedObjectContext = self.managedObjectContext;
	
	MPMediaQuery *mediaQuery = [[MPMediaQuery alloc] init];	
	NSArray *items = mediaQuery.items;
	
	MPMediaQuery *playlistsQuery = [MPMediaQuery playlistsQuery];
	NSArray *mediaPlaylists = [playlistsQuery collections];
	
	NSMutableDictionary *progressDictionary = [[NSMutableDictionary alloc] init];
	
	[progressDictionary setObject:[NSNumber numberWithInt:[items count]] forKey:DTMusicModelAmountOfTracksToProcessKey];
	[progressDictionary setObject:[NSNumber numberWithInt:[mediaPlaylists count]] forKey:DTMusicModelAmountOfPlaylistsToProcessKey];
	[progressDictionary setObject:[NSNumber numberWithInt:0] forKey:DTMusicModelAmountOfTracksFinishedProcessingKey];
	[progressDictionary setObject:[NSNumber numberWithInt:0] forKey:DTMusicModelAmountOfPlaylistsFinishedProcessingKey];
	
	//[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelDidBeginUpdatingNotification object:self userInfo:progressDictionary];
	
	[self performSelectorOnMainThread:@selector(sendDTMusicModelDidBeginUpdatingNotificationWithUserInfo:) withObject:progressDictionary waitUntilDone:YES];
	
	NSMutableDictionary *artistsDictionary = [[NSMutableDictionary alloc] init];
	NSMutableDictionary *composersDictionary = [[NSMutableDictionary alloc] init];
	NSMutableDictionary *genresDictionary = [[NSMutableDictionary alloc] init];
	NSMutableDictionary *albumsDictionary = [[NSMutableDictionary alloc] init];
	NSMutableDictionary *songsDictionary = [[NSMutableDictionary alloc] init];
	
	
	float totalWork = ([items count] + [mediaPlaylists count]);
		
	float pieceOfWork = 100.0 / totalWork;
	
	float workDone = 0.0;
	
	NSInteger percentageDone = 0;
	
	for (MPMediaItem *item in items) {
		
		DTSong *song = (DTSong *)[NSEntityDescription insertNewObjectForEntityForName:DTSongString inManagedObjectContext:theManagedObjectContext];
		
		song.identifier = [item valueForProperty:MPMediaItemPropertyPersistentID];
		song.title = [item valueForProperty:MPMediaItemPropertyTitle];
		
		DTArtist *artist = nil;
		NSString *artistName = [item valueForProperty:MPMediaItemPropertyArtist];
		if (artistName && ![artistName isEqualToString:@""]) {
			artist = [artistsDictionary objectForKey:artistName];
			if (!artist) {
				artist = (DTArtist *)[NSEntityDescription insertNewObjectForEntityForName:DTArtistString inManagedObjectContext:theManagedObjectContext];
				artist.name = artistName;
				[artistsDictionary setObject:artist forKey:artistName];
			}
			song.artist = artist;
		}
		
		NSString *albumTitle = [item valueForProperty:MPMediaItemPropertyAlbumTitle];
		if (albumTitle && ![albumTitle isEqualToString:@""]) {
			NSString *albumKey = [NSString stringWithFormat:@"%@%@", artistName, albumTitle];
			DTAlbum *album = [albumsDictionary objectForKey:albumKey];
			if (!album) {
				album = (DTAlbum *)[NSEntityDescription insertNewObjectForEntityForName:DTAlbumString inManagedObjectContext:theManagedObjectContext];
				album.title = albumTitle;
				album.artist = artist;
				[albumsDictionary setObject:album forKey:albumKey];
			}
			song.album = album;
		}
		song.album.trackCount = [item valueForProperty:MPMediaItemPropertyAlbumTrackCount];
		song.album.discCount = [item valueForProperty:MPMediaItemPropertyDiscCount];
		song.trackNumber = [item valueForProperty:MPMediaItemPropertyAlbumTrackNumber];
		
		NSString *genreName = [item valueForProperty:MPMediaItemPropertyGenre];
		if (genreName && ![genreName isEqualToString:@""]) {
			DTGenre *genre = [genresDictionary objectForKey:genreName];
			if (!genre) {
				genre = (DTGenre *)[NSEntityDescription insertNewObjectForEntityForName:DTGenreString inManagedObjectContext:theManagedObjectContext];
				genre.name = genreName;
				[genresDictionary setObject:genre forKey:genreName];
			}
			song.genre = genre;
		}
		
		NSString *composerName = [item valueForProperty:MPMediaItemPropertyComposer];
		if (composerName && ![composerName isEqualToString:@""]) {
			DTComposer *composer = [composersDictionary objectForKey:composerName];
			if (!composer) {
				composer = (DTComposer *)[NSEntityDescription insertNewObjectForEntityForName:DTComposerString inManagedObjectContext:theManagedObjectContext];
				composer.name = composerName;
				[composersDictionary setObject:composer forKey:composerName];
			}
			song.composer = composer;
		}
		
		song.lyrics = [item valueForProperty:MPMediaItemPropertyLyrics];
		song.discNumber = [item valueForProperty:MPMediaItemPropertyDiscNumber];
		
		[songsDictionary setObject:song forKey:song.identifier];
		
		workDone = workDone + pieceOfWork;
		
		if (workDone >= percentageDone) {
			[progressDictionary setObject:[NSNumber numberWithInt:percentageDone] forKey:DTMusicModelUpdatingProgressPercentageKey];
			//[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelUpdatingProgressNotification object:self userInfo:progressDictionary];
			[self performSelectorOnMainThread:@selector(sendDTMusicModelUpdatingProgressNotificationWithUserInfo:) withObject:progressDictionary waitUntilDone:YES];
			percentageDone++;
		}
	}
	
	progressAmount = 0;
		
	[mediaQuery release];
		
	for (MPMediaPlaylist *mediaPlaylist in mediaPlaylists) {
		
		DTPlaylist *playlist = (DTPlaylist *)[NSEntityDescription insertNewObjectForEntityForName:DTPlaylistString inManagedObjectContext:theManagedObjectContext];
		
		NSArray *items = mediaPlaylist.items;
		playlist.name = [mediaPlaylist valueForProperty:MPMediaPlaylistPropertyName];
				
		NSMutableSet *playlistSongs = [[NSMutableSet alloc] init];
		
		for (MPMediaItem *item in items)
			[playlistSongs addObject:[songsDictionary objectForKey:[item valueForProperty:MPMediaItemPropertyPersistentID]]];
		
		playlist.songs = playlistSongs;
		
		progressAmount++;
		[progressDictionary setObject:[NSNumber numberWithInt:progressAmount] forKey:DTMusicModelAmountOfPlaylistsFinishedProcessingKey];
		[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelUpdatingProgressNotification object:self userInfo:progressDictionary];
	}
	self.isSettingUp = NO;
	
	DTDataInformation *dataInfo = (DTDataInformation *)[NSEntityDescription insertNewObjectForEntityForName:DTDataInformationString inManagedObjectContext:theManagedObjectContext];
	dataInfo.lastUpdated = [NSDate date];
		
	[artistsDictionary release];
	[songsDictionary release];
	[genresDictionary release];
	[composersDictionary release];
	[albumsDictionary release];
	
	NSError *error = nil;
	[self.managedObjectContext save:&error];
	if (error)
		NSLog(@"%@:%@ Saving error: %@ : %@", self, NSStringFromSelector(_cmd), error, [error userInfo]);
	
	//[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelDidEndUpdatingNotification object:self userInfo:progressDictionary];
	[self performSelectorOnMainThread:@selector(sendDTMusicModelDidEndUpdatingNotificationWithUserInfo:) withObject:progressDictionary waitUntilDone:YES];
	
	[progressDictionary release];
	
	[pool release];
}

#pragma mark -
#pragma mark Notification Deliverers

- (void)sendDTMusicModelWillBeginUpdatingNotification {
	[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelWillBeginUpdatingNotification object:self];
}

- (void)sendDTMusicModelDidEndUpdatingNotificationWithUserInfo:(NSDictionary *)userInfo {
	[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelDidEndUpdatingNotification object:self userInfo:userInfo];
}

- (void)sendDTMusicModelUpdatingProgressNotificationWithUserInfo:(NSDictionary *)userInfo {
	[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelUpdatingProgressNotification object:self userInfo:userInfo];
}

- (void)sendDTMusicModelDidBeginUpdatingNotificationWithUserInfo:(NSDictionary *)userInfo {
	[[NSNotificationCenter defaultCenter] postNotificationName:DTMusicModelDidBeginUpdatingNotification object:self userInfo:userInfo];
}

#pragma mark -
#pragma mark Generic Core Data Fetching

- (NSArray *)sortDescriptorArrayWithDescriptorWithKey:(NSString *)key {
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
	NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
	[sortDescriptor release];
	return descriptors;
}

- (NSArray *)fetchAllEntitiesForName:(NSString *)entityName {
	return [self fetchAllEntitiesForName:entityName sortDescriptors:nil];
}

- (NSArray *)fetchAllEntitiesForName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors {
	return [self fetchAllEntitiesForName:entityName sortDescriptors:nil batchSize:0];
}

- (NSArray *)fetchAllEntitiesForName:(NSString *)entityName sortDescriptors:(NSArray *)sortDescriptors batchSize:(NSUInteger)batchSize {
	
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	if (batchSize > 0) [request setFetchBatchSize:batchSize];
	
	if (sortDescriptors) [request setSortDescriptors:sortDescriptors];
	
	NSError *error = nil;
	NSArray *fetchResult = [self.managedObjectContext executeFetchRequest:request error:&error];
	[request release];
	
	if (error) {
		return nil;
	}
	
	return fetchResult;
}

- (NSManagedObject *)managedObjectOfType:(NSString *)type withPredicate:(NSPredicate *)predicate {
	
	NSEntityDescription *entity = [NSEntityDescription entityForName:type inManagedObjectContext:self.managedObjectContext];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	[request setPredicate:predicate];
	
	NSError *error = nil;
	
	NSArray *fetchResult = [self.managedObjectContext executeFetchRequest:request error:&error];
	[request release];
	
	if ([fetchResult count] == 0) return nil;
	
	return [fetchResult objectAtIndex:0];
}

#pragma mark -
#pragma mark Object Generation

- (DTComposer *)generateComposerNamed:(NSString *)composerName {
	DTComposer *composer = (DTComposer *)[NSEntityDescription insertNewObjectForEntityForName:DTComposerString inManagedObjectContext:self.managedObjectContext];
	composer.name = composerName;
	return composer;
}

- (DTAlbum *)generateAlbumWithTitle:(NSString *)albumTitle artist:(DTArtist *)artist {
	DTAlbum *album = (DTAlbum *)[NSEntityDescription insertNewObjectForEntityForName:DTAlbumString inManagedObjectContext:self.managedObjectContext];
	album.title = albumTitle;
	album.artist = artist;
	return album;
}

- (DTGenre *)generateGenreNamed:(NSString *)genreName {
	DTGenre *genre = (DTGenre *)[NSEntityDescription insertNewObjectForEntityForName:DTGenreString inManagedObjectContext:self.managedObjectContext];
	genre.name = genreName;
	return genre;
}

- (DTArtist *)generateArtistNamed:(NSString *)artistName {
	DTArtist *artist = (DTArtist *)[NSEntityDescription insertNewObjectForEntityForName:DTArtistString inManagedObjectContext:self.managedObjectContext];
	artist.name = artistName;
	return artist;
}

#pragma mark -
#pragma mark Core Data Stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
	
    if (managedObjectContext != nil)
        return managedObjectContext;
	
	managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
	
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil)
		return managedObjectModel;
	
	//managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"DTMusicModel" ofType:@"xcdatamodel"]]];    
	managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
	
	return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil)
        return persistentStoreCoordinator;
	
	NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];

    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self storeURL] options:nil error:&error]) {
		NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), error);
    }
	
    return persistentStoreCoordinator;
}


- (NSURL *)storeURL {
	return [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"DTMusicModel.sqlite"]];
}

#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}


@end
