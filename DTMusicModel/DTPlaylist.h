//
//  DTPlaylist.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DTSong;

@interface DTPlaylist :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* songs;

@end


@interface DTPlaylist (CoreDataGeneratedAccessors)
- (void)addSongsObject:(DTSong *)value;
- (void)removeSongsObject:(DTSong *)value;
- (void)addSongs:(NSSet *)value;
- (void)removeSongs:(NSSet *)value;

@end

