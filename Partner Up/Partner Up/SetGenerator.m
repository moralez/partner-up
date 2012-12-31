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
#import "SetEntity.h"

@implementation SetGenerator

+ (void)generateSetsForGroup:(GroupEntity*)group {
    
    NSUInteger classSize = group.classSizeValue;
    NSUInteger setSize = group.setSizeValue;
    NSMutableArray *numberClass = [NSMutableArray numberedArrayWithSize:classSize];
    
    NSLog(@"Splitting group size %d by %d, split is %s", classSize, setSize, (classSize % setSize) ? "EVEN" : "NOT EVEN");
    
    while ([numberClass count] >= group.setSizeValue) {
        SetEntity *currentSet = [SetEntity create];
        currentSet.parentGroup = group;
        for (NSUInteger i = 0; i < group.setSizeValue; i++) {
            NSUInteger randomSpot = arc4random() % [numberClass count];
            PersonEntity *randomPerson = [PersonEntity create];
            randomPerson.number = [NSNumber numberWithInteger:randomSpot];
            randomPerson.parentSet = currentSet;
            [numberClass removeObjectAtIndex:randomSpot];
        }
    }
    
    // Handle stragglers
    // TBD
    
    // Save all sets
    [SingleCDStack saveChanges];
}

@end
