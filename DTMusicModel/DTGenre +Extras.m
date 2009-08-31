//
//  DTGenre+Extras.m
//  iPod
//
//  Created by Daniel Tull on 09.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTGenre+Extras.h"


@implementation DTGenre (Extras)

- (NSComparisonResult)compare:(DTGenre *)genre {
	return [self.name compare:genre.name];
}

@end
