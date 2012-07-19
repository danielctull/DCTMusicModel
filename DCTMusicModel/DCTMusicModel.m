//
//  DCTMusicModel.m
//  DCTMusicModel
//
//  Created by Daniel Tull on 19.07.2012.
//
//

#import "DCTMusicModel.h"
#import <DCTCoreDataStack/DCTCoreDataStack.h>

static NSBundle *_bundle = nil;

@implementation DCTMusicModel {
	__strong DCTCoreDataStack *_coreDataStack;
}

- (id)init {
	self = [super init];
	if (!self) return nil;
	
	NSURL *storeURL = [[[self class] _applicationDocumentsDirectory] URLByAppendingPathComponent:@"DCTMusicModel"];
	NSURL *modelURL = [[self class] managedObjectModelURL];
	
	_coreDataStack = [[DCTCoreDataStack alloc] initWithStoreURL:storeURL
													  storeType:nil
												   storeOptions:nil
											 modelConfiguration:nil
													   modelURL:modelURL];
	
	return self;
}

- (NSManagedObjectContext *)managedObjectContext {
	return _coreDataStack.managedObjectContext;
}

+ (NSURL *)managedObjectModelURL {
	return [[self bundle] URLForResource:@"DCTMusicModel" withExtension:@"momd"];
}

+ (NSBundle *)bundle {
	
	static dispatch_once_t bundleToken;
	dispatch_once(&bundleToken, ^{
		NSDirectoryEnumerator *enumerator = [[NSFileManager new] enumeratorAtURL:[[NSBundle mainBundle] bundleURL]
													  includingPropertiesForKeys:nil
																		 options:NSDirectoryEnumerationSkipsHiddenFiles
																	errorHandler:NULL];
		
		for (NSURL *URL in enumerator)
			if ([[URL lastPathComponent] isEqualToString:@"DCTMusicModel.bundle"])
				_bundle = [NSBundle bundleWithURL:URL];
	});
	
	return _bundle;
}

+ (NSURL *)_applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
