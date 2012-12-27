// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ClassEntity.m instead.

#import "_ClassEntity.h"

const struct ClassEntityAttributes ClassEntityAttributes = {
	.name = @"name",
};

const struct ClassEntityRelationships ClassEntityRelationships = {
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
	

	return keyPaths;
}




@dynamic name;











@end
