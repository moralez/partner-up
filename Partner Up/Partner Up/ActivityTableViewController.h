//
//  ActivityTableViewController.h
//  Partner Up
//
//  Created by Johnny Moralez on 12/26/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassEntity.h"
#import "ActivityEntity.h"

// Tableview sections
enum  {
    TABLEVIEW_ACTIVITIES = 0, // 0
};

@interface ActivityTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    NSManagedObjectContext *singleContext;    
}


@property (strong, nonatomic) ClassEntity *parentClass;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
