//
//  DTUpdatingViewController.m
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright 2009 Daniel Tull. All rights reserved.
//

#import "DTUpdatingViewController.h"
#import "DTMusicModelController.h"

@implementation DTUpdatingViewController

@synthesize progressView;

- (id)init {
    return [self initWithNibName:@"DTUpdatingView" bundle:nil];
}

- (void)dealloc {
	[progressView release];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

- (void)viewDidUnload {
	progressView = nil;
}

- (void)viewDidLoad {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(musicModelUpdatingProgress:) name:DTMusicModelUpdatingProgressNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(musicModelFinishedUpdating:) name:DTMusicModelDidEndUpdatingNotification object:nil];
	[super viewDidLoad];
}

- (void)mainThreadMusicModelUpdatingProgress:(NSNumber *)amount {
	self.progressView.progress = [amount floatValue]/100.0;
}

- (void)musicModelUpdatingProgress:(NSNotification *)notification {
	[self performSelectorOnMainThread:@selector(mainThreadMusicModelUpdatingProgress:) withObject:[[notification userInfo] objectForKey:DTMusicModelUpdatingProgressPercentageKey] waitUntilDone:YES];
}

- (void)mainThreadMusicModelFinishedUpdating {
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (void)musicModelFinishedUpdating:(NSNotification *)notification {
	[self performSelectorOnMainThread:@selector(mainThreadMusicModelFinishedUpdating) withObject:nil waitUntilDone:YES];
}

@end
