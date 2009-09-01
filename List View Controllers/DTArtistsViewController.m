//
//  DTArtistsViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTArtistsViewController.h"
#import "DTAlbumsViewController.h"
#import "DTSongsViewController.h"
#import "DTArtist.h"
#import "DTAlbum.h"

@implementation DTArtistsViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	
	cell.textLabel.text = [[items objectAtIndex:indexPath.row] name];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	DTArtist *artist = [items objectAtIndex:indexPath.row];
	NSArray *albums = [artist.albums allObjects];
	
	if ([albums count] == 1) {
		DTAlbum *album = [albums objectAtIndex:0];
		DTSongsViewController *svc = [[DTSongsViewController alloc] initWithItems:[[album.songs allObjects] sortedArrayUsingSelector:@selector(compareTrackNumber:)]];
		[self.navigationController pushViewController:svc animated:YES];
		[svc release];
	} else {
		DTAlbumsViewController *alvc = [[DTAlbumsViewController alloc] initWithItems:[albums sortedArrayUsingSelector:@selector(compare:)]];
		[self.navigationController pushViewController:alvc animated:YES];
		[alvc release];
	}
}

@end

