//
//  IndentedLabel.m
//  Partner Up
//
//  Created by Johnny Moralez on 1/9/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "IndentedLabel.h"

@implementation IndentedLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 // Drawing code
}
*/

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 15, 0, 0);
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
