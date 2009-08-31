//
//  DTMenuViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTMenuViewController.h"

@implementation DTMenuViewController


- (id)init{
    if (!(self = [super initWithStyle:UITableViewStylePlain])) return nil;
	
	items = [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MusicMenu" ofType:@"plist"]] retain];
	
	self.title = @"DTMusicModel Demo";
	
    return self;
}

- (void)dealloc {
	[items release];
    [super dealloc];
}

#pragma mark UITableViewDataSource/Delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//musicController
	
//	DTArtistsViewController *avc = [[DTArtistsViewController alloc] initWithItems:];
	
}

@end

