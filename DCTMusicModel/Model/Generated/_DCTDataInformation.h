// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTDataInformation.h instead.

#import <CoreData/CoreData.h>


extern const struct DCTDataInformationAttributes {
	__unsafe_unretained NSString *lastUpdated;
} DCTDataInformationAttributes;

extern const struct DCTDataInformationRelationships {
} DCTDataInformationRelationships;

extern const struct DCTDataInformationFetchedProperties {
} DCTDataInformationFetchedProperties;




@interface DCTDataInformationID : NSManagedObjectID {}
@end

@interface _DCTDataInformation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DCTDataInformationID*)objectID;




@property (nonatomic, strong) NSDate* lastUpdated;


//- (BOOL)validateLastUpdated:(id*)value_ error:(NSError**)error_;






#if TARGET_OS_IPHONE

#endif

@end

@interface _DCTDataInformation (CoreDataGeneratedAccessors)

@end

@interface _DCTDataInformation (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveLastUpdated;
- (void)setPrimitiveLastUpdated:(NSDate*)value;




@end
