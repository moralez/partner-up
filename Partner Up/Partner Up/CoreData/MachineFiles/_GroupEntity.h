// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GroupEntity.h instead.

#import <CoreData/CoreData.h>


extern const struct GroupEntityAttributes {
	__unsafe_unretained NSString *name;
} GroupEntityAttributes;

extern const struct GroupEntityRelationships {
} GroupEntityRelationships;

extern const struct GroupEntityFetchedProperties {
} GroupEntityFetchedProperties;




@interface GroupEntityID : NSManagedObjectID {}
@end

@interface _GroupEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GroupEntityID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _GroupEntity (CoreDataGeneratedAccessors)

@end

@interface _GroupEntity (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
