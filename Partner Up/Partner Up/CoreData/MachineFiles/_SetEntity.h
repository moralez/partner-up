// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SetEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct SetEntityAttributes {
} SetEntityAttributes;

extern const struct SetEntityRelationships {
	__unsafe_unretained NSString *childPersons;
	__unsafe_unretained NSString *parentGroup;
} SetEntityRelationships;

extern const struct SetEntityFetchedProperties {
} SetEntityFetchedProperties;

@class PersonEntity;
@class GroupEntity;


@interface SetEntityID : NSManagedObjectID {}
@end

@interface _SetEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SetEntityID*)objectID;





@property (nonatomic, strong) PersonEntity *childPersons;

//- (BOOL)validateChildPersons:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) GroupEntity *parentGroup;

//- (BOOL)validateParentGroup:(id*)value_ error:(NSError**)error_;





@end

@interface _SetEntity (CoreDataGeneratedAccessors)

@end

@interface _SetEntity (CoreDataGeneratedPrimitiveAccessors)



- (PersonEntity*)primitiveChildPersons;
- (void)setPrimitiveChildPersons:(PersonEntity*)value;



- (GroupEntity*)primitiveParentGroup;
- (void)setPrimitiveParentGroup:(GroupEntity*)value;


@end
