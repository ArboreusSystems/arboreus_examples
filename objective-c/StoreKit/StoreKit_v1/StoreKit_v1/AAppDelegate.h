//
//  AppDelegate.h
//  StoreKit_v1
//
//  Created by Alexandr Kirilov on 29/11/2022.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

#import "Logger/ALogger.h"
#import "ViewControllers/ARootNavigationController.h"
#import "ViewControllers/AMainViewController.h"
#import "StoreKit/AStoreKit.h"

@interface AAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong,nonatomic) UIWindow* window;
@property (strong,atomic) AStoreKit* pStoreKit;

@end

