//
//  DTAlbum+Extras.m
//  iPod
//
//  Created by Daniel Tull on 09.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTAlbum+Extras.h"


@implementation DTAlbum (Extras)

- (NSComparisonResult)compare:(DTAlbum *)album {
	return [self.title compare:album.title];
}

@end
