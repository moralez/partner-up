//
//  ClassDetailsViewController.m
//  Partner Up
//
//  Created by Logen Watkins on 12/27/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "ClassDetailsViewController.h"
#import "StdInclude.h"

@interface ClassDetailsViewController ()

@end

@implementation ClassDetailsViewController

@synthesize classNameField;
@synthesize classSizeStepper;
@synthesize classSizeLabel;
@synthesize thisClass;

- (void) updateClassSizeLabel
{
    classSizeLabel.text = [NSString stringWithFormat:@"%d", (int)classSizeStepper.value];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (nil == thisClass)
    {
        // Not passed a class entity, use defaults
        self.navigationItem.title = @"New Class";
        classNameField.text = @"";
        classSizeStepper.value = DEFAULT_CLASS_SIZE;
    } else {
        // Passed a class entity, use it's information
        self.navigationItem.title = thisClass.name;
        classNameField.text = thisClass.name;
        classSizeStepper.value = [thisClass.size doubleValue];
    }

    // Set all labels appropriately
    [self updateClassSizeLabel];
    
    // This gesture recognizer is used to dismiss the keyboard if another part of the screen is touched
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)]];
    
    // Set range for stepper
    [classSizeStepper setMinimumValue:(double)MIN_CLASS_SIZE];
    [classSizeStepper setMaximumValue:(double)MAX_CLASS_SIZE];
}

- (void)hideKeyboard:(id)sender {
    // Hide keyboard
    [self.view endEditing:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Assign delegate to catch keypresses
    [classNameField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    // Error checking -- WATK should check for duplicates
    if ([[classNameField text] length] <= 0) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Missing information."
                                                        message:@"Class name is too short!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        // Don't continue saving.
        return;
    }

    // Load data into entity
    // If an entity for this parentClass doesn't exist, create one
    if (nil == thisClass) {
        thisClass = [ClassEntity create];
        thisClass.protectedValue = NO;
    }

    // Assign fields
    thisClass.name = classNameField.text;
    thisClass.sizeValue = classSizeStepper.value;
    
    // Save entity
    NSLog(@"Saving new Class, name: %@, size: %@", thisClass.name, thisClass.size);
    [SingleCDStack saveChanges];
    
    // Pop to previous view
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)classSizeStepperAction:(id)sender {
    [self updateClassSizeLabel];
}

// When user presses "Done", hide the keyboard
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    // Hide keyboard
    [self hideKeyboard:nil];
    return YES;
}

@end
