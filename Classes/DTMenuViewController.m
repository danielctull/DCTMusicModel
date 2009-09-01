//
//  DTMenuViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTMenuViewController.h"
#import "DTLicenseAgreementViewController.h"
#import "DTArtistsViewController.h"
#import "DTAlbumsViewController.h"
#import "DTSongsViewController.h"
#import "DTGenresViewController.h"
#import "DTPlaylistsViewController.h"

@implementation DTMenuViewController

- (id)init{
    if (!(self = [super initWithStyle:UITableViewStylePlain])) return nil;
	
	items = [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MusicMenu" ofType:@"plist"]] retain];
	
	musicModelController = [[DTMusicModelController alloc] init];
	
	self.title = @"DTMusicModel";
	
    return self;
}

- (void)dealloc {
	[musicModelController release];
	[items release];
    [super dealloc];
}

#pragma mark UITableViewDataSource/Delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return nil;
	if (section == 0)
		return @"Legal Stuff";
	else
		return @"Music";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section == 1)
		return nil;
	else
		return @"©2009 Daniel Tull danieltull.co.uk";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0)
		return 1;
	else
		return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    
	if (indexPath.section == 0)
		cell.textLabel.text = @"License Agreement";
	else
		cell.textLabel.text = [items objectAtIndex:indexPath.row];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *cellTitle = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
	
	UIViewController *vc = nil;
	
	if (indexPath.section == 0) {
		vc = [[DTLicenseAgreementViewController alloc] init];
		[self.navigationController pushViewController:vc animated:YES];
		[vc release];
		return;
	} else if ([cellTitle isEqualToString:@"Artists"]) {
		vc = [[DTArtistsViewController alloc] initWithItems:[musicModelController allArtists]];
	} else if ([cellTitle isEqualToString:@"Albums"]) {
		vc = [[DTAlbumsViewController alloc] initWithItems:[musicModelController allAlbums]];
	} else if ([cellTitle isEqualToString:@"Playlists"]) {
		vc = [[DTPlaylistsViewController alloc] initWithItems:[musicModelController allPlaylists]];
	} else if ([cellTitle isEqualToString:@"Genres"]) {
		vc = [[DTGenresViewController alloc] initWithItems:[musicModelController allGenres]];
	} else if ([cellTitle isEqualToString:@"Songs"]) {
		vc = [[DTSongsViewController alloc] initWithItems:[musicModelController allSongs]];
	} else if ([cellTitle isEqualToString:@"Composers"]) {
		vc = [[DTSongsViewController alloc] initWithItems:[musicModelController allComposers]];
	} else {
		return;
	}
	
	vc.title = cellTitle;
	[self.navigationController pushViewController:vc animated:YES];
	[vc release];
	
	
}

@end

