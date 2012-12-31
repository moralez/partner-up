//
//  GroupDetailsViewController.h
//  Partner Up
//
//  Created by Logen Watkins on 12/29/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassEntity.h"
#import "GroupEntity.h"

@interface GroupDetailsViewController : UIViewController <UITextFieldDelegate>

- (IBAction)classSizeStepperAction:(id)sender;
- (IBAction)groupSizeStepperAction:(id)sender;

@property (strong, nonatomic) ClassEntity *parentClass;
@property (strong, nonatomic) GroupEntity *thisGroup;
@property (weak, nonatomic) IBOutlet UITextField *groupNameField;
@property (weak, nonatomic) IBOutlet UILabel *classSizeLabel;
@property (weak, nonatomic) IBOutlet UIStepper *classSizeStepper;
@property (weak, nonatomic) IBOutlet UILabel *groupSizeLabel;
@property (weak, nonatomic) IBOutlet UIStepper *groupSizeStepper;




@end
