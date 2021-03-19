//
//  AppDelegate.m
//  AVPlayer_v1
//
//  Created by Alexandr Kirilov on 18.03.2021.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	if (@available(iOS 13, *)) {} else {
		self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
		self.window.rootViewController = [[MainViewController alloc] init];
		[self.window makeKeyAndVisible];
	}
	
	return YES;
}


#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){

	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){}

@end
