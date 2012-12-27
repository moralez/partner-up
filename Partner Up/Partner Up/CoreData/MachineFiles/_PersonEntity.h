// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PersonEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct PersonEntityAttributes {
	__unsafe_unretained NSString *gender;
	__unsafe_unretained NSString *name;
} PersonEntityAttributes;

extern const struct PersonEntityRelationships {
} PersonEntityRelationships;

extern const struct PersonEntityFetchedProperties {
} PersonEntityFetchedProperties;





@interface PersonEntityID : NSManagedObjectID {}
@end

@interface _PersonEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PersonEntityID*)objectID;





@property (nonatomic, strong) NSNumber* gender;



@property BOOL genderValue;
- (BOOL)genderValue;
- (void)setGenderValue:(BOOL)value_;

//- (BOOL)validateGender:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _PersonEntity (CoreDataGeneratedAccessors)

@end

@interface _PersonEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveGender;
- (void)setPrimitiveGender:(NSNumber*)value;

- (BOOL)primitiveGenderValue;
- (void)setPrimitiveGenderValue:(BOOL)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
