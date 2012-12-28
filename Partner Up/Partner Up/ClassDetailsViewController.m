//
//  ClassDetailsViewController.m
//  Partner Up
//
//  Created by Logen Watkins on 12/27/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "ClassDetailsViewController.h"
#import "ClassEntity.h"

@interface ClassDetailsViewController ()

@end

@implementation ClassDetailsViewController

@synthesize classNameField;
@synthesize classSizeStepper;
@synthesize classSizeLabel;

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
    
    // Set defaults -- this will be temporary, as eventually I think we'd populate with entity values
    classSizeStepper.value = 10;
    [self updateClassSizeLabel];
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
    // Create, load data into entity
    ClassEntity *newClass = (ClassEntity *)[ClassEntity create];
    newClass.name = classNameField.text;
    newClass.size = [NSNumber numberWithDouble:classSizeStepper.value];
    
    // Save entity
    NSLog(@"Saving new Class, name: %@, size: %@", newClass.name, newClass.size);
    [SingleCDStack saveChanges];
    
    // Pop to previous view
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)classSizeStepperAction:(id)sender {
    [self updateClassSizeLabel];
}

@end
