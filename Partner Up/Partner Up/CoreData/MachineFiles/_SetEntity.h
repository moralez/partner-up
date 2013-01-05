// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SetEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct SetEntityAttributes {
	__unsafe_unretained NSString *orderNumber;
} SetEntityAttributes;

extern const struct SetEntityRelationships {
	__unsafe_unretained NSString *childPersons;
	__unsafe_unretained NSString *parentActivity;
} SetEntityRelationships;

extern const struct SetEntityFetchedProperties {
} SetEntityFetchedProperties;

@class PersonEntity;
@class ActivityEntity;



@interface SetEntityID : NSManagedObjectID {}
@end

@interface _SetEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SetEntityID*)objectID;





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

@interface _SetEntity (CoreDataGeneratedAccessors)

- (void)addChildPersons:(NSSet*)value_;
- (void)removeChildPersons:(NSSet*)value_;
- (void)addChildPersonsObject:(PersonEntity*)value_;
- (void)removeChildPersonsObject:(PersonEntity*)value_;

@end

@interface _SetEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveOrderNumber;
- (void)setPrimitiveOrderNumber:(NSNumber*)value;

- (int32_t)primitiveOrderNumberValue;
- (void)setPrimitiveOrderNumberValue:(int32_t)value_;





- (NSMutableSet*)primitiveChildPersons;
- (void)setPrimitiveChildPersons:(NSMutableSet*)value;



- (ActivityEntity*)primitiveParentActivity;
- (void)setPrimitiveParentActivity:(ActivityEntity*)value;


@end
