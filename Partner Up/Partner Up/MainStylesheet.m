//
//  MainStylesheet.m
//  Partner Up
//
//  Created by Johnny Moralez on 1/9/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "MainStylesheet.h"
#import "IndentedLabel.h"

@implementation MainStylesheet

+ (void)setDefaultStyle {
    // UINavigationBar style
    [[UINavigationBar appearance] setTintColor:[UIColor darkGrayColor]];
}

+ (UILabel*)tableViewSectionHeaderLabel {
    IndentedLabel *headerLabel = [[IndentedLabel alloc] initWithFrame:CGRectZero];
    
    [headerLabel setFont:[UIFont fontWithName:@"HoeflerText-Black" size:20.0f]];
    [headerLabel setTextColor:[UIColor blackColor]];
    [headerLabel setShadowColor:[UIColor lightGrayColor]];
    [headerLabel setBackgroundColor:[UIColor clearColor]];\
    [headerLabel setAlpha:0.8f];
    
    return headerLabel;
}

+ (UIColor*)tableViewBackground {
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"table-view-bg"]];
}

@end
