// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTAlbum.h instead.

#import <CoreData/CoreData.h>


extern const struct DCTAlbumAttributes {
	__unsafe_unretained NSString *discCount;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *trackCount;
} DCTAlbumAttributes;

extern const struct DCTAlbumRelationships {
	__unsafe_unretained NSString *artist;
	__unsafe_unretained NSString *composers;
	__unsafe_unretained NSString *songs;
} DCTAlbumRelationships;

extern const struct DCTAlbumFetchedProperties {
} DCTAlbumFetchedProperties;

@class DCTArtist;
@class DCTComposer;
@class DCTSong;





@interface DCTAlbumID : NSManagedObjectID {}
@end

@interface _DCTAlbum : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DCTAlbumID*)objectID;




@property (nonatomic, strong) NSNumber* discCount;


@property int16_t discCountValue;
- (int16_t)discCountValue;
- (void)setDiscCountValue:(int16_t)value_;

//- (BOOL)validateDiscCount:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* trackCount;


@property int16_t trackCountValue;
- (int16_t)trackCountValue;
- (void)setTrackCountValue:(int16_t)value_;

//- (BOOL)validateTrackCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) DCTArtist* artist;

//- (BOOL)validateArtist:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* composers;

- (NSMutableSet*)composersSet;




@property (nonatomic, strong) NSSet* songs;

- (NSMutableSet*)songsSet;





#if TARGET_OS_IPHONE




- (NSFetchedResultsController *)newComposersFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;



- (NSFetchedResultsController *)newSongsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;


#endif

@end

@interface _DCTAlbum (CoreDataGeneratedAccessors)

- (void)addComposers:(NSSet*)value_;
- (void)removeComposers:(NSSet*)value_;
- (void)addComposersObject:(DCTComposer*)value_;
- (void)removeComposersObject:(DCTComposer*)value_;

- (void)addSongs:(NSSet*)value_;
- (void)removeSongs:(NSSet*)value_;
- (void)addSongsObject:(DCTSong*)value_;
- (void)removeSongsObject:(DCTSong*)value_;

@end

@interface _DCTAlbum (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveDiscCount;
- (void)setPrimitiveDiscCount:(NSNumber*)value;

- (int16_t)primitiveDiscCountValue;
- (void)setPrimitiveDiscCountValue:(int16_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveTrackCount;
- (void)setPrimitiveTrackCount:(NSNumber*)value;

- (int16_t)primitiveTrackCountValue;
- (void)setPrimitiveTrackCountValue:(int16_t)value_;





- (DCTArtist*)primitiveArtist;
- (void)setPrimitiveArtist:(DCTArtist*)value;



- (NSMutableSet*)primitiveComposers;
- (void)setPrimitiveComposers:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSongs;
- (void)setPrimitiveSongs:(NSMutableSet*)value;


@end
