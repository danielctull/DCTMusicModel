//
//  DTUpdatingViewController.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DTUpdatingViewController : UIViewController {
	UIProgressView *progressView;
}

@property (nonatomic, retain) IBOutlet UIProgressView *progressView;

@end
