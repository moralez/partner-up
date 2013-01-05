//
//  RootViewController.h
//  Partner Up
//
//  Created by Logen Watkins on 1/4/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>

// Segmented control sections
enum  {
    SEGMENT_CLASSES = 0,
    SEGMENT_ACTIVITIES, // 1
    SEGMENT_COUNT // 2
};

@interface RootViewController : UIViewController {
    NSUInteger rootViewHeight;
}

@property (nonatomic,retain) UIViewController *currentViewController;

- (IBAction)segmentedControlAction:(id)sender;

//watk revisit
-(void)pushToActivityDetailsView;


@end
