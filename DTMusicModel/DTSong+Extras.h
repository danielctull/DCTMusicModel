//
//  DTSong+MPMediaItemExtras.h
//  iPod
//
//  Created by Daniel Tull on 08.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTSong.h"
#import <MediaPlayer/MediaPlayer.h>

@interface DTSong (Extras)
- (UIImage *)artworkImageWithSize:(CGSize)imageSize;
- (MPMediaItem *)mediaItem;

- (NSComparisonResult)compare:(DTSong *)song;
- (NSComparisonResult)compareTrackNumber:(DTSong *)song;
@end
