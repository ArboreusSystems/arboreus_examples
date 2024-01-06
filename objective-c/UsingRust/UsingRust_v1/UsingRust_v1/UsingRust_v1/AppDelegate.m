//
//  AppDelegate.m
//  UsingRust_v1
//
//  Created by Alexandr Kirilov on 06/01/2024.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%s",fStringFromRustLibrary());
    
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [self.window setRootViewController:[[ARootNavigationController alloc] initWithRootViewController:[[AMainViewController alloc] init]]];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
