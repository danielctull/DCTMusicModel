//
//  DTMusicModelController.h
//  iPod
//
//  Created by Daniel Tull on 07.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CoreData/CoreData.h>

#import "DTSong.h"
#import "DTGenre.h"
#import "DTArtist.h"
#import "DTAlbum.h"
#import "DTPlaylist.h"
#import "DTComposer.h"

extern NSString *DTSongString;
extern NSString *DTGenreString;
extern NSString *DTArtistString;
extern NSString *DTAlbumString;
extern NSString *DTPlaylistString;
extern NSString *DTComposerString;
extern NSString *DTDataInformationString;

extern NSString *DTMusicModelWillBeginUpdatingNotification;
extern NSString *DTMusicModelDidBeginUpdatingNotification;
extern NSString *DTMusicModelDidEndUpdatingNotification;
extern NSString *DTMusicModelUpdatingProgressNotification;

extern NSString *DTMusicModelAmountOfTracksToProcessKey;
extern NSString *DTMusicModelAmountOfTracksFinishedProcessingKey;
extern NSString *DTMusicModelAmountOfPlaylistsToProcessKey;
extern NSString *DTMusicModelAmountOfPlaylistsFinishedProcessingKey;
extern NSString *DTMusicModelUpdatingProgressPercentageKey;

@interface DTMusicModelController : NSObject {
	NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
	
	BOOL isSettingUp;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readonly) NSString *applicationDocumentsDirectory;

@property (nonatomic, assign) BOOL isSettingUp;

- (NSArray *)allSongs;
- (NSArray *)allArtists;
- (NSArray *)allAlbums;
- (NSArray *)allComposers;
- (NSArray *)allGenres;
- (NSArray *)allPlaylists;

- (DTAlbum *)albumWithTitle:(NSString *)albumTitle artist:(DTArtist *)artist;
- (DTArtist *)artistNamed:(NSString *)artistName;
- (DTGenre *)genreNamed:(NSString *)genreName;
- (DTComposer *)composerNamed:(NSString *)composerName;
- (DTSong *)songWithIdentifier:(NSNumber *)identifier;
@end
