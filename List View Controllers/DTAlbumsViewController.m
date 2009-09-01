//
//  DTAlbumsViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 01.09.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTAlbumsViewController.h"
#import "DTAlbum.h"
#import "DTSongsViewController.h"

@implementation DTAlbumsViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	
	cell.textLabel.text = [[items objectAtIndex:indexPath.row] title];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	DTAlbum *album = [items objectAtIndex:indexPath.row];
	DTSongsViewController *svc = [[DTSongsViewController alloc] initWithItems:[[album.songs allObjects] sortedArrayUsingSelector:@selector(compareTrackNumber:)]];
	svc.title = album.title;
	[self.navigationController pushViewController:svc animated:YES];
	[svc release];
}

@end
