// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTComposer.h instead.

#import <CoreData/CoreData.h>


extern const struct DCTComposerAttributes {
	__unsafe_unretained NSString *name;
} DCTComposerAttributes;

extern const struct DCTComposerRelationships {
	__unsafe_unretained NSString *albums;
	__unsafe_unretained NSString *songs;
} DCTComposerRelationships;

extern const struct DCTComposerFetchedProperties {
} DCTComposerFetchedProperties;

@class DCTAlbum;
@class DCTPlaylist;



@interface DCTComposerID : NSManagedObjectID {}
@end

@interface _DCTComposer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DCTComposerID*)objectID;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* albums;

- (NSMutableSet*)albumsSet;




@property (nonatomic, strong) NSSet* songs;

- (NSMutableSet*)songsSet;





#if TARGET_OS_IPHONE


- (NSFetchedResultsController *)newAlbumsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;


#endif

@end

@interface _DCTComposer (CoreDataGeneratedAccessors)

- (void)addAlbums:(NSSet*)value_;
- (void)removeAlbums:(NSSet*)value_;
- (void)addAlbumsObject:(DCTAlbum*)value_;
- (void)removeAlbumsObject:(DCTAlbum*)value_;

- (void)addSongs:(NSSet*)value_;
- (void)removeSongs:(NSSet*)value_;
- (void)addSongsObject:(DCTPlaylist*)value_;
- (void)removeSongsObject:(DCTPlaylist*)value_;

@end

@interface _DCTComposer (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveAlbums;
- (void)setPrimitiveAlbums:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSongs;
- (void)setPrimitiveSongs:(NSMutableSet*)value;


@end
