//
//  HGlobal.m
//  Localization
//
//  Created by Alexandr Kirilov on 08/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HGlobal.h"


NSString* _Nonnull const ALanguageToCodeString[] = {
	
	[ALanguageEnglish] = @"en",
	[ALanguageRussian] = @"ru",
	[ALanguageFinish] = @"fi-FI"
};

NSString* _Nonnull const ALanguageToNameString[] = {
	
	[ALanguageEnglish] = @"English",
	[ALanguageRussian] = @"Русский",
	[ALanguageFinish] = @"Suomi"
};


@implementation HGlobal


// --------------------------------------
#pragma mark - Initialisation

- (instancetype) init {
	
	self = [super init];
	if (self) {
		
		NSNumber* oCurrentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:A_KEY_CURRENT_LANGUAGE];
		if ( oCurrentLanguage == nil ) {
			pCurrentLanguage = ALanguageEnglish;
			NSLog(@"Default language initiated: %@",ALanguageToNameString[pCurrentLanguage]);
		} else {
			pCurrentLanguage = (enum ALanguage)[oCurrentLanguage intValue];
			NSLog(@"Found Default language settings: %@",ALanguageToNameString[pCurrentLanguage]);
		}
		
		NSString *oResourcePath = [[NSBundle mainBundle] pathForResource:ALanguageToCodeString[pCurrentLanguage] ofType:@"lproj"];
		pCurrentLanguageBundle = [NSBundle bundleWithPath:oResourcePath];

	}
	return self;
}

+(HGlobal*) mInstance {
	
	static HGlobal* oInstance = nil;
	static dispatch_once_t oThread;
	dispatch_once(&oThread,^{
		oInstance = [[self alloc] init];
	});
	return oInstance;
}


// --------------------------------------
#pragma mark - Functionality

-(NSString*) mLocalizedString:(NSString *)inKey {
	
	return [pCurrentLanguageBundle localizedStringForKey:inKey value:@"" table:nil];
}

-(NSString*) mLocalizedString:(NSString *)inKey value:(NSString *)inValue table:(NSString *)inTable {

	return [pCurrentLanguageBundle localizedStringForKey:inKey value:inValue table:inTable];
}

-(void) mSetLanguage:(enum ALanguage)inLanguage {
	
	pCurrentLanguage = inLanguage;
	[[NSUserDefaults standardUserDefaults] setObject:@(pCurrentLanguage) forKey:A_KEY_CURRENT_LANGUAGE];
	[[NSUserDefaults standardUserDefaults] synchronize];
	NSString *oResourcePath = [[NSBundle mainBundle] pathForResource:ALanguageToCodeString[pCurrentLanguage] ofType:@"lproj"];
	pCurrentLanguageBundle = [NSBundle bundleWithPath:oResourcePath];
	
	NSLog(@"Set language onto: %@",ALanguageToNameString[pCurrentLanguage]);
	
	NSDictionary* oUserInfo = [NSDictionary dictionaryWithObject:@(pCurrentLanguage) forKey:A_KEY_CURRENT_LANGUAGE];
	[[NSNotificationCenter defaultCenter] postNotificationName:A_NOTIFICATION_LANGUAGE_CHANGED object:nil userInfo:oUserInfo];
}

-(enum ALanguage) mGetLanguage {

	return pCurrentLanguage;
}

@end
