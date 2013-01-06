//
//  NSMutableArray+Helpers.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/31/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Helpers)

+ (NSMutableArray*)numberedArrayWithSize:(NSUInteger)size;
+ (NSMutableArray *)numberedArrayWithMin:(NSUInteger)min withMax:(NSUInteger)max;

@end
