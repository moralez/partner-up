//
//  TableSectionHeaderView.m
//  Partner Up
//
//  Created by Logen Watkins on 1/3/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "TableSectionHeaderView.h"

@implementation TableSectionHeaderView

@synthesize titleButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

// Returns the standard-sized, 1-button section header
- (id) initSingleButtonTitled:(NSString *)title
{
    // This does not handle multiple orientations or resolutions
    CGFloat buttonWidth = 300.0;
    CGFloat buttonHeight = 44.0;
    CGFloat cellBorderPadding = 10.0;
    CGFloat buttonTextPaddingX = 10.0;
    CGFloat buttonTextPaddingY = 10.0;
    
    // Create view
    TableSectionHeaderView *newView = [self initWithFrame:CGRectMake(150, 150, buttonWidth, buttonHeight + cellBorderPadding)];
    [newView setBackgroundColor:[UIColor clearColor]];

    // Create button with standard sizes
    titleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [titleButton setFrame:CGRectMake(buttonTextPaddingX, buttonTextPaddingY, buttonWidth, buttonHeight)]; //dynamic?
    [titleButton setTitle:title forState:UIControlStateNormal];
    
    // Alignment, padding
    [titleButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [titleButton setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [titleButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, buttonTextPaddingX, buttonTextPaddingX, 0.0)];
    [newView addSubview:titleButton];
    
    // Return the modified view
    return newView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
