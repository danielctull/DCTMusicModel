// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTPlaylist.m instead.

#import "_DCTPlaylist.h"

const struct DCTPlaylistAttributes DCTPlaylistAttributes = {
	.name = @"name",
};

const struct DCTPlaylistRelationships DCTPlaylistRelationships = {
	.songs = @"songs",
};

const struct DCTPlaylistFetchedProperties DCTPlaylistFetchedProperties = {
};

@implementation DCTPlaylistID
@end

@implementation _DCTPlaylist

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DCTPlaylist" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DCTPlaylist";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DCTPlaylist" inManagedObjectContext:moc_];
}

- (DCTPlaylistID*)objectID {
	return (DCTPlaylistID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic songs;

	
- (NSMutableSet*)songsSet {
	[self willAccessValueForKey:@"songs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"songs"];
  
	[self didAccessValueForKey:@"songs"];
	return result;
}
	






#if TARGET_OS_IPHONE


- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTSong" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"playlists CONTAINS %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}


#endif

@end
