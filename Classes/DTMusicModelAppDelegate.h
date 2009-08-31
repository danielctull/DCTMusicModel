//
//  DTMusicModelAppDelegate.h
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright Daniel Tull 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTMusicModelAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

