// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ClassEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct ClassEntityAttributes {
	__unsafe_unretained NSString *name;
} ClassEntityAttributes;

extern const struct ClassEntityRelationships {
} ClassEntityRelationships;

extern const struct ClassEntityFetchedProperties {
} ClassEntityFetchedProperties;




@interface ClassEntityID : NSManagedObjectID {}
@end

@interface _ClassEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ClassEntityID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _ClassEntity (CoreDataGeneratedAccessors)

@end

@interface _ClassEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
