//
//  GroupTableViewController.h
//  Partner Up
//
//  Created by Logen Watkins on 12/30/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityEntity.h"

@interface GroupTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    NSManagedObjectContext *singleContext;
}

@property (strong, nonatomic) ActivityEntity *parentActivity;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
