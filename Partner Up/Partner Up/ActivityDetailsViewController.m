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
#import "NSMutableArray+Helpers.h"
#import "StdInclude.h"

@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController

@synthesize parentClass;
@synthesize thisActivity;
@synthesize initialName;
@synthesize activityNameField;
@synthesize classSizeLabel;
@synthesize groupSizeLabel;
@synthesize numberPicker;

- (void) updateClassSizeLabel:(NSNumber *)newSize
{
    // Update the local variable with value in picker view
    newClassSize = newSize;
    
    // WATK remove below
    classSizeLabel.text = [NSString stringWithFormat:@"%@", newSize];
}

- (void) updateGroupSizeLabel:(NSNumber *)newSize
{
    // Update the local variable with value in picker view
    newGroupSize = newSize;

    // WATK remove below
    groupSizeLabel.text = [NSString stringWithFormat:@"%@", newSize];
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
        // No parentClass passed in, assign it the default (protected) class
        parentClass = [ClassEntity findFirstByAttribute:@"protected" withValue:[NSNumber numberWithBool:YES]];
        // Double-check that it worked
        if (nil == parentClass) {
            NSLog(@"Error!!! Protected class not found!");
        } else {
            NSLog(@"No parentClass provided, used default.");
        }
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

        newClassSize = parentClass.size;
        newGroupSize = [NSNumber numberWithInt:DEFAULT_GROUP_SIZE];
    } else {
        // Passed a activity entity, use it's information
        self.navigationItem.title = thisActivity.name;
        activityNameField.text = thisActivity.name;
        newClassSize = thisActivity.classSize;
        newGroupSize = thisActivity.groupSize;
    }
    
    // Update all labels
    [self updateClassSizeLabel:newClassSize];
    [self updateGroupSizeLabel:newGroupSize];
    
    // Create arrays for use by PickerView
    classSizeArray = [NSMutableArray numberedArrayWithMin:MIN_CLASS_SIZE withMax:MAX_CLASS_SIZE];
    groupSizeArray = [NSMutableArray numberedArrayWithMin:MIN_GROUP_SIZE withMax:MAX_GROUP_SIZE];
    
    // WATK -- idea. Tie the array for group sizes to class sizes by reloading when a class selection
    //  is made, and adjust group size if greater than classSize / 2.
    // Set up the PickerView -- all values are hardcoded here but need to be enforced app-wide
    CGFloat pickerWidth = 125.0;
    CGFloat pickerHeight = 155.0;
    CGRect pickerFrame = CGRectMake((self.view.frame.size.width / 2) - (pickerWidth / 2), 110.0, pickerWidth, pickerHeight); // hardcoded...
    UIPickerView *multiPicker = [[UIPickerView alloc] initWithFrame:pickerFrame];
    multiPicker.delegate = self;
    // Set the initial values for each component
    [multiPicker selectRow:([newClassSize intValue] - MIN_CLASS_SIZE) inComponent:PICKER_CLASSSIZE animated:YES];
    [multiPicker selectRow:([newGroupSize intValue] - MIN_GROUP_SIZE) inComponent:PICKER_GROUPSIZE animated:YES];
    [self.view addSubview:multiPicker];
    
    // This gesture recognizer is used to dismiss the keyboard if another part of the screen is touched
//    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)]];
    [self.view addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)]];
}

- (void)hideKeyboard:(id)sender {
    // Hide keyboard
    [self.view endEditing:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - number picker
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // hard-coded, oops
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger retVal = 0;
    switch (component) {
        case PICKER_CLASSSIZE:
            retVal = [classSizeArray count];
            break;
        case PICKER_GROUPSIZE:
            retVal = [groupSizeArray count];
            break;
        default:
            NSLog(@"Error! Unhandled component #%d", component);
            break;
    }
    return retVal;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *retVal;
    switch (component) {
        case PICKER_CLASSSIZE:
            retVal = [NSString stringWithFormat:@"%@", [classSizeArray objectAtIndex:row]];
            break;
        case PICKER_GROUPSIZE:
            retVal = [NSString stringWithFormat:@"%@", [groupSizeArray objectAtIndex:row]];
            break;
        default:
            NSLog(@"Error! Unhandled component #%d", component);
            break;
    }
    return retVal;
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case PICKER_CLASSSIZE:
            [self updateClassSizeLabel:[classSizeArray objectAtIndex:row]];
            break;
        case PICKER_GROUPSIZE:
            [self updateGroupSizeLabel:[groupSizeArray objectAtIndex:row]];
            break;
        default:
            NSLog(@"Error! Unhandled component #%d", component);
            break;
    }
}


#pragma mark - other stuff

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
    } else if ([newClassSize intValue] <= [newGroupSize intValue]) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Invalid: Class <= Group Size"
                                                        message:@"Unable to split class into desired number of groups"
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
    thisActivity.classSize = newClassSize;
    thisActivity.groupSize = newGroupSize;
    
    // Save entity
    NSLog(@"Saving activity entity, name: %@, classSize: %@, groupSize: %@", thisActivity.name, thisActivity.classSize, thisActivity.groupSize);
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
    // Ensure that an activity is created successfully before performing segue
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
    [self hideKeyboard:nil];
    return YES;
}

@end
