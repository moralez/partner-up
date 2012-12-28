// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PersonEntity.m instead.

#import "_PersonEntity.h"

const struct PersonEntityAttributes PersonEntityAttributes = {
	.number = @"number",
};

const struct PersonEntityRelationships PersonEntityRelationships = {
	.parentSet = @"parentSet",
};

const struct PersonEntityFetchedProperties PersonEntityFetchedProperties = {
};

@implementation PersonEntityID
@end

@implementation _PersonEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PersonEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PersonEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PersonEntity" inManagedObjectContext:moc_];
}

- (PersonEntityID*)objectID {
	return (PersonEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"numberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"number"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic number;



- (int32_t)numberValue {
	NSNumber *result = [self number];
	return [result intValue];
}

- (void)setNumberValue:(int32_t)value_ {
	[self setNumber:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNumberValue {
	NSNumber *result = [self primitiveNumber];
	return [result intValue];
}

- (void)setPrimitiveNumberValue:(int32_t)value_ {
	[self setPrimitiveNumber:[NSNumber numberWithInt:value_]];
}





@dynamic parentSet;

	






@end
