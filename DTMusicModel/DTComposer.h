//
//  DTComposer.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DTAlbum;
@class DTSong;

@interface DTComposer :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* songs;
@property (nonatomic, retain) NSSet* albums;

@end


@interface DTComposer (CoreDataGeneratedAccessors)
- (void)addSongsObject:(DTSong *)value;
- (void)removeSongsObject:(DTSong *)value;
- (void)addSongs:(NSSet *)value;
- (void)removeSongs:(NSSet *)value;

- (void)addAlbumsObject:(DTAlbum *)value;
- (void)removeAlbumsObject:(DTAlbum *)value;
- (void)addAlbums:(NSSet *)value;
- (void)removeAlbums:(NSSet *)value;

@end

