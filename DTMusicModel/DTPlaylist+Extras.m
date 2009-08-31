//
//  DTPlaylist+Extras.m
//  iPod
//
//  Created by Daniel Tull on 09.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTPlaylist+Extras.h"


@implementation DTPlaylist (Extras)

- (NSComparisonResult)compare:(DTPlaylist *)playlist {
	return [self.name compare:playlist.name];
}

@end
