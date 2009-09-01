//
//  DTSongsViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 01.09.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTSongsViewController.h"


@implementation DTSongsViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	
	cell.textLabel.text = [[items objectAtIndex:indexPath.row] title];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	
}

@end
