//
//  AppDelegate.m
//  Localization
//
//  Created by Alexandr Kirilov on 08/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "AppDelegate.h"

#import <Foundation/Foundation.h>

#define A_KEY_CURRENT_LANGUAGE @"A_Current_Language"
#define ALocalizedString(key, comment) [[NSBundle mainBundle] mLocalizedStringForKey:(key) value:nil table:nil]


@interface NSBundle (ALocalizedString)

-(NSString *) mLocalizedStringForKey:(NSString *)inKey value:(NSString *)inValue table:(NSString *)inTableName;
+(void) mSetLanguage:(NSString*)inLanguageCode;

@end

@implementation NSBundle (ALocalizedString)

-(NSString *) mLocalizedStringForKey:(NSString *)inKey value:(NSString *)inValue table:(NSString *)inTable {
	
	NSString *oLanguageCode = [[NSUserDefaults standardUserDefaults] objectForKey:A_KEY_CURRENT_LANGUAGE];
	if ( oLanguageCode == nil ) {
		oLanguageCode = @"en";
	}
	NSString *oResourcePath = [[NSBundle mainBundle] pathForResource:oLanguageCode ofType:@"lproj"];
	NSBundle *oLanguageBundle = [NSBundle bundleWithPath:oResourcePath];
	return [oLanguageBundle localizedStringForKey:inKey value:inValue table:inTable];
}

+(void) mSetLanguage:(NSString*)inLanguageCode {
	
	[[NSUserDefaults standardUserDefaults] setObject:inLanguageCode forKey:A_KEY_CURRENT_LANGUAGE];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end

@interface AppDelegate ()

@end

@implementation AppDelegate


-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	#pragma clang diagnostic push
	#pragma clang diagnostic ignored "-Wunused-variable"
	HGlobal* oHandlerGlobal = [HGlobal mInstance];
	#pragma clang diagnostic pop
	
//	[oHandlerGlobal mSetLanguage:ALanguageEnglish];
	NSLog(@"Localised test string: %@",[oHandlerGlobal mLocalizedString:@"Global.test.string"]);
	
	if (@available(iOS 13, *)) {} else {
		self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
		UINavigationController* oNavigationController = [[NCRoot alloc] initWithRootViewController:[[VCMain alloc] init]];
		[oNavigationController.view setBackgroundColor:__COLOR_GREEN_LIGHT];
		self.window.rootViewController = oNavigationController;
		[self.window makeKeyAndVisible];
	}
	
	return YES;
}


// --------------------------------------
#pragma mark - UISceneSession lifecycle

-(UISceneConfiguration *) application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options API_AVAILABLE(ios(13.0)) {

	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

-(void) application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions API_AVAILABLE(ios(13.0)) {}

@end





