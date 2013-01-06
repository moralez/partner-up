//
//  ActivityDetailsViewController.h
//  Partner Up
//
//  Created by Logen Watkins on 12/29/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassEntity.h"
#import "ActivityEntity.h"

// PickerView components
enum {
    PICKER_CLASSSIZE = 0,
    PICKER_GROUPSIZE // 1
};

@interface ActivityDetailsViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    NSMutableArray *classSizeArray;
    NSMutableArray *groupSizeArray;
    NSNumber *newClassSize;
    NSNumber *newGroupSize;
}


@property (strong, nonatomic) ClassEntity *parentClass;
@property (strong, nonatomic) ActivityEntity *thisActivity;
@property (strong, nonatomic) NSString *initialName;
@property (weak, nonatomic) IBOutlet UITextField *activityNameField;
@property (weak, nonatomic) IBOutlet UILabel *classSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupSizeLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *numberPicker;

@end
