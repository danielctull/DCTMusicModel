//
//  DTAlbum.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DTArtist;
@class DTComposer;
@class DTSong;

@interface DTAlbum :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * discCount;
@property (nonatomic, retain) NSNumber * trackCount;
@property (nonatomic, retain) NSSet* composers;
@property (nonatomic, retain) NSSet* songs;
@property (nonatomic, retain) DTArtist * artist;

@end


@interface DTAlbum (CoreDataGeneratedAccessors)
- (void)addComposersObject:(DTComposer *)value;
- (void)removeComposersObject:(DTComposer *)value;
- (void)addComposers:(NSSet *)value;
- (void)removeComposers:(NSSet *)value;

- (void)addSongsObject:(DTSong *)value;
- (void)removeSongsObject:(DTSong *)value;
- (void)addSongs:(NSSet *)value;
- (void)removeSongs:(NSSet *)value;

@end

