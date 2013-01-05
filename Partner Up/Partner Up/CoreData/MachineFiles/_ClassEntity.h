// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ClassEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct ClassEntityAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *protected;
	__unsafe_unretained NSString *size;
} ClassEntityAttributes;

extern const struct ClassEntityRelationships {
	__unsafe_unretained NSString *childActivities;
} ClassEntityRelationships;

extern const struct ClassEntityFetchedProperties {
} ClassEntityFetchedProperties;

@class ActivityEntity;





@interface ClassEntityID : NSManagedObjectID {}
@end

@interface _ClassEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ClassEntityID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* protected;



@property BOOL protectedValue;
- (BOOL)protectedValue;
- (void)setProtectedValue:(BOOL)value_;

//- (BOOL)validateProtected:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* size;



@property int32_t sizeValue;
- (int32_t)sizeValue;
- (void)setSizeValue:(int32_t)value_;

//- (BOOL)validateSize:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *childActivities;

- (NSMutableSet*)childActivitiesSet;





@end

@interface _ClassEntity (CoreDataGeneratedAccessors)

- (void)addChildActivities:(NSSet*)value_;
- (void)removeChildActivities:(NSSet*)value_;
- (void)addChildActivitiesObject:(ActivityEntity*)value_;
- (void)removeChildActivitiesObject:(ActivityEntity*)value_;

@end

@interface _ClassEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveProtected;
- (void)setPrimitiveProtected:(NSNumber*)value;

- (BOOL)primitiveProtectedValue;
- (void)setPrimitiveProtectedValue:(BOOL)value_;




- (NSNumber*)primitiveSize;
- (void)setPrimitiveSize:(NSNumber*)value;

- (int32_t)primitiveSizeValue;
- (void)setPrimitiveSizeValue:(int32_t)value_;





- (NSMutableSet*)primitiveChildActivities;
- (void)setPrimitiveChildActivities:(NSMutableSet*)value;


@end
