//
//  SetGenerator.m
//  Partner Up
//
//  Created by Johnny Moralez on 12/30/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "GroupGenerator.h"
#import "ActivityEntity.h"
#import "NSMutableArray+Helpers.h"
#import "PersonEntity.h"

@implementation GroupGenerator

+ (void)generateGroupsForActivity:(ActivityEntity*)activity {
    
    NSUInteger classSize = activity.classSizeValue;
    NSUInteger groupSize = activity.groupSizeValue;
    NSMutableArray *numberClass = [NSMutableArray numberedArrayWithSize:classSize];
    
    NSLog(@"Splitting activity size %d by %d, split is %s", classSize, groupSize, (classSize % groupSize) ? "NOT EVEN" : "EVEN");
    
    // Uneven activities: Many ways to handle...for now, just create a activity from leftovers
    NSUInteger groupNumber = 0;
    NSUInteger currentGroupSize;
    while ([numberClass count] > 0) {
        // Determine this Set's size
        if ([numberClass count] > activity.groupSizeValue) {
            currentGroupSize = activity.groupSizeValue;
        } else {
            currentGroupSize = [numberClass count];
        }
        // Create Set entity
        GroupEntity *currentGroup = [GroupEntity create];
        currentGroup.parentActivity = activity;
        currentGroup.orderNumberValue = groupNumber;
        // Create all the Persons for this Set
        for (NSUInteger i = 0; i < currentGroupSize; i++) {
            // Choose which Person to create next
            NSUInteger randomSpot = arc4random() % [numberClass count];
            PersonEntity *randomPerson = [PersonEntity create];
            randomPerson.number = [numberClass objectAtIndex:randomSpot];
            randomPerson.parentGroup = currentGroup;
            // Remove object from array so that it isn't reused.
            [numberClass removeObjectAtIndex:randomSpot];
        }
        // Loop for next Set
        groupNumber++;
    }
    
    // Save all groups
    [SingleCDStack saveChanges];
}

+ (NSString *)delineatedPersonsList:(GroupEntity *)currentGroup
{
    // Get list of Persons associated with this set
    NSArray *childPersons = [PersonEntity findByAttribute:@"parentGroup" withValue:[currentGroup objectID] withLimit:NO_FETCH_LIMIT];
    NSUInteger childrenCount = [childPersons count];

    // Begin displayed string with set#
    NSString *retStr = [NSString stringWithFormat:@"%@) ", currentGroup.orderNumber];
    
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
