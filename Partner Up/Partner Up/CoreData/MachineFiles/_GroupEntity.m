// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GroupEntity.m instead.

#import "_GroupEntity.h"

const struct GroupEntityAttributes GroupEntityAttributes = {
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
	

	return keyPaths;
}




@dynamic name;






@dynamic childSets;

	

@dynamic parentClass;

	






@end
