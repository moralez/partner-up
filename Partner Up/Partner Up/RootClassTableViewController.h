//
//  ClassTableViewController.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/26/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class RootClassTableViewController;

// Tableview sections
enum  {
    TABLEVIEW_CLASSES = 0, // 0
};

@interface RootClassTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    NSManagedObjectContext *singleContext;
    NSArray                *customOptions;
}

//@property (strong, nonatomic) ActivityTableViewController *ActivityViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
