//
//  GroupDetailsViewController.m
//  Partner Up
//
//  Created by Logen Watkins on 12/29/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "GroupDetailsViewController.h"

@interface GroupDetailsViewController ()

@end

@implementation GroupDetailsViewController

@synthesize parentClass;
@synthesize thisGroup;
@synthesize groupNameField;
@synthesize classSizeLabel;
@synthesize classSizeStepper;
@synthesize groupSizeLabel;
@synthesize groupSizeStepper;

- (void) updateClassSizeLabel
{
    classSizeLabel.text = [NSString stringWithFormat:@"%d", (int)classSizeStepper.value];
}

- (void) updateGroupSizeLabel
{
    groupSizeLabel.text = [NSString stringWithFormat:@"%d", (int)groupSizeStepper.value];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    // Use class name as title for this view
    self.navigationItem.title = [thisGroup.name description];
    
    // Assign delegate to catch keypresses
    [groupNameField setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // If parentClass == nil, serious error has occurred
    if (nil == parentClass)
    {
        NSLog("Error! No parent class for group");
    }
    
    if (nil == thisGroup)
    {
        // Not passed a group entity, use class defaults where applicable
        self.navigationItem.title = @"New Group";
        groupNameField.text = @"";
        classSizeStepper.value = [parentClass.size doubleValue];
        // WATK -- Will we have per-class defaults, or just app-wide defaults?
        groupSizeStepper.value = 2;
    } else {
        // Passed a group entity, use it's information
        self.navigationItem.title = thisGroup.name;
        groupNameField.text = thisGroup.name;
        classSizeStepper.value = [thisGroup.classSize doubleValue];
        groupSizeStepper.value = [thisGroup.groupSize doubleValue];
    }
    
    // Update all labels
    [self updateClassSizeLabel];
    [self updateGroupSizeLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)classSizeStepperAction:(id)sender {
    // Hide keyboard, update label
    [self.view endEditing:NO];
    [self updateClassSizeLabel];
}

- (IBAction)groupSizeStepperAction:(id)sender {
    // Hide keyboard, update label
    [self.view endEditing:NO];
    [self updateGroupSizeLabel];
}

- (IBAction)saveButton:(id)sender {
    // WATK -- no error checking of any kind
    
    // Load data into entity
    // If an entity for this Group doesn't exist, create one
    if (nil == thisGroup) {
        thisGroup = [GroupEntity create];
        thisGroup.parentClass = parentClass;
    }

    // Assign fields
    thisGroup.name = groupNameField.text;
    thisGroup.classSize = [NSNumber numberWithDouble:classSizeStepper.value];
    thisGroup.groupSize = [NSNumber numberWithDouble:groupSizeStepper.value];
    
    // Save entity
    NSLog(@"Saving group entity, name: %@, classSize: %@, groupSize: %@", thisGroup.name, thisGroup.classSize, thisGroup.groupSize);
    [SingleCDStack saveChanges];
    
    // Pop to previous view
    [self.navigationController popViewControllerAnimated: YES];
}

// When user presses "Done", hide the keyboard
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:NO];
    return YES;
}

@end
