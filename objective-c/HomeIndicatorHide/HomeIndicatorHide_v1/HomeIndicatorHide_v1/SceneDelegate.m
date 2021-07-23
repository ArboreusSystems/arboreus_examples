//
//  SceneDelegate.m
//  HomeIndicatorHide_v1
//
//  Created by Alexandr Kirilov on 23.07.2021.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
	
	if (@available(iOS 13.0, *)) {
		self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*) scene];
		self.window.rootViewController = [[MainViewController alloc] init];
		[self.window makeKeyAndVisible];
	}
}

- (void)sceneDidDisconnect:(UIScene *)scene  API_AVAILABLE(ios(13.0)) {}
- (void)sceneDidBecomeActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)) {}
- (void)sceneWillResignActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)) {}
- (void)sceneWillEnterForeground:(UIScene *)scene  API_AVAILABLE(ios(13.0)) {}
- (void)sceneDidEnterBackground:(UIScene *)scene  API_AVAILABLE(ios(13.0)) {}

@end
