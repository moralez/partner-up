//
//  AppDelegate.m
//  Partner Up
//
//  Created by Johnny Moralez on 12/26/12.
//  Copyright (c) 2012 Bathroom Gaming. All rights reserved.
//

// TestFlight recommendation
#define TESTING 1

#import "AppDelegate.h"
#import "ClassEntity.h"
#import "PersonEntity.h"
#import "StdInclude.h"
#import "ActivityEntity.h" // WATK remove after not creating fake activities

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // TestFlight
    #ifdef TESTING
        [TestFlight setDeviceIdentifier:[[UIDevice currentDevice] uniqueIdentifier]];
    #endif
    [TestFlight takeOff:@"3f90302d-50ac-4ed9-ac0b-ff5854f5cd68"];
    
    // Create QuickActivities class if it doesn't exist.
    NSString *previousQuickActivities = @"'Class'-less groups";
    ClassEntity *quickActivitiesClass;
    quickActivitiesClass = [ClassEntity findFirstByAttribute:@"name" withValue:previousQuickActivities];
    if (nil == quickActivitiesClass) {
        quickActivitiesClass = [ClassEntity create];
        quickActivitiesClass.name = previousQuickActivities;
        quickActivitiesClass.sizeValue = DEFAULT_CLASS_SIZE;
        quickActivitiesClass.protectedValue = YES;
        [SingleCDStack saveChanges];
    }

    // WATK -- Temporary measure to ensure that header for section appears. Not sure correct method
    // We always want at least one unprotected class (not Quick Activities)
    //  to exist so everything looks good
    ClassEntity *unprotectedClass = [ClassEntity findFirstByAttribute:@"protected"
                                                            withValue:[NSNumber numberWithBool:NO]];
    if (nil == unprotectedClass) {
        unprotectedClass = [ClassEntity create];
        unprotectedClass.name = @"No classes exist yet...";
        unprotectedClass.sizeValue = DEFAULT_CLASS_SIZE;
        unprotectedClass.protectedValue = NO;
        [SingleCDStack saveChanges];
    }
    
    // WATK -- Another temporary measure. Adding an empty activity just to make sure that view works
    ActivityEntity *newActivity = [ActivityEntity findFirstByAttribute:@"name" withValue:@"test!"];
    if (nil == newActivity) {
        newActivity = [ActivityEntity create];
        newActivity.name = @"test!";
        newActivity.parentClass = unprotectedClass;
        newActivity.classSizeValue = DEFAULT_CLASS_SIZE;
        newActivity.groupSizeValue = DEFAULT_GROUP_SIZE;
        [SingleCDStack saveChanges];
    }
    
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    } else {
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [[SingleCDStack sharedInstance] saveContext];
}

@end