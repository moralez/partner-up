//
//  ClassTableViewController.m
//  Partner Up
//
//  Created by Johnny Moralez on 12/26/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import "RootViewController.h"
#import "ClassTableViewController.h"
#import "ClassDetailsViewController.h"
#import "ActivityTableViewController.h"
#import "ActivityDetailsViewController.h"
#import "TableSectionHeaderView.h"
#import "StdInclude.h"

#import "AppDelegate.h"

@interface ClassTableViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation ClassTableViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}
- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];

     // Remove Back Button
     [[self navigationItem] setHidesBackButton:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Get context
    singleContext = [SingleCDStack getContext];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// WATK -- double check, believe this can be removed
- (void)insertNewObject:(id)sender
{
    NSLog(@"insertNewObject() called, no implementation!");
}

#pragma mark - Table View

// Section header button calls this method to segue quick activity creation
- (void) createQuickActivity: (UIButton *)sender
{
    RootViewController *parentVC = (RootViewController *)[self parentViewController];
    [parentVC pushToActivityDetailsView];
//    [self performSegueWithIdentifier:@"ActivityDetailsView" sender:self];
}
// Section header button calls this method to segue for class creation
- (void) createClass: (UIButton *)sender
{
    [self performSegueWithIdentifier:@"ClassDetailsView" sender:self];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //watk temp
    // Will create a view customized to each section
    TableSectionHeaderView *headerView;

    switch (section) {
        case TABLEVIEW_QUICKGROUPS:
        {
            // Create the view with a single button
            headerView = [[TableSectionHeaderView alloc] initSingleButtonTitled:@"Create quick activity"];
            
            // Action for button press
            [[headerView titleButton] addTarget:self action:@selector(createQuickActivity:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case TABLEVIEW_CLASSES:
        {
            // Create the view with a single button
            headerView = [[TableSectionHeaderView alloc] initSingleButtonTitled:@"Create new class"];
            
            // Action for button press
            [[headerView titleButton] addTarget:self action:@selector(createClass:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        default:
            break;
    }
    
    return headerView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 54.0; //watk temp
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger retVal = 0;
    
    switch (section) {
        default:
        {
            id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
            retVal = [sectionInfo numberOfObjects];
            break;
        }
    }
    
    return retVal;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    switch ([indexPath section]) {
        default:
            [self configureCell:cell atIndexPath:indexPath];
            break;
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL retVal = YES;
    switch ([indexPath section]) {
        case TABLEVIEW_QUICKGROUPS:
            // Do not allow removal of the QuickActivities class
            retVal = NO;
            break;
        default:
            break;
    }
    
    return retVal;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [singleContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        [SingleCDStack saveChanges];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     // No special handling on selection (class entity passed through segue)
    NSLog(@"Did select section: %d, row: %d", [indexPath section], [indexPath row]);
}

// All segue prepartion (passing objects, etc...) is handled here
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *backButtonTitle;

    if ([[segue identifier] isEqualToString:@"ActivityTableView"]) {
        // All selected cells follow this segue, indexPath is the selected row
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        // Get the selected class object and pass to next screen
        ClassEntity *parentClass = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        [[segue destinationViewController] setParentClass:parentClass];
        
        // Rename back button for next screen
        backButtonTitle = @"Back";
    } else if ([[segue identifier] isEqualToString:@"ActivityDetailsView"]) {
        // Want the class object for quick activities, always the only element of that section
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:TABLEVIEW_QUICKGROUPS];
        ClassEntity *parentClass = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//        ActivityDetailsViewController *activityDVC = [[(UINavigationController*)[segue destinationViewController] viewControllers] lastObject];
//        [activityDVC setParentClass:parentClass];
        [[segue destinationViewController] setParentClass:parentClass];
        
        // Pre-populate the name of this activity with the data & time
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMMM DD, YYYY - hh:mm a"];
//        [activityDVC setInitialName:[dateFormatter stringFromDate:[NSDate date]]];
        [[segue destinationViewController] setInitialName:[dateFormatter stringFromDate:[NSDate date]]];
        
        // Rename back button for next screen
        backButtonTitle = @"Cancel";
    } else if ([[segue identifier] isEqualToString:@"ClassDetailsView"]) {
        // Rename back button for next screen
        backButtonTitle = @"Cancel";
    } else {
        NSLog(@"Error! Unhandled segue titled: %@", [segue identifier]);
        backButtonTitle = @"Back";
    }
    
    // Add back button with custom title specified above
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle
                                                                      style:UIBarButtonItemStyleBordered
                                                                     target:nil
                                                                     action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }

    // Create fetch request for Entity
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [ClassEntity entityInManagedObjectContext:singleContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Sort by "protected" to get the sections themselves are ordered correctly
    NSSortDescriptor *protectedSort = [[NSSortDescriptor alloc] initWithKey:@"protected" ascending:YES];
    // Sort by "name" so that the results inside of each section are ordered correctly
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:protectedSort, nameSort, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // Use 'protected' as sectionNameKeyPath so that activity is split with only "Quick Activities" sticking to the top
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:singleContext sectionNameKeyPath:@"protected" cacheName:@"ClassesView"];
     aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	     // Replace this implementation with code to handle the error appropriately.
	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Configuring section: %d, row: %d", [indexPath section], [indexPath row]);
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"name"] description];
    // WATK -- some recommend putting in cellWillAppear -- unsure of performance
    cell.backgroundColor = UI_LIGHTGRAY;
}

@end
