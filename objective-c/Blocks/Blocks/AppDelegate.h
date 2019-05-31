//
//  AppDelegate.h
//  Blocks
//
//  Created by Alexandr Kirilov on 31/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

typedef void(^BlockType)(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate>

	@property (strong, nonatomic) UIWindow *window;
	-(void) mBlockedMethodPure: (void(^)(void)) inBlock;
	-(void) mBlockedMethodTyped: (BlockType) inBlock;

@end

