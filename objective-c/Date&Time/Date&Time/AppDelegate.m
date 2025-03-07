//
//  AppDelegate.m
//  Date&Time
//
//  Created by Alexandr Kirilov on 20/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	#pragma clang diagnostic push
	#pragma clang diagnostic ignored "-Wunused-variable"
	HGlobal* oGlobal = [HGlobal mInstance];
	HLogger* oLogger = [HLogger mInstance];
	#pragma clang diagnostic pop
	
	if (@available(iOS 13, *)) {} else {
		self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
		UINavigationController* oNavigationController = [[NCRoot alloc] initWithRootViewController:[[VCMain alloc] init]];
		self.window.rootViewController = oNavigationController;
		[self.window makeKeyAndVisible];
	}
	
	return YES;
}


#pragma mark - UISceneSession lifecycle

-(UISceneConfiguration *) application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options API_AVAILABLE(ios(13.0)) {

	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

-(void) application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions API_AVAILABLE(ios(13.0)) {}


@end
