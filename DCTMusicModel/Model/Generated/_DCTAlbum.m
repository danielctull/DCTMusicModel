// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTAlbum.m instead.

#import "_DCTAlbum.h"

const struct DCTAlbumAttributes DCTAlbumAttributes = {
	.discCount = @"discCount",
	.title = @"title",
	.trackCount = @"trackCount",
};

const struct DCTAlbumRelationships DCTAlbumRelationships = {
	.artist = @"artist",
	.composers = @"composers",
	.songs = @"songs",
};

const struct DCTAlbumFetchedProperties DCTAlbumFetchedProperties = {
};

@implementation DCTAlbumID
@end

@implementation _DCTAlbum

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DCTAlbum" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DCTAlbum";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DCTAlbum" inManagedObjectContext:moc_];
}

- (DCTAlbumID*)objectID {
	return (DCTAlbumID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"discCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"trackCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"trackCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic discCount;



- (int16_t)discCountValue {
	NSNumber *result = [self discCount];
	return [result shortValue];
}

- (void)setDiscCountValue:(int16_t)value_ {
	[self setDiscCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveDiscCountValue {
	NSNumber *result = [self primitiveDiscCount];
	return [result shortValue];
}

- (void)setPrimitiveDiscCountValue:(int16_t)value_ {
	[self setPrimitiveDiscCount:[NSNumber numberWithShort:value_]];
}





@dynamic title;






@dynamic trackCount;



- (int16_t)trackCountValue {
	NSNumber *result = [self trackCount];
	return [result shortValue];
}

- (void)setTrackCountValue:(int16_t)value_ {
	[self setTrackCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveTrackCountValue {
	NSNumber *result = [self primitiveTrackCount];
	return [result shortValue];
}

- (void)setPrimitiveTrackCountValue:(int16_t)value_ {
	[self setPrimitiveTrackCount:[NSNumber numberWithShort:value_]];
}





@dynamic artist;

	

@dynamic composers;

	
- (NSMutableSet*)composersSet {
	[self willAccessValueForKey:@"composers"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"composers"];
  
	[self didAccessValueForKey:@"composers"];
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




- (NSFetchedResultsController *)newComposersFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTComposer" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"albums CONTAINS %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTSong" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"album == %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}


#endif

@end
