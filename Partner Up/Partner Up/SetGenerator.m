//
//  SetGenerator.m
//  Partner Up
//
//  Created by Johnny Moralez on 12/30/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "SetGenerator.h"
#import "GroupEntity.h"
#import "NSMutableArray+Helpers.h"
#import "PersonEntity.h"

@implementation SetGenerator



+ (void)generateSetsForGroup:(GroupEntity*)group {
    
    NSUInteger classSize = group.classSizeValue;
    NSUInteger setSize = group.setSizeValue;
    NSMutableArray *numberClass = [NSMutableArray numberedArrayWithSize:classSize];
    
    NSLog(@"Splitting group size %d by %d, split is %s", classSize, setSize, (classSize % setSize) ? "NOT EVEN" : "EVEN");
    
    // Uneven groups: Many ways to handle...for now, just create a group from leftovers
    NSUInteger setNumber = 0;
    NSUInteger currentSetSize;
    while ([numberClass count] > 0) {
        // Determine this Set's size
        if ([numberClass count] > group.setSizeValue) {
            currentSetSize = group.setSizeValue;
        } else {
            currentSetSize = [numberClass count];
        }
        // Create Set entity
        SetEntity *currentSet = [SetEntity create];
        currentSet.parentGroup = group;
        currentSet.orderNumberValue = setNumber;
        // Create all the Persons for this Set
        for (NSUInteger i = 0; i < currentSetSize; i++) {
            // Choose which Person to create next
            NSUInteger randomSpot = arc4random() % [numberClass count];
            PersonEntity *randomPerson = [PersonEntity create];
            randomPerson.number = [numberClass objectAtIndex:randomSpot];
            randomPerson.parentSet = currentSet;
            // Remove object from array so that it isn't reused.
            [numberClass removeObjectAtIndex:randomSpot];
        }
        // Loop for next Set
        setNumber++;
    }
    
    // Save all sets
    [SingleCDStack saveChanges];
}

+ (NSString *)delineatedPersonsList:(SetEntity *)currentSet
{
    // Get list of Persons associated with this set
    NSArray *childPersons = [PersonEntity findByAttribute:@"parentSet" withValue:[currentSet objectID] withLimit:NO_FETCH_LIMIT];
    NSUInteger childrenCount = [childPersons count];

    // Begin displayed string with set#
    NSString *retStr = [NSString stringWithFormat:@"%@) ", currentSet.orderNumber];
    
    // Concatenate children numbers to this string
    PersonEntity *curPerson;
    for (NSUInteger i = 0; i < childrenCount; i++) {
        curPerson = [childPersons objectAtIndex:i];
        // WATK -- this leaves a trailing ", " - is there a clean way to fix or have to modify this loop?
        retStr = [retStr stringByAppendingFormat:@"%@, ", curPerson.number];
    }
    return retStr;
}

@end
