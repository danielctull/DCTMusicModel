//
//  DTGenre.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DTArtist;
@class DTSong;

@interface DTGenre :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* songs;
@property (nonatomic, retain) NSSet* artists;

@end


@interface DTGenre (CoreDataGeneratedAccessors)
- (void)addSongsObject:(DTSong *)value;
- (void)removeSongsObject:(DTSong *)value;
- (void)addSongs:(NSSet *)value;
- (void)removeSongs:(NSSet *)value;

- (void)addArtistsObject:(DTArtist *)value;
- (void)removeArtistsObject:(DTArtist *)value;
- (void)addArtists:(NSSet *)value;
- (void)removeArtists:(NSSet *)value;

@end

