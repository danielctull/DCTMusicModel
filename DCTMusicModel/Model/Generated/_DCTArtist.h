// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTArtist.h instead.

#import <CoreData/CoreData.h>


extern const struct DCTArtistAttributes {
	__unsafe_unretained NSString *name;
} DCTArtistAttributes;

extern const struct DCTArtistRelationships {
	__unsafe_unretained NSString *albums;
	__unsafe_unretained NSString *genres;
	__unsafe_unretained NSString *songs;
} DCTArtistRelationships;

extern const struct DCTArtistFetchedProperties {
} DCTArtistFetchedProperties;

@class DCTAlbum;
@class DCTGenre;
@class DCTPlaylist;



@interface DCTArtistID : NSManagedObjectID {}
@end

@interface _DCTArtist : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DCTArtistID*)objectID;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* albums;

- (NSMutableSet*)albumsSet;




@property (nonatomic, strong) NSSet* genres;

- (NSMutableSet*)genresSet;




@property (nonatomic, strong) NSSet* songs;

- (NSMutableSet*)songsSet;





#if TARGET_OS_IPHONE


- (NSFetchedResultsController *)newAlbumsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;



- (NSFetchedResultsController *)newGenresFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;


#endif

@end

@interface _DCTArtist (CoreDataGeneratedAccessors)

- (void)addAlbums:(NSSet*)value_;
- (void)removeAlbums:(NSSet*)value_;
- (void)addAlbumsObject:(DCTAlbum*)value_;
- (void)removeAlbumsObject:(DCTAlbum*)value_;

- (void)addGenres:(NSSet*)value_;
- (void)removeGenres:(NSSet*)value_;
- (void)addGenresObject:(DCTGenre*)value_;
- (void)removeGenresObject:(DCTGenre*)value_;

- (void)addSongs:(NSSet*)value_;
- (void)removeSongs:(NSSet*)value_;
- (void)addSongsObject:(DCTPlaylist*)value_;
- (void)removeSongsObject:(DCTPlaylist*)value_;

@end

@interface _DCTArtist (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveAlbums;
- (void)setPrimitiveAlbums:(NSMutableSet*)value;



- (NSMutableSet*)primitiveGenres;
- (void)setPrimitiveGenres:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSongs;
- (void)setPrimitiveSongs:(NSMutableSet*)value;


@end
