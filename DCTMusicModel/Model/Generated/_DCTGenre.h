// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTGenre.h instead.

#import <CoreData/CoreData.h>


extern const struct DCTGenreAttributes {
	__unsafe_unretained NSString *name;
} DCTGenreAttributes;

extern const struct DCTGenreRelationships {
	__unsafe_unretained NSString *artists;
	__unsafe_unretained NSString *songs;
} DCTGenreRelationships;

extern const struct DCTGenreFetchedProperties {
} DCTGenreFetchedProperties;

@class DCTArtist;
@class DCTSong;



@interface DCTGenreID : NSManagedObjectID {}
@end

@interface _DCTGenre : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DCTGenreID*)objectID;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* artists;

- (NSMutableSet*)artistsSet;




@property (nonatomic, strong) NSSet* songs;

- (NSMutableSet*)songsSet;





#if TARGET_OS_IPHONE


- (NSFetchedResultsController *)newArtistsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;


#endif

@end

@interface _DCTGenre (CoreDataGeneratedAccessors)

- (void)addArtists:(NSSet*)value_;
- (void)removeArtists:(NSSet*)value_;
- (void)addArtistsObject:(DCTArtist*)value_;
- (void)removeArtistsObject:(DCTArtist*)value_;

- (void)addSongs:(NSSet*)value_;
- (void)removeSongs:(NSSet*)value_;
- (void)addSongsObject:(DCTSong*)value_;
- (void)removeSongsObject:(DCTSong*)value_;

@end

@interface _DCTGenre (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveArtists;
- (void)setPrimitiveArtists:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSongs;
- (void)setPrimitiveSongs:(NSMutableSet*)value;


@end
