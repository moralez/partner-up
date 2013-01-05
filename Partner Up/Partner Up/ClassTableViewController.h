//
//  ClassTableViewController.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/26/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassTableViewController;

#import <CoreData/CoreData.h>

// Tableview sections
enum  {
    TABLEVIEW_QUICKGROUPS = 0,
    TABLEVIEW_CLASSES, // 1
    TABLEVIEW_SECTION_COUNT // 2
};

@interface ClassTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    NSManagedObjectContext *singleContext;
    NSArray                *customOptions;
}

//@property (strong, nonatomic) ActivityTableViewController *ActivityViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
