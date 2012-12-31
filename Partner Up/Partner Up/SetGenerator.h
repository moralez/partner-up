//
//  SetGenerator.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/30/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetEntity.h"

@class GroupEntity;

@interface SetGenerator : NSObject

+ (void)generateSetsForGroup:(GroupEntity*)group;
+ (NSString *)delineatedPersonsList:(SetEntity *)currentSet;

@end
