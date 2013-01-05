//
//  ActivityDetailsViewController.m
//  Partner Up
//
//  Created by Logen Watkins on 12/29/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "GroupGenerator.h"
#import "GroupTableViewController.h"

@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController

@synthesize parentClass;
@synthesize thisActivity;
@synthesize initialName;
@synthesize activityNameField;
@synthesize classSizeLabel;
@synthesize classSizeStepper;
@synthesize activitySizeLabel;
@synthesize activitySizeStepper;

- (void) updateClassSizeLabel
{
    classSizeLabel.text = [NSString stringWithFormat:@"%d", (int)classSizeStepper.value];
}

- (void) updateActivitySizeLabel
{
    activitySizeLabel.text = [NSString stringWithFormat:@"%d", (int)activitySizeStepper.value];
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
    self.navigationItem.title = [thisActivity.name description];
    
    // Assign delegate to catch keypresses
    [activityNameField setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // If parentClass == nil, serious error has occurred
    if (nil == parentClass)
    {
        NSLog("Error! No parent class for activity");
    }
    
    if (nil == thisActivity)
    {
        // Not passed a activity entity, use class defaults where applicable
        self.navigationItem.title = @"New Activity";
        // If passed an initialName, set it here
        if (nil == initialName) {
            activityNameField.text = @"";
        } else {
            activityNameField.text = initialName;
        }
        classSizeStepper.value = [parentClass.size doubleValue];
        // WATK -- Will we have per-class defaults, or just app-wide defaults?
        activitySizeStepper.value = 2;
    } else {
        // Passed a activity entity, use it's information
        self.navigationItem.title = thisActivity.name;
        activityNameField.text = thisActivity.name;
        classSizeStepper.value = [thisActivity.classSize doubleValue];
        activitySizeStepper.value = [thisActivity.groupSize doubleValue];
    }
    
    // As this view is presented modally, modify the left bar button action
    [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                                 style:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(cancelActivity)]];    

    // Update all labels
    [self updateClassSizeLabel];
    [self updateActivitySizeLabel];
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

- (IBAction)activitySizeStepperAction:(id)sender {
    // Hide keyboard, update label
    [self.view endEditing:NO];
    [self updateActivitySizeLabel];
}

- (void)cancelActivity {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Returns YES if creation is successful
- (BOOL)createActivity {
    // Start with failure
    BOOL noErrors = NO;
    
    // Error checking
    if ([[[self activityNameField] text] length] <= 0) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Missing Field"
                                                        message:@"Some information is missing."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        return noErrors;
    } else if ([classSizeStepper value] <= [activitySizeStepper value]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Invalid Class - Activity Size"
                                                        message:@"Unable to split class into desired number of activities"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        return noErrors;
    }

    
    // Load data into entity
    // If an entity for this Activity doesn't exist, create one
    if (nil == thisActivity) {
        thisActivity = [ActivityEntity create];
        thisActivity.parentClass = parentClass;
    }

    // Assign fields
    thisActivity.name = activityNameField.text;
    thisActivity.classSizeValue = classSizeStepper.value;
    thisActivity.groupSizeValue = activitySizeStepper.value;
    
    // Save entity
    NSLog(@"Saving activity entity, name: %@, classSize: %@, activitySize: %@", thisActivity.name, thisActivity.classSize, thisActivity.groupSize);
    [SingleCDStack saveChanges];
    
    // Actually generate the groups
    [GroupGenerator generateGroupsForActivity:thisActivity];
    
    // Everything succeeded, return noErrors = YES
    noErrors = YES;
    return noErrors;
}

// This method determines whether to let the segue proceed
- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    // Ensure that a activity is created successfully before performing segue
    if ([identifier isEqualToString:@"GroupTableView"]) {
        // Create activity and associated sets/persons
        BOOL activityCreated = [self createActivity];
        if (NO == activityCreated) {
            // Activity creation failed. Do not leave view
            return NO;
        }
    }
    
    // In all other cases, return success
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Begin work for transition
    NSString *backButtonTitle;
    if ([[segue identifier] isEqualToString:@"GroupTableView"]) {
        // Get the selected activity object and pass to next screen
        [[segue destinationViewController] setParentActivity:thisActivity];
        
        // Rename back button for next screen
        backButtonTitle = @"Back";
    }
    
    // Add back button with custom title
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle
                                                                      style:UIBarButtonItemStyleBordered
                                                                     target:nil
                                                                     action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
}

// When user presses "Done", hide the keyboard
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:NO];
    return YES;
}

@end
