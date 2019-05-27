//
//  AppDelegate.m
//  NSString
//
//  Created by Alexandr Kirilov on 27/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSString *oStringOne = @"the NSString one";
	NSString *oStringTwo = @"the NSString two";
	NSString *oStringConcatenated = [oStringOne stringByAppendingString:oStringTwo];
	NSLog(@"Concatenaded string: %@",oStringConcatenated);
	
	NSString *oStringFromIndex = [oStringConcatenated substringFromIndex:oStringOne.length];
	NSLog(@"StringByIndex: %@",oStringFromIndex);
	
	NSRange oRange = NSMakeRange(0,oStringOne.length);
	NSString *oStringWithRange = [oStringConcatenated substringWithRange:oRange];
	NSLog(@"StringWithRange: %@",oStringWithRange);
	
	NSString *oStringCapitalised = [oStringOne capitalizedString];
	NSLog(@"StringCapitalised: %@",oStringCapitalised);
	
	NSString *oStringUpperCase = [oStringOne uppercaseString];
	NSLog(@"StringUpperCase: %@",oStringUpperCase);
	
	NSString *oStringLowerCase = [oStringOne lowercaseString];
	NSLog(@"StringLowerCase: %@",oStringLowerCase);
	
	float vFloat = 0.1111;
	NSString *oStringFloat = [@(vFloat) stringValue];
	NSLog(@"StringFloat: %@",oStringFloat);
	
	float vConvertedFloatFromString = [oStringFloat floatValue] + 1;
	NSLog(@"ConvertedFloatFromString: %f",vConvertedFloatFromString);
	
	NSInteger vNSInteger = 12345;
	NSString *oStringInteger = [@(vNSInteger) stringValue];
	NSLog(@"StringInteger: %@",oStringInteger);
	
	NSInteger vConvertedInteger = [oStringInteger integerValue] + 1;
	NSLog(@"ConvertedInteger: %ld",vConvertedInteger);
	
	NSString *oStringA = @"value";
	NSString *oStringB = @"value";
	if ([oStringA isEqualToString:oStringB]) {
		NSLog(@"StringA equal StringB");
	} else {
		NSLog(@"StringA not equal StringB");
	}
	
	NSMutableString *oMutableString = [[NSMutableString alloc] init];
	NSInteger vMutableStringLength = 32;
	NSString *oDictionary = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	NSInteger vDictionaryLength = oDictionary.length;
	NSInteger vIndex = 0;
	for (int i = 0; i < vMutableStringLength; i++) {
		vIndex = arc4random() % vDictionaryLength;
		[oMutableString appendString:[oDictionary substringWithRange:NSMakeRange(vIndex,1)]];
		
	}
	NSLog(@"Generated MutableString: %@",oMutableString);
	
	return YES;
}

@end
