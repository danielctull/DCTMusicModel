// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTDataInformation.m instead.

#import "_DCTDataInformation.h"

const struct DCTDataInformationAttributes DCTDataInformationAttributes = {
	.lastUpdated = @"lastUpdated",
};

const struct DCTDataInformationRelationships DCTDataInformationRelationships = {
};

const struct DCTDataInformationFetchedProperties DCTDataInformationFetchedProperties = {
};

@implementation DCTDataInformationID
@end

@implementation _DCTDataInformation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DCTDataInformation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DCTDataInformation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DCTDataInformation" inManagedObjectContext:moc_];
}

- (DCTDataInformationID*)objectID {
	return (DCTDataInformationID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic lastUpdated;











#if TARGET_OS_IPHONE

#endif

@end
