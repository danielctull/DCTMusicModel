// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTPlaylist.m instead.

#import "_DCTPlaylist.h"

const struct DCTPlaylistAttributes DCTPlaylistAttributes = {
	.discNumber = @"discNumber",
	.duration = @"duration",
	.identifier = @"identifier",
	.lyrics = @"lyrics",
	.rating = @"rating",
	.title = @"title",
	.trackNumber = @"trackNumber",
};

const struct DCTPlaylistRelationships DCTPlaylistRelationships = {
	.album = @"album",
	.artist = @"artist",
	.composer = @"composer",
	.genre = @"genre",
	.playlists = @"playlists",
};

const struct DCTPlaylistFetchedProperties DCTPlaylistFetchedProperties = {
};

@implementation DCTPlaylistID
@end

@implementation _DCTPlaylist

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DCTSong" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DCTSong";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DCTSong" inManagedObjectContext:moc_];
}

- (DCTPlaylistID*)objectID {
	return (DCTPlaylistID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"discNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"discNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"durationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"duration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"identifierValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"identifier"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"ratingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rating"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"trackNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"trackNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic discNumber;



- (int16_t)discNumberValue {
	NSNumber *result = [self discNumber];
	return [result shortValue];
}

- (void)setDiscNumberValue:(int16_t)value_ {
	[self setDiscNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveDiscNumberValue {
	NSNumber *result = [self primitiveDiscNumber];
	return [result shortValue];
}

- (void)setPrimitiveDiscNumberValue:(int16_t)value_ {
	[self setPrimitiveDiscNumber:[NSNumber numberWithShort:value_]];
}





@dynamic duration;



- (float)durationValue {
	NSNumber *result = [self duration];
	return [result floatValue];
}

- (void)setDurationValue:(float)value_ {
	[self setDuration:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveDurationValue {
	NSNumber *result = [self primitiveDuration];
	return [result floatValue];
}

- (void)setPrimitiveDurationValue:(float)value_ {
	[self setPrimitiveDuration:[NSNumber numberWithFloat:value_]];
}





@dynamic identifier;



- (int64_t)identifierValue {
	NSNumber *result = [self identifier];
	return [result longLongValue];
}

- (void)setIdentifierValue:(int64_t)value_ {
	[self setIdentifier:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveIdentifierValue {
	NSNumber *result = [self primitiveIdentifier];
	return [result longLongValue];
}

- (void)setPrimitiveIdentifierValue:(int64_t)value_ {
	[self setPrimitiveIdentifier:[NSNumber numberWithLongLong:value_]];
}





@dynamic lyrics;






@dynamic rating;



- (int16_t)ratingValue {
	NSNumber *result = [self rating];
	return [result shortValue];
}

- (void)setRatingValue:(int16_t)value_ {
	[self setRating:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRatingValue {
	NSNumber *result = [self primitiveRating];
	return [result shortValue];
}

- (void)setPrimitiveRatingValue:(int16_t)value_ {
	[self setPrimitiveRating:[NSNumber numberWithShort:value_]];
}





@dynamic title;






@dynamic trackNumber;



- (int16_t)trackNumberValue {
	NSNumber *result = [self trackNumber];
	return [result shortValue];
}

- (void)setTrackNumberValue:(int16_t)value_ {
	[self setTrackNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveTrackNumberValue {
	NSNumber *result = [self primitiveTrackNumber];
	return [result shortValue];
}

- (void)setPrimitiveTrackNumberValue:(int16_t)value_ {
	[self setPrimitiveTrackNumber:[NSNumber numberWithShort:value_]];
}





@dynamic album;

	

@dynamic artist;

	

@dynamic composer;

	

@dynamic genre;

	

@dynamic playlists;

	
- (NSMutableSet*)playlistsSet {
	[self willAccessValueForKey:@"playlists"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"playlists"];
  
	[self didAccessValueForKey:@"playlists"];
	return result;
}
	






#if TARGET_OS_IPHONE










- (NSFetchedResultsController *)newPlaylistsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors {
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	
	fetchRequest.entity = [NSEntityDescription entityForName:@"DCTPlaylist" inManagedObjectContext:self.managedObjectContext];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"songs CONTAINS %@", self];
	fetchRequest.sortDescriptors = sortDescriptors;
	
	return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											   managedObjectContext:self.managedObjectContext
												 sectionNameKeyPath:nil
														  cacheName:nil];
}


#endif

@end
