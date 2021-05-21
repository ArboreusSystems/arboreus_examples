//
//  AppDelegate.m
//  DetectPermissions
//
//  Created by Alexandr Kirilov on 21.05.2021.
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
	
	switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]) {
		case AVAuthorizationStatusAuthorized: {
			NSLog(@"Camera Authorized access");
			break;
		}
		case AVAuthorizationStatusNotDetermined: {
			NSLog(@"Camera NotDetermined access");
			[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
				if (granted) {
					NSLog(@"Camera Granted access");
				}
			}];
			break;
		}
		case AVAuthorizationStatusDenied: {
			NSLog(@"Camera Denied access");
			break;
		}
		case AVAuthorizationStatusRestricted: {
			NSLog(@"Camera Restricted access");
			break;
		}
		default: {
			NSLog(@"Camera Error access");
			break;
		}
	}
	
	switch ([[AVAudioSession sharedInstance] recordPermission]) {
		case AVAudioSessionRecordPermissionGranted: {
			NSLog(@"Microphone Granted access");
			break;
		}
		case AVAudioSessionRecordPermissionDenied: {
			NSLog(@"Microphone Denied access");
			break;
		}
		case AVAudioSessionRecordPermissionUndetermined: {
			NSLog(@"Microphone Undetermined access");
			[[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted){
				if (granted) {
					NSLog(@"Microphone Granted access");
				}
			}];
			break;
		}
		default: {
			NSLog(@"Microphone Error access");
			break;
		}
	}
    
    return YES;
}


#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){

    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){}


@end
