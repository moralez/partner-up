//
//  SetGenerator.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/30/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetEntity.h"

@class ActivityEntity;

@interface SetGenerator : NSObject

+ (void)generateSetsForActivity:(ActivityEntity*)activity;
+ (NSString *)delineatedPersonsList:(SetEntity *)currentSet;

@end
