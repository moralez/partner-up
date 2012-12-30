// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GroupEntity.m instead.

#import "_GroupEntity.h"

const struct GroupEntityAttributes GroupEntityAttributes = {
	.classSize = @"classSize",
	.groupSize = @"groupSize",
	.name = @"name",
};

const struct GroupEntityRelationships GroupEntityRelationships = {
	.childSets = @"childSets",
	.parentClass = @"parentClass",
};

const struct GroupEntityFetchedProperties GroupEntityFetchedProperties = {
};

@implementation GroupEntityID
@end

@implementation _GroupEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GroupEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GroupEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GroupEntity" inManagedObjectContext:moc_];
}

- (GroupEntityID*)objectID {
	return (GroupEntityID*)[super objectID];
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






@dynamic childSets;

	

@dynamic parentClass;

	






@end
