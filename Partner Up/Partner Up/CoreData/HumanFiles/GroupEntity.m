#import "GroupEntity.h"


@interface GroupEntity ()

// Private interface goes here.

@end


@implementation GroupEntity


// Helpers

// Create a predicate from the given attribute and value
+ (NSPredicate *) createPredicateFromAttribute:(NSString *)attribute withValue: (id)value
{
    return [NSPredicate predicateWithFormat:@"%K == %@", attribute, value];
}

// Given an array of NSManagedObjects, return the first if it exists
+ (NSManagedObject *) returnFirstFromArray:(NSArray *)objectArray
{
    if ([objectArray count] > 0) {
        return [objectArray objectAtIndex:0];
    } else {
        return nil;
    }
}

// Creates
// Create an entity in the singleton context
+ (NSManagedObject *) create
{
    NSManagedObjectContext *context = [SingleCDStack getContext];
    return [self createInContext:context];
}
// Create an entity in given context
+ (NSManagedObject *) createInContext:(NSManagedObjectContext *)context
{
    NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class])
                                                               inManagedObjectContext:context];
    return newObject;
}

// Fetches
// FindAll in the singleton context
+ (NSArray *) findAll
{
    return [self findWithPred:nil withLimit:NO_FETCH_LIMIT];
}
// FindAll in given context
+ (NSArray *) findAll:(NSManagedObjectContext *)context
{
    return [self findWithPred:nil inContext:context withLimit:NO_FETCH_LIMIT];
}


// Returns only first from findByAttribute method in singleton context
+ (NSManagedObject *) findFirstByAttribute:(NSString *)attribute withValue:(id)value
{
    NSArray *objects = [self findByAttribute:attribute withValue:value withLimit:FETCH_SINGLE];
    return [self returnFirstFromArray:objects];
}
// Returns only first from findByAttribute method inContext
+ (NSManagedObject *) findFirstByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context
{
    NSArray *objects = [self findByAttribute:attribute withValue:value inContext:context withLimit:FETCH_SINGLE];
    return [self returnFirstFromArray:objects];
}

// Helper method to take an attribute, convert to predicate and find, in singleton context,
+ (NSArray *) findByAttribute:(NSString *)attribute withValue:(id)value withLimit:(NSUInteger)fetchLimit
{
    NSPredicate *predicate = [self createPredicateFromAttribute:attribute withValue:value];
    return [self findWithPred:predicate withLimit:fetchLimit];
}
// Helper method to take an attribute, convert to predicate and find in a context
+ (NSArray *) findByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context withLimit:(NSUInteger)fetchLimit
{
    NSPredicate *predicate = [self createPredicateFromAttribute:attribute withValue:value];
    return [self findWithPred:predicate inContext:context withLimit:NO_FETCH_LIMIT];
}

// Returns only first from findWithPred method
+ (NSManagedObject *) findFirstWithPred:(NSPredicate *) predicate
{
    NSArray *objects = [self findWithPred:predicate withLimit:FETCH_SINGLE];
    return [self returnFirstFromArray:objects];
}
// Returns only first from findWithPred method in a context
+ (NSManagedObject *) findFirstWithPred:(NSPredicate *) predicate inContext:(NSManagedObjectContext *)context
{
    NSArray *objects = [self findWithPred:predicate inContext:context withLimit:FETCH_SINGLE ];
    return [self returnFirstFromArray:objects];
}

// Find in singleton context with predicate
+ (NSArray *) findWithPred:(NSPredicate *) predicate withLimit:(NSUInteger)fetchLimit
{
    NSManagedObjectContext *context = [SingleCDStack getContext];
    return [self findWithPred:predicate inContext:context withLimit:fetchLimit];
}

// Find in given context with predicate with given limit
+ (NSArray *) findWithPred:(NSPredicate *) predicate inContext:(NSManagedObjectContext *)context withLimit:(NSUInteger)fetchLimit
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:NSStringFromClass([self class])
                                                  inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setPredicate:predicate];
    
    if (NO_FETCH_LIMIT != fetchLimit) {
        [request setFetchLimit:fetchLimit];
    }
    
    NSError *error;
    return [context executeFetchRequest:request error:&error];
}

@end

