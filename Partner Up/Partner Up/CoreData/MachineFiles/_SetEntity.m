// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SetEntity.m instead.

#import "_SetEntity.h"

const struct SetEntityAttributes SetEntityAttributes = {
};

const struct SetEntityRelationships SetEntityRelationships = {
	.childPersons = @"childPersons",
	.parentGroup = @"parentGroup",
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
	

	return keyPaths;
}




@dynamic childPersons;

	

@dynamic parentGroup;

	






@end
