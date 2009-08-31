//
//  DTArtist.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DTAlbum;
@class DTGenre;
@class DTSong;

@interface DTArtist :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* genres;
@property (nonatomic, retain) NSSet* albums;
@property (nonatomic, retain) NSSet* songs;

@end


@interface DTArtist (CoreDataGeneratedAccessors)
- (void)addGenresObject:(DTGenre *)value;
- (void)removeGenresObject:(DTGenre *)value;
- (void)addGenres:(NSSet *)value;
- (void)removeGenres:(NSSet *)value;

- (void)addAlbumsObject:(DTAlbum *)value;
- (void)removeAlbumsObject:(DTAlbum *)value;
- (void)addAlbums:(NSSet *)value;
- (void)removeAlbums:(NSSet *)value;

- (void)addSongsObject:(DTSong *)value;
- (void)removeSongsObject:(DTSong *)value;
- (void)addSongs:(NSSet *)value;
- (void)removeSongs:(NSSet *)value;

@end

