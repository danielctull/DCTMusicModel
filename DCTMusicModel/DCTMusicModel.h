//
//  DCTMusicModel.h
//  DCTMusicModel
//
//  Created by Daniel Tull on 19.07.2012.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "DCTSong.h"
#import "DCTArtist.h"
#import "DCTAlbum.h"
#import "DCTPlaylist.h"
#import "DCTGenre.h"
#import "DCTComposer.h"

@interface DCTMusicModel : NSObject

+ (NSBundle *)bundle;
+ (NSURL *)managedObjectModelURL;

@property (readonly) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, readonly, getter=isImporting) BOOL importing;
@property (nonatomic, strong) void (^importHandler)(CGFloat percentComplete, BOOL complete);

@end
