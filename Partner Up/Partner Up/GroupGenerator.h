//
//  SetGenerator.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/30/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroupEntity.h"

@class ActivityEntity;

@interface GroupGenerator : NSObject

+ (void)generateGroupsForActivity:(ActivityEntity*)activity;
+ (NSString *)delineatedPersonsList:(GroupEntity *)currentGroup;

@end
