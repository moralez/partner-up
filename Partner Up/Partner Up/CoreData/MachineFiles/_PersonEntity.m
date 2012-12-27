// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PersonEntity.m instead.

#import "_PersonEntity.h"

const struct PersonEntityAttributes PersonEntityAttributes = {
	.gender = @"gender",
	.name = @"name",
};

const struct PersonEntityRelationships PersonEntityRelationships = {
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
	
	if ([key isEqualToString:@"genderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gender"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic gender;



- (BOOL)genderValue {
	NSNumber *result = [self gender];
	return [result boolValue];
}

- (void)setGenderValue:(BOOL)value_ {
	[self setGender:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveGenderValue {
	NSNumber *result = [self primitiveGender];
	return [result boolValue];
}

- (void)setPrimitiveGenderValue:(BOOL)value_ {
	[self setPrimitiveGender:[NSNumber numberWithBool:value_]];
}





@dynamic name;











@end
