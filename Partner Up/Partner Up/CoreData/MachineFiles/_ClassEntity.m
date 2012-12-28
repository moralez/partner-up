// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ClassEntity.m instead.

#import "_ClassEntity.h"

const struct ClassEntityAttributes ClassEntityAttributes = {
	.name = @"name",
	.size = @"size",
};

const struct ClassEntityRelationships ClassEntityRelationships = {
	.childGroups = @"childGroups",
};

const struct ClassEntityFetchedProperties ClassEntityFetchedProperties = {
};

@implementation ClassEntityID
@end

@implementation _ClassEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ClassEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ClassEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ClassEntity" inManagedObjectContext:moc_];
}

- (ClassEntityID*)objectID {
	return (ClassEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"sizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"size"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic name;






@dynamic size;



- (int32_t)sizeValue {
	NSNumber *result = [self size];
	return [result intValue];
}

- (void)setSizeValue:(int32_t)value_ {
	[self setSize:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSizeValue {
	NSNumber *result = [self primitiveSize];
	return [result intValue];
}

- (void)setPrimitiveSizeValue:(int32_t)value_ {
	[self setPrimitiveSize:[NSNumber numberWithInt:value_]];
}





@dynamic childGroups;

	
- (NSMutableSet*)childGroupsSet {
	[self willAccessValueForKey:@"childGroups"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"childGroups"];
  
	[self didAccessValueForKey:@"childGroups"];
	return result;
}
	






@end
