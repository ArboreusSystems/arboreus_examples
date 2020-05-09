//
//  VCMain.m
//  Localization
//
//  Created by Alexandr Kirilov on 08/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "VCMain.h"



@interface VCMain ()

@end

@implementation VCMain


// --------------------------------------
#pragma mark - Init

-(instancetype) init {

    self = [super init];
    if (self) {
        
        pGlobal = [HGlobal mInstance];
        [self.view setBackgroundColor:__COLOR_GREEN];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mHandleNotificationLocalization:) name:A_NOTIFICATION_LANGUAGE_CHANGED object:nil];
        
    }
    return self;
}

-(void) dealloc {
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}


// --------------------------------------
#pragma mark - Lifecycle

-(void) loadView {

	[super loadView];
	
	pLabelTestString = [[UILabel alloc] init];
	[pLabelTestString setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	[pLabelTestString setBackgroundColor:__COLOR_WHITE];
	[pLabelTestString setTextAlignment:NSTextAlignmentCenter];
	
	pButtonENG = [[UIButton alloc] init];
	[pButtonENG setTranslatesAutoresizingMaskIntoConstraints:NO];
	[pButtonENG setTitle:@"ENG" forState:UIControlStateNormal];
	[pButtonENG setBackgroundColor:__COLOR_PURPLE];
	[pButtonENG addTarget:self action:@selector(mActionButtonENG) forControlEvents:UIControlEventTouchUpInside];
	
	pButtonFIN = [[UIButton alloc] init];
	[pButtonFIN setTranslatesAutoresizingMaskIntoConstraints:NO];
	[pButtonFIN setTitle:@"FIN" forState:UIControlStateNormal];
	[pButtonFIN setBackgroundColor:__COLOR_PURPLE];
	[pButtonFIN addTarget:self action:@selector(mActionButtonFIN) forControlEvents:UIControlEventTouchUpInside];
	
	pButtonRUS = [[UIButton alloc] init];
	[pButtonRUS setTranslatesAutoresizingMaskIntoConstraints:NO];
	[pButtonRUS setTitle:@"RUS" forState:UIControlStateNormal];
	[pButtonRUS setBackgroundColor:__COLOR_PURPLE];
	[pButtonRUS addTarget:self action:@selector(mActionButtonRUS) forControlEvents:UIControlEventTouchUpInside];
}

-(void) viewDidLoad {

	[super viewDidLoad];
	
	[self mSetLocalization];
	
	[self.view addSubview:pLabelTestString];
	[[pLabelTestString.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-30.0] setActive:YES];
	[[pLabelTestString.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
	[[pLabelTestString.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
	[[pLabelTestString.heightAnchor constraintEqualToConstant:100.0] setActive:YES];
	
	[self.view addSubview:pButtonENG];
	[[pButtonENG.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
	[[pButtonENG.topAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
	[[pButtonENG.widthAnchor constraintEqualToConstant:150.0] setActive:YES];
	[[pButtonENG.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
	
	[self.view addSubview:pButtonFIN];
	[[pButtonFIN.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
	[[pButtonFIN.topAnchor constraintEqualToAnchor:pButtonENG.bottomAnchor constant:10.0] setActive:YES];
	[[pButtonFIN.widthAnchor constraintEqualToConstant:150.0] setActive:YES];
	[[pButtonFIN.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
	
	[self.view addSubview:pButtonRUS];
	[[pButtonRUS.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
	[[pButtonRUS.topAnchor constraintEqualToAnchor:pButtonFIN.bottomAnchor constant:10.0] setActive:YES];
	[[pButtonRUS.widthAnchor constraintEqualToConstant:150.0] setActive:YES];
	[[pButtonRUS.heightAnchor constraintEqualToConstant:50.0] setActive:YES];
}


// --------------------------------------
#pragma mark - UI Actions

-(void) mActionButtonENG {

	NSLog(@"Clicked ButtonENG");
	if ([pGlobal mGetLanguage] != ALanguageEnglish) {
		[pGlobal mSetLanguage:ALanguageEnglish];
	} else {
		NSLog(@"Language: English already in use");
	}
}

-(void) mActionButtonFIN {

	NSLog(@"Clicked ButtonFIN");
	if ([pGlobal mGetLanguage] != ALanguageFinish) {
		[pGlobal mSetLanguage:ALanguageFinish];
	} else {
		NSLog(@"Language: Suomi already in use");
	}
}

-(void) mActionButtonRUS {

	NSLog(@"Clicked ButtonRUS");
	if ([pGlobal mGetLanguage] != ALanguageRussian) {
		[pGlobal mSetLanguage:ALanguageRussian];
	} else {
		NSLog(@"Language: Russian already in use");
	}
}


// --------------------------------------
#pragma mark - Localization

-(void) mSetLocalization {

	[self setTitle:[pGlobal mLocalizedString:@"VCMain.Title"]];
	[pLabelTestString setText:[pGlobal mLocalizedString:@"Global.test.string"]];
}

-(void) mHandleNotificationLocalization:(NSNotification *)inNotification {

	[self mSetLocalization];
	enum ALanguage oLanguage = (enum ALanguage)[[inNotification.userInfo valueForKey:A_KEY_CURRENT_LANGUAGE] intValue];
	NSLog(@"View controller VCMain localaized for language: %@",ALanguageToNameString[oLanguage]);
}

@end
