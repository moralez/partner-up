//
//  ClassDetailsViewController.m
//  Partner Up
//
//  Created by Logen Watkins on 12/27/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "ClassDetailsViewController.h"

@interface ClassDetailsViewController ()

@end

@implementation ClassDetailsViewController

@synthesize classNameField;
@synthesize classSizeStepper;
@synthesize classSizeLabel;
@synthesize parentClass;

- (void)setParentClass:(ClassEntity *)newParentClass
{
    if (parentClass != newParentClass) {
        parentClass = newParentClass;
    }
}

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

    if (nil == parentClass)
    {
        // Not passed a class entity, use defaults
        self.navigationItem.title = @"New Class";
        classSizeStepper.value = 10;
    } else {
        // Passed a class entity, use it's information
        self.navigationItem.title = parentClass.name;
        classSizeStepper.value = [parentClass.size doubleValue];
    }

    // Update labels as appropriate
    [self updateClassSizeLabel];
    
    // Set the delegate so that keyboard hides correctly
    [classNameField setDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    // WATK -- no error checking of any kind

    // Load data into entity
    // If an entity for this parentClass doesn't exist, create one
    if (nil == parentClass) {
        parentClass = (ClassEntity *)[ClassEntity create];
    }

    parentClass.name = classNameField.text;
    parentClass.size = [NSNumber numberWithDouble:classSizeStepper.value];
    
    // Save entity
    NSLog(@"Saving new Class, name: %@, size: %@", parentClass.name, parentClass.size);
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
    [textField resignFirstResponder];
    return YES;
}

@end
