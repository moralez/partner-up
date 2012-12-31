//
//  NSMutableArray+Helpers.m
//  Partner Up
//
//  Created by Johnny Moralez on 12/31/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "NSMutableArray+Helpers.h"

@implementation NSMutableArray (Helpers)

+ (NSMutableArray*)numberedArrayWithSize:(NSUInteger)size {
    NSMutableArray *tbr = [NSMutableArray array];
    for (NSUInteger i = 0; i < size; i++) {
        [tbr addObject:[NSNumber numberWithInteger:i]];
    }
    
    return tbr;
}

@end
