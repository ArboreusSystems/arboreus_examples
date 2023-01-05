//
//  AppDelegate.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import "AAppDelegate.h"

@interface AAppDelegate ()

@end

@implementation AAppDelegate

-(void) applicationDidFinishLaunching:(UIApplication *)application {

    NSLog(@"DELEGATE applicationDidFinishLaunching");
}

-(BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    
    NSLog(@"DELEGATE willFinishLaunchingWithOptions");
    
    return YES;
}

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[self setPStoreKit:[AStoreKit mSharedInstance]];
    
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [self.window setRootViewController:[[ARootNavigationController alloc] initWithRootViewController:[[AMainViewController alloc] init]]];
    [self.window makeKeyAndVisible];
    
    NSLog(@"DELEGATE didFinishLaunchingWithOptions");
    
    return YES;
}

-(void) applicationDidBecomeActive:(UIApplication*) application {

    NSLog(@"DELEGATE applicationDidBecomeActive");
}

-(void) applicationWillResignActive:(UIApplication*) application {
    
    NSLog(@"DELEGATE applicationWillResignActive");
}

-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

    NSLog(@"DELEGATE openURL");

    return YES;
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application {

    NSLog(@"DELEGATE applicationDidReceiveMemoryWarning");
}

-(void) applicationWillTerminate:(UIApplication*) application {
    
    NSLog(@"DELEGATE applicationWillTerminate");
}

-(void) applicationSignificantTimeChange:(UIApplication *)application {

    NSLog(@"DELEGATE applicationSignificantTimeChange");
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    NSLog(@"DELEGATE didRegisterForRemoteNotificationsWithDeviceToken");
}

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

    NSLog(@"DELEGATE didFailToRegisterForRemoteNotificationsWithError");
}

//-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//
//    NSLog(@"didReceiveRemoteNotification");
//}

-(void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity {

    NSLog(@"DELEGATE didUpdateUserActivity");
}

-(void) applicationDidEnterBackground:(UIApplication*) application {

    NSLog(@"DELEGATE applicationDidEnterBackground");
}

-(void) applicationWillEnterForeground:(UIApplication*) application {

    NSLog(@"DELEGATE applicationWillEnterForeground");
}



@end
