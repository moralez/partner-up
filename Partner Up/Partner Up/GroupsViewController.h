//
//  GroupsViewController.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/26/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupsViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;


@property (weak, nonatomic) IBOutlet UITextField *groupNameField;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
