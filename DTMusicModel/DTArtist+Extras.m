//
//  DTArtist+Sorting.m
//  iPod
//
//  Created by Daniel Tull on 09.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTArtist+Extras.h"

@implementation DTArtist (Extras)
- (NSComparisonResult)compare:(DTArtist *)artist {
	return [self.name compare:artist.name];
}
@end
