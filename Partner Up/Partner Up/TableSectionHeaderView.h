//
//  TableSectionHeaderView.h
//  Partner Up
//
//  Created by Logen Watkins on 1/3/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableSectionHeaderView : UIView

@property (strong, nonatomic) UIButton *titleButton;
- (id) initSingleButtonTitled:(NSString *)title;

@end
