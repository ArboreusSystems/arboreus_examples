//
//  SceneDelegate.m
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


-(void) scene:(UIScene*)scene willConnectToSession:(UISceneSession*)session options:(UISceneConnectionOptions*)connectionOptions {
	
	[self setWindow:[[UIWindow alloc] initWithWindowScene: (UIWindowScene*) scene]];
	[self.window setRootViewController:[[AViewController alloc] init]];
	[self.window makeKeyAndVisible];
}


-(void) sceneDidDisconnect:(UIScene*)scene {
	
	NSLog(@"scene sceneDidDisconnect");
}

-(void) sceneDidBecomeActive:(UIScene*)scene {
	
	NSLog(@"scene sceneDidBecomeActive");
}

-(void) sceneWillResignActive:(UIScene*)scene {
	
	NSLog(@"scene sceneWillResignActive");
}

-(void) sceneWillEnterForeground:(UIScene*)scene {
	
	NSLog(@"scene sceneWillEnterForeground");
}

-(void) sceneDidEnterBackground:(UIScene*)scene {
	
	NSLog(@"scene sceneDidEnterBackground");
}


@end
