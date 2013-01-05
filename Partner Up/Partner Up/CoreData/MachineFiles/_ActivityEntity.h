// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ActivityEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct ActivityEntityAttributes {
	__unsafe_unretained NSString *classSize;
	__unsafe_unretained NSString *groupSize;
	__unsafe_unretained NSString *name;
} ActivityEntityAttributes;

extern const struct ActivityEntityRelationships {
	__unsafe_unretained NSString *childGroups;
	__unsafe_unretained NSString *parentClass;
} ActivityEntityRelationships;

extern const struct ActivityEntityFetchedProperties {
} ActivityEntityFetchedProperties;

@class GroupEntity;
@class ClassEntity;





@interface ActivityEntityID : NSManagedObjectID {}
@end

@interface _ActivityEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ActivityEntityID*)objectID;





@property (nonatomic, strong) NSNumber* classSize;



@property int32_t classSizeValue;
- (int32_t)classSizeValue;
- (void)setClassSizeValue:(int32_t)value_;

//- (BOOL)validateClassSize:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* groupSize;



@property int32_t groupSizeValue;
- (int32_t)groupSizeValue;
- (void)setGroupSizeValue:(int32_t)value_;

//- (BOOL)validateGroupSize:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *childGroups;

- (NSMutableSet*)childGroupsSet;




@property (nonatomic, strong) ClassEntity *parentClass;

//- (BOOL)validateParentClass:(id*)value_ error:(NSError**)error_;





@end

@interface _ActivityEntity (CoreDataGeneratedAccessors)

- (void)addChildGroups:(NSSet*)value_;
- (void)removeChildGroups:(NSSet*)value_;
- (void)addChildGroupsObject:(GroupEntity*)value_;
- (void)removeChildGroupsObject:(GroupEntity*)value_;

@end

@interface _ActivityEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveClassSize;
- (void)setPrimitiveClassSize:(NSNumber*)value;

- (int32_t)primitiveClassSizeValue;
- (void)setPrimitiveClassSizeValue:(int32_t)value_;




- (NSNumber*)primitiveGroupSize;
- (void)setPrimitiveGroupSize:(NSNumber*)value;

- (int32_t)primitiveGroupSizeValue;
- (void)setPrimitiveGroupSizeValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveChildGroups;
- (void)setPrimitiveChildGroups:(NSMutableSet*)value;



- (ClassEntity*)primitiveParentClass;
- (void)setPrimitiveParentClass:(ClassEntity*)value;


@end
