// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GroupEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct GroupEntityAttributes {
	__unsafe_unretained NSString *orderNumber;
} GroupEntityAttributes;

extern const struct GroupEntityRelationships {
	__unsafe_unretained NSString *childPersons;
	__unsafe_unretained NSString *parentActivity;
} GroupEntityRelationships;

extern const struct GroupEntityFetchedProperties {
} GroupEntityFetchedProperties;

@class PersonEntity;
@class ActivityEntity;



@interface GroupEntityID : NSManagedObjectID {}
@end

@interface _GroupEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GroupEntityID*)objectID;





@property (nonatomic, strong) NSNumber* orderNumber;



@property int32_t orderNumberValue;
- (int32_t)orderNumberValue;
- (void)setOrderNumberValue:(int32_t)value_;

//- (BOOL)validateOrderNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *childPersons;

- (NSMutableSet*)childPersonsSet;




@property (nonatomic, strong) ActivityEntity *parentActivity;

//- (BOOL)validateParentActivity:(id*)value_ error:(NSError**)error_;





@end

@interface _GroupEntity (CoreDataGeneratedAccessors)

- (void)addChildPersons:(NSSet*)value_;
- (void)removeChildPersons:(NSSet*)value_;
- (void)addChildPersonsObject:(PersonEntity*)value_;
- (void)removeChildPersonsObject:(PersonEntity*)value_;

@end

@interface _GroupEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveOrderNumber;
- (void)setPrimitiveOrderNumber:(NSNumber*)value;

- (int32_t)primitiveOrderNumberValue;
- (void)setPrimitiveOrderNumberValue:(int32_t)value_;





- (NSMutableSet*)primitiveChildPersons;
- (void)setPrimitiveChildPersons:(NSMutableSet*)value;



- (ActivityEntity*)primitiveParentActivity;
- (void)setPrimitiveParentActivity:(ActivityEntity*)value;


@end
