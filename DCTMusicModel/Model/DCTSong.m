#import "DCTSong.h"

@implementation DCTSong

- (MPMediaItem *)mediaItem {
	MPMediaQuery *mediaQuery = [[MPMediaQuery alloc] init];
	MPMediaPropertyPredicate *predicate = [MPMediaPropertyPredicate predicateWithValue:self.identifier forProperty:MPMediaItemPropertyPersistentID];
	[mediaQuery addFilterPredicate:predicate];
	return [mediaQuery.items lastObject];
}

@end
