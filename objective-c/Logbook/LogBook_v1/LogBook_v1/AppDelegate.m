//
//  AppDelegate.m
//  LogBook_v1
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	_pLogger = [ALogger mInstance];
	
	NSLog(@"Test from appdelegate");
	
	return YES;
}


#pragma mark - UISceneSession lifecycle


-(UISceneConfiguration*) application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

-(void) application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {}
-(void) applicationWillTerminate:(UIApplication *)application {}


- (void) redirectConsoleLogToDocumentFolder
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
														 NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *logPath = [documentsDirectory stringByAppendingPathComponent:@"console.txt"];
	freopen([logPath fileSystemRepresentation],"a+",stderr);
}

@end
