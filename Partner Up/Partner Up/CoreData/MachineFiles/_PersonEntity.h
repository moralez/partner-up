// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PersonEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct PersonEntityAttributes {
	__unsafe_unretained NSString *number;
} PersonEntityAttributes;

extern const struct PersonEntityRelationships {
	__unsafe_unretained NSString *parentGroup;
} PersonEntityRelationships;

extern const struct PersonEntityFetchedProperties {
} PersonEntityFetchedProperties;

@class GroupEntity;



@interface PersonEntityID : NSManagedObjectID {}
@end

@interface _PersonEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PersonEntityID*)objectID;





@property (nonatomic, strong) NSNumber* number;



@property int32_t numberValue;
- (int32_t)numberValue;
- (void)setNumberValue:(int32_t)value_;

//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) GroupEntity *parentGroup;

//- (BOOL)validateParentGroup:(id*)value_ error:(NSError**)error_;





@end

@interface _PersonEntity (CoreDataGeneratedAccessors)

@end

@interface _PersonEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveNumber;
- (void)setPrimitiveNumber:(NSNumber*)value;

- (int32_t)primitiveNumberValue;
- (void)setPrimitiveNumberValue:(int32_t)value_;





- (GroupEntity*)primitiveParentGroup;
- (void)setPrimitiveParentGroup:(GroupEntity*)value;


@end
