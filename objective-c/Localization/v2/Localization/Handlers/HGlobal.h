//
//  HGlobal.h
//  Localization
//
//  Created by Alexandr Kirilov on 08/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define A_KEY_CURRENT_LANGUAGE @"A_Current_Language"

typedef NS_ENUM(NSUInteger, ALanguage) {
    
    ALanguageEnglish,
	ALanguageRussian,
	ALanguageFinish
};

extern NSString* _Nonnull const ALanguageToCodeString[];
extern NSString* _Nonnull const ALanguageToNameString[];

@interface HGlobal : NSObject {

	enum ALanguage pCurrentLanguage;
	NSBundle* pCurrentLanguageBundle;
}

+(HGlobal*) mInstance;
-(NSString*) mLocalizedString:(NSString *)inKey;
-(NSString*) mLocalizedString:(NSString *)inKey value:(NSString *)inValue table:(NSString *)inTable;
-(void) mSetLanguage:(enum ALanguage)inLanguage;
-(enum ALanguage) mGetLanguage;

@end

NS_ASSUME_NONNULL_END
