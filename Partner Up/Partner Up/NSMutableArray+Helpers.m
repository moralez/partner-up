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
    return [self numberedArrayWithMin:0 withMax:(size - 1)];
}

+ (NSMutableArray *)numberedArrayWithMin:(NSUInteger)min withMax:(NSUInteger)max {
    // An object numbered "max" is desired, so rather than adjust for loop, do so here
    max++;
    NSMutableArray *tbr = [NSMutableArray array];
    for (NSUInteger i = min; i < max; i++) {
        [tbr addObject:[NSNumber numberWithInteger:i]];
    }
    
    return tbr;
}

@end
