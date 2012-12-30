//
//  NSManagedObject+WATK_Extension.h
//  Partner Up
//
//  Created by Logen Watkins on 12/30/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSManagedObject (WATK_Extension)

// Helpers
+ (id) returnFirstFromArray:(NSArray *)objectArray;
+ (NSPredicate *) createPredicateFromAttribute:(NSString *)attribute withValue: (id)value;

// Creates
+ (id) create;
+ (id) createInContext:(NSManagedObjectContext *)context;

// Fetches
+ (NSArray *) findAll;
+ (NSArray *) findAll:(NSManagedObjectContext *)context;

+ (id) findFirstByAttribute:(NSString *)attribute withValue:(id)value;
+ (id) findFirstByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context;
+ (NSArray *) findByAttribute:(NSString *)attribute withValue:(id)value withLimit:(NSUInteger)fetchLimit;
+ (NSArray *) findByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context withLimit:(NSUInteger)fetchLimit;

+ (id) findFirstWithPred:(NSPredicate *) predicate;
+ (id) findFirstWithPred:(NSPredicate *) predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray *) findWithPred:(NSPredicate *) predicate withLimit:(NSUInteger)fetchLimit;
+ (NSArray *) findWithPred:(NSPredicate *) predicate inContext:(NSManagedObjectContext *)context  withLimit:(NSUInteger)fetchLimit;

@end
