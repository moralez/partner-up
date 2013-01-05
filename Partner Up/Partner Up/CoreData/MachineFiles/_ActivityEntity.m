// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ActivityEntity.m instead.

#import "_ActivityEntity.h"

const struct ActivityEntityAttributes ActivityEntityAttributes = {
	.classSize = @"classSize",
	.groupSize = @"groupSize",
	.name = @"name",
};

const struct ActivityEntityRelationships ActivityEntityRelationships = {
	.childGroups = @"childGroups",
	.parentClass = @"parentClass",
};

const struct ActivityEntityFetchedProperties ActivityEntityFetchedProperties = {
};

@implementation ActivityEntityID
@end

@implementation _ActivityEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ActivityEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ActivityEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ActivityEntity" inManagedObjectContext:moc_];
}

- (ActivityEntityID*)objectID {
	return (ActivityEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"classSizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"classSize"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"groupSizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"groupSize"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic classSize;



- (int32_t)classSizeValue {
	NSNumber *result = [self classSize];
	return [result intValue];
}

- (void)setClassSizeValue:(int32_t)value_ {
	[self setClassSize:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveClassSizeValue {
	NSNumber *result = [self primitiveClassSize];
	return [result intValue];
}

- (void)setPrimitiveClassSizeValue:(int32_t)value_ {
	[self setPrimitiveClassSize:[NSNumber numberWithInt:value_]];
}





@dynamic groupSize;



- (int32_t)groupSizeValue {
	NSNumber *result = [self groupSize];
	return [result intValue];
}

- (void)setGroupSizeValue:(int32_t)value_ {
	[self setGroupSize:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveGroupSizeValue {
	NSNumber *result = [self primitiveGroupSize];
	return [result intValue];
}

- (void)setPrimitiveGroupSizeValue:(int32_t)value_ {
	[self setPrimitiveGroupSize:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic childGroups;

	
- (NSMutableSet*)childGroupsSet {
	[self willAccessValueForKey:@"childGroups"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"childGroups"];
  
	[self didAccessValueForKey:@"childGroups"];
	return result;
}
	

@dynamic parentClass;

	






@end
