//
//  RootViewController.m
//  Partner Up
//
//  Created by Logen Watkins on 1/4/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import "RootViewController.h"
#import "ClassTableViewController.h"
#import "ActivityTableViewController.h"
#import "ActivityDetailsViewController.h"
#import "StdInclude.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize currentViewController;

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
    NSLog(@"Loading root view controller");
    
    // Customize the navigation bar
    self.navigationController.navigationBar.tintColor = UI_ROYALBLUE_3;
    
    // Set up initial view (WATK should consolidate this code w/ other method)
    rootViewHeight = 45.0;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ClassTableViewController *classVC = [storyboard instantiateViewControllerWithIdentifier:@"ClassTableViewController"];
    self.currentViewController = classVC;
    self.currentViewController.view.frame = CGRectMake(0.0, rootViewHeight, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.currentViewController];
    [self.view addSubview:self.currentViewController.view];
}

- (IBAction)segmentedControlAction:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case SEGMENT_CLASSES:
            // Push to classes tableview
            [self swapToClassTableView];
            break;
        case SEGMENT_ACTIVITIES:
            // Push to activities tableview
            [self swapToActivityTableView];
            break;
        default:
            NSLog(@"Error! Unhandled segment %d", [sender selectedSegmentIndex]);
            break;
    }
}

// Swap vs. Push and navigation concerns TBD
- (void)swapToClassTableView {
    NSLog(@"Creating ClassTableViewController");
    // Creat the view controller
    ClassTableViewController *newViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    newViewController = [storyboard instantiateViewControllerWithIdentifier:@"ClassTableViewController"];
    
    // Swap to this view controller
    [self swapToViewController:newViewController];
}

- (void)swapToActivityTableView {
    NSLog(@"Creating ActivityTableViewController");
    // Creat the view controller
    ActivityTableViewController *newViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    newViewController = [storyboard instantiateViewControllerWithIdentifier:@"ActivityTableViewController"];
    
    // Swap to this view controller
    [self swapToViewController:newViewController];
}

- (void)pushToActivityDetailsView {
    NSLog(@"Creating ActivityDetailsViewController");
    // Creat the view controller
    ActivityDetailsViewController *newViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    newViewController = [storyboard instantiateViewControllerWithIdentifier:@"ActivityDetailsViewController"];
    // Swap to this view controller
    [self swapToViewController:newViewController];
}

- (void)swapToViewController:(UIViewController *)newViewController {
    NSLog(@"Beginning transition");
    // Add as child to root view controller
    [self addChildViewController:newViewController];
    
    // Define the start/end frame for the view, so that it transitions in from right side of screen
    CGRect inputViewFrame = self.view.frame;
    CGRect startFrame = CGRectMake(self.view.bounds.size.width, rootViewHeight, inputViewFrame.size.width, inputViewFrame.size.height);
    newViewController.view.frame=startFrame;
    CGRect endFrame = CGRectMake(0, rootViewHeight, inputViewFrame.size.width, inputViewFrame.size.height);
    
    // Begin transition
    [self transitionFromViewController:self.currentViewController
                      toViewController:newViewController
                              duration:0.5
                               options:UIViewAnimationOptionTransitionNone
                            animations:^() {
                                // WATK -- idea, what about moving the original to
                                //  the opposite direction so it seems to get pushed out?
                                newViewController.view.frame = endFrame;
                            }
                            completion:^(BOOL finished) {
                                [newViewController didMoveToParentViewController:self];
                                self.currentViewController = newViewController;
                            }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
