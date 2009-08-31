//
//  DTMusicViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTMusicViewController.h"


@implementation DTMusicViewController


- (id)initWithItems:(NSArray *)someItems {
	
	if (!(self = [self initWithStyle:UITableViewStylePlain])) return nil;
	
	items = [someItems retain];
	
	return self;
}

- (void)dealloc {
	[items release];
    [super dealloc];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items count];
}

@end

