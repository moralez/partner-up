//
//  StdInclude.h
//  Partner Up
//
//  Created by Logen Watkins on 1/3/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#ifndef Partner_Up_StdInclude_h
#define Partner_Up_StdInclude_h

// UIColor/ccc3 RGB
#define UI_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// Color list: cloford.com/resources/colours/500col.htm
#define UI_LIGHTGRAY UI_RGB(249, 249, 249, 1.0)
#define UI_ROYALBLUE_3 UI_RGB(58, 95, 205, 1.0)


// Partner-up Specific
#define MIN_CLASS_SIZE 2
#define MAX_CLASS_SIZE 500
#define DEFAULT_CLASS_SIZE 15
#define MIN_GROUP_SIZE 2
#define MAX_GROUP_SIZE ((MAX_CLASS_SIZE / 2) + 1)
#define DEFAULT_GROUP_SIZE 2

// Partner-up Specific

#endif
