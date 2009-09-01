//
//  DTGenresViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 01.09.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTGenresViewController.h"
#import "DTGenre.h"
#import "DTArtistsViewController.h"

@implementation DTGenresViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	
	cell.textLabel.text = [[items objectAtIndex:indexPath.row] name];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	DTGenre *genre = [items objectAtIndex:indexPath.row];
	DTArtistsViewController *avc = [[DTArtistsViewController alloc] initWithItems:[[genre.artists allObjects] sortedArrayUsingSelector:@selector(compareTrackNumber:)]];
	[self.navigationController pushViewController:avc animated:YES];
	[avc release];
}

@end
