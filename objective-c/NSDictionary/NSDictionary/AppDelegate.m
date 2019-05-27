//
//  AppDelegate.m
//  NSDictionary
//
//  Created by Alexandr Kirilov on 27/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSDictionary *oDictionaryFinland = [[NSDictionary alloc] initWithObjectsAndKeys:
		@"Finland",@"FullName",
		@"FIN",@"Alpha3",
		@"FI",@"Alpha2",
		nil
	];
	NSLog(@"%@",oDictionaryFinland);
	
	NSDictionary *oDictionaryGermany = [[NSDictionary alloc] initWithObjectsAndKeys:
		@"Germany",@"FullName",
		@"DEU",@"Alpha3",
		@"DE",@"Alpha2",
		nil
	];
	NSLog(@"%@",oDictionaryGermany);
	
	NSDictionary *oDictionaryRussia = [[NSDictionary alloc] initWithObjectsAndKeys:
		@"Russian Federation",@"FullName",
		@"RUS",@"Alpha3",
		@"RU",@"Alpha2",
		nil
	];
	NSLog(@"%@",oDictionaryRussia);
	
	NSDictionary *oDictionaryUSA = [[NSDictionary alloc] initWithObjectsAndKeys:
		@"United States of America",@"FullName",
		@"USA",@"Alpha3",
		@"US",@"Alpha2",
		nil
	];
	NSLog(@"%@",oDictionaryUSA);
	
	NSArray *oCountries = [[NSArray alloc] initWithObjects:
		oDictionaryFinland,
		oDictionaryGermany,
		oDictionaryRussia,
		oDictionaryUSA,
		nil
	];
	NSArray *oCountriesKeys = [[NSArray alloc] initWithObjects:
		@"Finland",
		@"Germany",
		@"Russia",
		@"USA",
		nil
	];
	
	NSDictionary *oDictionaryCuntries = [[NSDictionary alloc]
		initWithObjects:oCountries
		forKeys:oCountriesKeys
	];
	NSLog(@"%@",oDictionaryCuntries);

	NSLog(@"Value Germany \"Alpha3\" from dictionary: %@",[[oDictionaryCuntries objectForKey:@"Germany"] objectForKey:@"Alpha3"]);
	NSLog(@"Value Russia \"FullName\" from dictionary: %@",[[oDictionaryCuntries objectForKey:@"Russia"] objectForKey:@"FullName"]);
	
	NSDictionary *oDictionaryFrance = [[NSDictionary alloc] initWithObjectsAndKeys:
		@"France",@"FullName",
		@"FRA",@"Alpha3",
		@"FR",@"Alpha2",
		nil
	];
	NSLog(@"%@",oDictionaryFrance);
	
	NSMutableDictionary *oMutableDictionaryCountries = [oDictionaryCuntries mutableCopy];
	[oMutableDictionaryCountries setObject:oDictionaryFrance forKey:@"France"];
	NSLog(@"%@",oMutableDictionaryCountries);
	
	[oMutableDictionaryCountries removeObjectForKey:@"France"];
	NSLog(@"%@",oMutableDictionaryCountries);
	
	return YES;
}

@end
