// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SetEntity.m instead.

#import "_SetEntity.h"

const struct SetEntityAttributes SetEntityAttributes = {
	.orderNumber = @"orderNumber",
};

const struct SetEntityRelationships SetEntityRelationships = {
	.childPersons = @"childPersons",
	.parentActivity = @"parentActivity",
};

const struct SetEntityFetchedProperties SetEntityFetchedProperties = {
};

@implementation SetEntityID
@end

@implementation _SetEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SetEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SetEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SetEntity" inManagedObjectContext:moc_];
}

- (SetEntityID*)objectID {
	return (SetEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"orderNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"orderNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic orderNumber;



- (int32_t)orderNumberValue {
	NSNumber *result = [self orderNumber];
	return [result intValue];
}

- (void)setOrderNumberValue:(int32_t)value_ {
	[self setOrderNumber:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveOrderNumberValue {
	NSNumber *result = [self primitiveOrderNumber];
	return [result intValue];
}

- (void)setPrimitiveOrderNumberValue:(int32_t)value_ {
	[self setPrimitiveOrderNumber:[NSNumber numberWithInt:value_]];
}





@dynamic childPersons;

	
- (NSMutableSet*)childPersonsSet {
	[self willAccessValueForKey:@"childPersons"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"childPersons"];
  
	[self didAccessValueForKey:@"childPersons"];
	return result;
}
	

@dynamic parentActivity;

	






@end
