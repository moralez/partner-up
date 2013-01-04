//
//  GroupDetailsViewController.m
//  Partner Up
//
//  Created by Logen Watkins on 12/29/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "GroupDetailsViewController.h"
#import "SetGenerator.h"
#import "SetViewController.h"

@interface GroupDetailsViewController ()

@end

@implementation GroupDetailsViewController

@synthesize parentClass;
@synthesize thisGroup;
@synthesize initialName;
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
        // If passed an initialName, set it here
        if (nil == initialName) {
            groupNameField.text = @"";
        } else {
            groupNameField.text = initialName;
        }
        classSizeStepper.value = [parentClass.size doubleValue];
        // WATK -- Will we have per-class defaults, or just app-wide defaults?
        groupSizeStepper.value = 2;
    } else {
        // Passed a group entity, use it's information
        self.navigationItem.title = thisGroup.name;
        groupNameField.text = thisGroup.name;
        classSizeStepper.value = [thisGroup.classSize doubleValue];
        groupSizeStepper.value = [thisGroup.setSize doubleValue];
    }
    
    // As this view is presented modally, modify the left bar button action
    [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                                 style:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(cancelGroup)]];    

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

- (void)cancelGroup {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Returns YES if creation is successful
- (BOOL)createGroup {
    // Start with failure
    BOOL noErrors = NO;
    
    // Error checking
    if ([[[self groupNameField] text] length] <= 0) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Missing Field"
                                                        message:@"Some information is missing."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        return noErrors;
    } else if ([classSizeStepper value] <= [groupSizeStepper value]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Invalid Class - Group Size"
                                                        message:@"Unable to split class into desired number of groups"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        return noErrors;
    }

    
    // Load data into entity
    // If an entity for this Group doesn't exist, create one
    if (nil == thisGroup) {
        thisGroup = [GroupEntity create];
        thisGroup.parentClass = parentClass;
    }

    // Assign fields
    thisGroup.name = groupNameField.text;
    thisGroup.classSizeValue = classSizeStepper.value;
    thisGroup.setSizeValue = groupSizeStepper.value;
    
    // Save entity
    NSLog(@"Saving group entity, name: %@, classSize: %@, groupSize: %@", thisGroup.name, thisGroup.classSize, thisGroup.setSize);
    [SingleCDStack saveChanges];
    
    // Actually generate the sets
    [SetGenerator generateSetsForGroup:thisGroup];
    
    // Everything succeeded, return noErrors = YES
    noErrors = YES;
    return noErrors;
}

// This method determines whether to let the segue proceed
- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    // Ensure that a group is created successfully before performing segue
    if ([identifier isEqualToString:@"SetsTableView"]) {
        // Create group and associated sets/persons
        BOOL groupCreated = [self createGroup];
        if (NO == groupCreated) {
            // Group creation failed. Do not leave view
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
    if ([[segue identifier] isEqualToString:@"SetsTableView"]) {
        // Get the selected group object and pass to next screen
        [[segue destinationViewController] setParentGroup:thisGroup];
        
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
