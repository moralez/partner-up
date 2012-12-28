#import "_SetEntity.h"

@interface SetEntity : _SetEntity {}

// Helpers
+ (NSManagedObject *) returnFirstFromArray:(NSArray *)objectArray;
+ (NSPredicate *) createPredicateFromAttribute:(NSString *)attribute withValue: (id)value;

// Creates
+ (NSManagedObject *) create;
+ (NSManagedObject *) createInContext:(NSManagedObjectContext *)context;

// Fetches
+ (NSArray *) findAll;
+ (NSArray *) findAll:(NSManagedObjectContext *)context;

+ (NSManagedObject *) findFirstByAttribute:(NSString *)attribute withValue:(id)value;
+ (NSManagedObject *) findFirstByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context;
+ (NSArray *) findByAttribute:(NSString *)attribute withValue:(id)value withLimit:(NSUInteger)fetchLimit;
+ (NSArray *) findByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context withLimit:(NSUInteger)fetchLimit;

+ (NSManagedObject *) findFirstWithPred:(NSPredicate *) predicate;
+ (NSManagedObject *) findFirstWithPred:(NSPredicate *) predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray *) findWithPred:(NSPredicate *) predicate withLimit:(NSUInteger)fetchLimit;
+ (NSArray *) findWithPred:(NSPredicate *) predicate inContext:(NSManagedObjectContext *)context  withLimit:(NSUInteger)fetchLimit;

@end
