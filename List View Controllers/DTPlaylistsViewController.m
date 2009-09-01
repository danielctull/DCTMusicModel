//
//  DTPlaylistsViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 01.09.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTPlaylistsViewController.h"
#import "DTPlaylist.h"
#import "DTSongsViewController.h"

@implementation DTPlaylistsViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	
	cell.textLabel.text = [[items objectAtIndex:indexPath.row] name];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	DTPlaylist *playlist = [items objectAtIndex:indexPath.row];
	DTSongsViewController *svc = [[DTSongsViewController alloc] initWithItems:[[playlist.songs allObjects] sortedArrayUsingSelector:@selector(compare:)]];
	svc.title = playlist.name;
	[self.navigationController pushViewController:svc animated:YES];
	[svc release];
}

@end
