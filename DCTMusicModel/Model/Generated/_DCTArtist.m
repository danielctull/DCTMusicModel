// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTArtist.m instead.

#import "_DCTArtist.h"

const struct DCTArtistAttributes DCTArtistAttributes = {
	.name = @"name",
};

const struct DCTArtistRelationships DCTArtistRelationships = {
	.albums = @"albums",
	.genres = @"genres",
	.songs = @"songs",
};

const struct DCTArtistFetchedProperties DCTArtistFetchedProperties = {
};

@implementation DCTArtistID
@end

@implementation _DCTArtist

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DCTArtist" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DCTArtist";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DCTArtist" inManagedObjectContext:moc_];
}

- (DCTArtistID*)objectID {
	return (DCTArtistID*)[super objectID];
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
	

@dynamic genres;

	
- (NSMutableSet*)genresSet {
	[self willAccessValueForKey:@"genres"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"genres"];
  
	[self didAccessValueForKey:@"genres"];
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
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"artist == %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}



- (NSFetchedResultsController *)newGenresFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTGenre" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"artists CONTAINS %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTSong" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"artist == %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}


#endif

@end
