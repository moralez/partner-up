// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ActivityEntity.m instead.

#import "_ActivityEntity.h"

const struct ActivityEntityAttributes ActivityEntityAttributes = {
	.classSize = @"classSize",
	.name = @"name",
	.setSize = @"setSize",
};

const struct ActivityEntityRelationships ActivityEntityRelationships = {
	.childSets = @"childSets",
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
	if ([key isEqualToString:@"setSizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"setSize"];
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





@dynamic name;






@dynamic setSize;



- (int32_t)setSizeValue {
	NSNumber *result = [self setSize];
	return [result intValue];
}

- (void)setSetSizeValue:(int32_t)value_ {
	[self setSetSize:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSetSizeValue {
	NSNumber *result = [self primitiveSetSize];
	return [result intValue];
}

- (void)setPrimitiveSetSizeValue:(int32_t)value_ {
	[self setPrimitiveSetSize:[NSNumber numberWithInt:value_]];
}





@dynamic childSets;

	
- (NSMutableSet*)childSetsSet {
	[self willAccessValueForKey:@"childSets"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"childSets"];
  
	[self didAccessValueForKey:@"childSets"];
	return result;
}
	

@dynamic parentClass;

	






@end
