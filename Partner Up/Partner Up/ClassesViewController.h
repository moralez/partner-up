//
//  ClassesViewController.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/26/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupsViewController;

#import <CoreData/CoreData.h>

@interface ClassesViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    NSManagedObjectContext *singleContext;
    NSArray                *customOptions;
}

@property (strong, nonatomic) GroupsViewController *GroupsViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
