//
//  AppDelegate.h
//  Threads
//
//  Created by Alexandr Kirilov on 30/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSThread *backgroundThread01;
@property (strong, nonatomic) NSThread *backgroundThread02;

-(void) mBackgroundThread01;
-(void) mBackgroundThread02;

@end

