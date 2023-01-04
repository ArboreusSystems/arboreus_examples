//
//  AppDelegate.h
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import <UIKit/UIKit.h>

#import "ViewControllers/ARootNavigationController.h"
#import "ViewControllers/AMainViewController.h"
#import "StoreKit/AStoreKit.h"

@interface AAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong,nonatomic) UIWindow* window;
@property (strong,atomic) AStoreKit* pStoreKit;

@end

