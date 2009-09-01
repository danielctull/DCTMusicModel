//
//  DTMenuViewController.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTMusicModelController.h"

@interface DTMenuViewController : UITableViewController {
	NSArray *items;
	DTMusicModelController *musicModelController;
}

@end
