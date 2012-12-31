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
    
    NSUInteger currentNum = 0;
    while ([numberClass count] >= group.setSizeValue) {
        SetEntity *currentSet = [SetEntity create];
        currentSet.parentGroup = group;
        currentSet.orderNumberValue = currentNum;
        for (NSUInteger i = 0; i < group.setSizeValue; i++) {
            NSUInteger randomSpot = arc4random() % [numberClass count];
            PersonEntity *randomPerson = [PersonEntity create];
            randomPerson.number = [numberClass objectAtIndex:randomSpot];
            randomPerson.parentSet = currentSet;
            [numberClass removeObjectAtIndex:randomSpot];
        }
        currentNum++;
    }
    
    // Handle stragglers
    // WATK -- TBD
    
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
