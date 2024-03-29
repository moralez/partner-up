//
//  ClassDetailsViewController.h
//  Partner Up
//
//  Created by Logen Watkins on 12/27/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassEntity.h"

@interface ClassDetailsViewController : UIViewController <UITextFieldDelegate>
{

}


- (IBAction)saveButton:(id)sender;
- (IBAction)classSizeStepperAction:(id)sender;

@property (strong, nonatomic) ClassEntity *thisClass;
@property (weak, nonatomic) IBOutlet UITextField *classNameField;
@property (weak, nonatomic) IBOutlet UILabel *classSizeLabel;
@property (weak, nonatomic) IBOutlet UIStepper *classSizeStepper;


@end
