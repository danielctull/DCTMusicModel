//
//  DTSong.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DTAlbum;
@class DTArtist;
@class DTComposer;
@class DTGenre;
@class DTPlaylist;

@interface DTSong :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSNumber * discNumber;
@property (nonatomic, retain) NSNumber * trackNumber;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSString * lyrics;
@property (nonatomic, retain) NSSet* playlists;
@property (nonatomic, retain) DTAlbum * album;
@property (nonatomic, retain) DTArtist * artist;
@property (nonatomic, retain) DTGenre * genre;
@property (nonatomic, retain) DTComposer * composer;

@end


@interface DTSong (CoreDataGeneratedAccessors)
- (void)addPlaylistsObject:(DTPlaylist *)value;
- (void)removePlaylistsObject:(DTPlaylist *)value;
- (void)addPlaylists:(NSSet *)value;
- (void)removePlaylists:(NSSet *)value;

@end

