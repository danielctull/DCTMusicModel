// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DCTSong.h instead.

#import <CoreData/CoreData.h>


extern const struct DCTSongAttributes {
	__unsafe_unretained NSString *discNumber;
	__unsafe_unretained NSString *duration;
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *lyrics;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *trackNumber;
} DCTSongAttributes;

extern const struct DCTSongRelationships {
	__unsafe_unretained NSString *album;
	__unsafe_unretained NSString *artist;
	__unsafe_unretained NSString *composer;
	__unsafe_unretained NSString *genre;
	__unsafe_unretained NSString *playlists;
} DCTSongRelationships;

extern const struct DCTSongFetchedProperties {
} DCTSongFetchedProperties;

@class DCTAlbum;
@class DCTArtist;
@class DCTComposer;
@class DCTGenre;
@class DCTPlaylist;









@interface DCTSongID : NSManagedObjectID {}
@end

@interface _DCTSong : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DCTSongID*)objectID;




@property (nonatomic, strong) NSNumber* discNumber;


@property int16_t discNumberValue;
- (int16_t)discNumberValue;
- (void)setDiscNumberValue:(int16_t)value_;

//- (BOOL)validateDiscNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* duration;


@property float durationValue;
- (float)durationValue;
- (void)setDurationValue:(float)value_;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* identifier;


@property int64_t identifierValue;
- (int64_t)identifierValue;
- (void)setIdentifierValue:(int64_t)value_;

//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* lyrics;


//- (BOOL)validateLyrics:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* rating;


@property int16_t ratingValue;
- (int16_t)ratingValue;
- (void)setRatingValue:(int16_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* trackNumber;


@property int16_t trackNumberValue;
- (int16_t)trackNumberValue;
- (void)setTrackNumberValue:(int16_t)value_;

//- (BOOL)validateTrackNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) DCTAlbum* album;

//- (BOOL)validateAlbum:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) DCTArtist* artist;

//- (BOOL)validateArtist:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) DCTComposer* composer;

//- (BOOL)validateComposer:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) DCTGenre* genre;

//- (BOOL)validateGenre:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* playlists;

- (NSMutableSet*)playlistsSet;





#if TARGET_OS_IPHONE










- (NSFetchedResultsController *)newPlaylistsFetchedResultsControllerWithSortDescriptors:(NSArray *)sortDescriptors;


#endif

@end

@interface _DCTSong (CoreDataGeneratedAccessors)

- (void)addPlaylists:(NSSet*)value_;
- (void)removePlaylists:(NSSet*)value_;
- (void)addPlaylistsObject:(DCTPlaylist*)value_;
- (void)removePlaylistsObject:(DCTPlaylist*)value_;

@end

@interface _DCTSong (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveDiscNumber;
- (void)setPrimitiveDiscNumber:(NSNumber*)value;

- (int16_t)primitiveDiscNumberValue;
- (void)setPrimitiveDiscNumberValue:(int16_t)value_;




- (NSNumber*)primitiveDuration;
- (void)setPrimitiveDuration:(NSNumber*)value;

- (float)primitiveDurationValue;
- (void)setPrimitiveDurationValue:(float)value_;




- (NSNumber*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSNumber*)value;

- (int64_t)primitiveIdentifierValue;
- (void)setPrimitiveIdentifierValue:(int64_t)value_;




- (NSString*)primitiveLyrics;
- (void)setPrimitiveLyrics:(NSString*)value;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int16_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int16_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveTrackNumber;
- (void)setPrimitiveTrackNumber:(NSNumber*)value;

- (int16_t)primitiveTrackNumberValue;
- (void)setPrimitiveTrackNumberValue:(int16_t)value_;





- (DCTAlbum*)primitiveAlbum;
- (void)setPrimitiveAlbum:(DCTAlbum*)value;



- (DCTArtist*)primitiveArtist;
- (void)setPrimitiveArtist:(DCTArtist*)value;



- (DCTComposer*)primitiveComposer;
- (void)setPrimitiveComposer:(DCTComposer*)value;



- (DCTGenre*)primitiveGenre;
- (void)setPrimitiveGenre:(DCTGenre*)value;



- (NSMutableSet*)primitivePlaylists;
- (void)setPrimitivePlaylists:(NSMutableSet*)value;


@end
