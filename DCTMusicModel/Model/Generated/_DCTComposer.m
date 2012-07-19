// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTComposer.m instead.

#import "_DCTComposer.h"

const struct DCTComposerAttributes DCTComposerAttributes = {
	.name = @"name",
};

const struct DCTComposerRelationships DCTComposerRelationships = {
	.albums = @"albums",
	.songs = @"songs",
};

const struct DCTComposerFetchedProperties DCTComposerFetchedProperties = {
};

@implementation DCTComposerID
@end

@implementation _DCTComposer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DCTComposer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DCTComposer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DCTComposer" inManagedObjectContext:moc_];
}

- (DCTComposerID*)objectID {
	return (DCTComposerID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic albums;

	
- (NSMutableSet*)albumsSet {
	[self willAccessValueForKey:@"albums"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"albums"];
  
	[self didAccessValueForKey:@"albums"];
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


- (NSFetchedResultsController *)newAlbumsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTAlbum" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"composers CONTAINS %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTSong" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"composer == %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}


#endif

@end
