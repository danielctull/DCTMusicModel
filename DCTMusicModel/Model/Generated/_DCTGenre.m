// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTGenre.m instead.

#import "_DCTGenre.h"

const struct DCTGenreAttributes DCTGenreAttributes = {
	.name = @"name",
};

const struct DCTGenreRelationships DCTGenreRelationships = {
	.artists = @"artists",
	.songs = @"songs",
};

const struct DCTGenreFetchedProperties DCTGenreFetchedProperties = {
};

@implementation DCTGenreID
@end

@implementation _DCTGenre

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DCTGenre" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DCTGenre";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DCTGenre" inManagedObjectContext:moc_];
}

- (DCTGenreID*)objectID {
	return (DCTGenreID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic artists;

	
- (NSMutableSet*)artistsSet {
	[self willAccessValueForKey:@"artists"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"artists"];
  
	[self didAccessValueForKey:@"artists"];
	return result;
}
	

@dynamic songs;

	
- (NSMutableSet*)songsSet {
	[self willAccessValueForKey:@"songs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"songs"];
  
	[self didAccessValueForKey:@"songs"];
	return result;
}
	






#if TARGET_OS_IPHONE


- (NSFetchedResultsController *)newArtistsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTArtist" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"genres CONTAINS %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTSong" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"genre == %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}


#endif

@end
