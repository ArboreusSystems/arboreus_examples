//
//  DEFColors.h
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define _COLOR_WHITE [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1]
#define _COLOR_WHITE_CLEAN [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1]

#define _COLOR_BLACK [UIColor colorWithRed:7.0/255.0 green:7.0/255.0 blue:7.0/255.0 alpha:1]
#define _COLOR_BLACK_DARK [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1]

#define _COLOR_GREEN [UIColor colorWithRed:24.0/255.0 green:107.0/255.0 blue:47.0/255.0 alpha:1]
#define _COLOR_GREEN_DARK [UIColor colorWithRed:7.0/255.0 green:69.0/255.0 blue:24.0/255.0 alpha:1]
#define _COLOR_GREEN_LIGHT [UIColor colorWithRed:44.0/255.0 green:136.0/255.0 blue:69.0/255.0 alpha:1]

#define _COLOR_PURPLE [UIColor colorWithRed:144.0/255.0 green:10.0/255.0 blue:91.0/255.0 alpha:1]
#define _COLOR_PURPLE_DARK [UIColor colorWithRed:94.0/255.0 green:8.0/255.0 blue:60.0/255.0 alpha:1]
#define _COLOR_PURPLE_LIGHT [UIColor colorWithRed:178.0/255.0 green:24.0/255.0 blue:117.0/255.0 alpha:1]

#define _COLOR_BLUE [UIColor colorWithRed:80.0/255.0 green:162.0/255.0 blue:217.0/255.0 alpha:1]
#define _COLOR_BLUE_DARK [UIColor colorWithRed:24.0/255.0 green:100.0/255.0 blue:151.0/255.0 alpha:1]
#define _COLOR_BLUE_LIGHT [UIColor colorWithRed:92.0/255.0 green:187.0/255.0 blue:251.0/255.0 alpha:1]

@interface DEFColors : NSObject

+(UIColor *) COLOR_WHITE;
+(UIColor *) COLOR_WHITE_CLEAN;

+(UIColor *) COLOR_BLACK;
+(UIColor *) COLOR_BLACK_DARK;

+(UIColor *) COLOR_GREEN;
+(UIColor *) COLOR_GREEN_DARK;
+(UIColor *) COLOR_GREEN_LIGHT;

+(UIColor *) COLOR_PURPLE;
+(UIColor *) COLOR_PURPLE_DARK;
+(UIColor *) COLOR_PURPLE_LIGHT;

+(UIColor *) COLOR_BLUE;
+(UIColor *) COLOR_BLUE_DARK;
+(UIColor *) COLOR_BLUE_LIGHT;

@end

NS_ASSUME_NONNULL_END
