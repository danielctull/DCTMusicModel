// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTPlaylist.h instead.

#import <CoreData/CoreData.h>


extern const struct DCTPlaylistAttributes {
	__unsafe_unretained NSString *name;
} DCTPlaylistAttributes;

extern const struct DCTPlaylistRelationships {
	__unsafe_unretained NSString *songs;
} DCTPlaylistRelationships;

extern const struct DCTPlaylistFetchedProperties {
} DCTPlaylistFetchedProperties;

@class DCTSong;



@interface DCTPlaylistID : NSManagedObjectID {}
@end

@interface _DCTPlaylist : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DCTPlaylistID*)objectID;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* songs;

- (NSMutableSet*)songsSet;





#if TARGET_OS_IPHONE


- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;


#endif

@end

@interface _DCTPlaylist (CoreDataGeneratedAccessors)

- (void)addSongs:(NSSet*)value_;
- (void)removeSongs:(NSSet*)value_;
- (void)addSongsObject:(DCTSong*)value_;
- (void)removeSongsObject:(DCTSong*)value_;

@end

@interface _DCTPlaylist (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveSongs;
- (void)setPrimitiveSongs:(NSMutableSet*)value;


@end
