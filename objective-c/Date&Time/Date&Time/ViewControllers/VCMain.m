//
//  VCMain.m
//  Date&Time
//
//  Created by Alexandr Kirilov on 20/06/2020.
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
		pLogger = [HLogger mInstance];
		
		[self setTitle:@"Date&Time demo"];
		[self.view setBackgroundColor:__COLOR_WHITE];
		
		NSString* oTimeZoneName;
		NSDateFormatter* oFormatter = [[NSDateFormatter alloc] init];
		[oFormatter setDateFormat:@"HH:mm:ss"];
		
		NSLog(@"------------------");
		NSLog(@"NSDate now");
		NSLog(@"------------------");
		
		NSDate* oDateNow = [NSDate now];
		CGFloat oTimeIntervalSince1970 = [oDateNow timeIntervalSince1970];
		NSLog(@"Now timeIntervalSince1970: %f",oTimeIntervalSince1970);
		NSLog(@"Now timeIntervalSince1970 seconds: %lld",(long long)(oTimeIntervalSince1970));
		NSLog(@"Now timeIntervalSince1970 milliseconds: %lld",(long long)(oTimeIntervalSince1970 * 1000.0));
		NSLog(@"Now timeIntervalSince1970 microseconds: %lld",(long long)(oTimeIntervalSince1970 * 1000000.0));
		
		NSDate* oDateToday = oDateNow;
		NSCalendar *oCalendar = [NSCalendar currentCalendar];
		NSDateComponents *oComponents = [oCalendar components:(
			NSCalendarUnitMonth | NSCalendarUnitYear |
			NSCalendarUnitHour | NSCalendarUnitMinute |
			NSCalendarUnitSecond
		) fromDate:oDateToday];
		
		[oComponents setHour:0]; [oComponents setMinute:0]; [oComponents setSecond:0];
		NSDate* oTodayBeginOfTheDay = [oCalendar dateFromComponents:oComponents];
		CGFloat oBeginOfTheDayTimeIntervalSince1970 = [oTodayBeginOfTheDay timeIntervalSince1970];
		NSLog(@"Today begin of the day timeIntervalSince1970: %f",oBeginOfTheDayTimeIntervalSince1970);
		NSLog(@"Today begin of the day timeIntervalSince1970 seconds: %lld",(long long)(oBeginOfTheDayTimeIntervalSince1970));
		NSLog(@"Today begin of the day timeIntervalSince1970 milliseconds: %lld",(long long)(oBeginOfTheDayTimeIntervalSince1970 * 1000.0));
		NSLog(@"Today begin of the day timeIntervalSince1970 microseconds: %lld",(long long)(oBeginOfTheDayTimeIntervalSince1970 * 1000000.0));
		
		oTimeZoneName = @"UTC";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today begin of the day time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayBeginOfTheDay]);
		
		oTimeZoneName = @"Australia/Sydney";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today begin of the day time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayBeginOfTheDay]);
		
		oTimeZoneName = @"Europe/Paris";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today begin of the day time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayBeginOfTheDay]);
		
		oTimeZoneName = @"Pacific/Midway";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today begin of the day time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayBeginOfTheDay]);
		
		[oComponents setHour:23]; [oComponents setMinute:59]; [oComponents setSecond:59];
		NSDate* oTodayLastSecond = [oCalendar dateFromComponents:oComponents];
		CGFloat oTodayLastSecondTimeIntervalSince1970 = [oTodayLastSecond timeIntervalSince1970];
		NSLog(@"Today last second timeIntervalSince1970: %f",oTodayLastSecondTimeIntervalSince1970);
		NSLog(@"Today last second timeIntervalSince1970 seconds: %lld",(long long)(oTodayLastSecondTimeIntervalSince1970));
		NSLog(@"Today last second timeIntervalSince1970 milliseconds: %lld",(long long)(oTodayLastSecondTimeIntervalSince1970 * 1000.0));
		NSLog(@"Today last second timeIntervalSince1970 microseconds: %lld",(long long)(oTodayLastSecondTimeIntervalSince1970 * 1000000.0));
		
		oTimeZoneName = @"UTC";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today last second time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayLastSecond]);
		
		oTimeZoneName = @"Australia/Sydney";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today last second time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayLastSecond]);
		
		oTimeZoneName = @"Europe/Paris";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today last second time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayLastSecond]);
		
		oTimeZoneName = @"Pacific/Midway";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Today last second time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oTodayLastSecond]);
		
		NSLog(@"------------------");
		NSLog(@"NSDateFormatter Time Style");
		NSLog(@"------------------");
	
		[oFormatter setTimeZone:[NSTimeZone localTimeZone]];
		
		[oFormatter setTimeStyle:NSDateFormatterShortStyle];
		NSLog(@"Current time local setTimeStyle:NSDateFormatterShortStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setTimeStyle:NSDateFormatterFullStyle];
		NSLog(@"Current time local setTimeStyle:NSDateFormatterFullStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setTimeStyle:NSDateFormatterLongStyle];
		NSLog(@"Current time local setTimeStyle:NSDateFormatterLongStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setTimeStyle:NSDateFormatterMediumStyle];
		NSLog(@"Current time local setTimeStyle:NSDateFormatterMediumStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setTimeStyle:NSDateFormatterNoStyle];
		NSLog(@"Current time local setTimeStyle:NSDateFormatterNoStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		
		NSLog(@"------------------");
		NSLog(@"NSDateFormatter Date Style");
		NSLog(@"------------------");
		
		[oFormatter setDateStyle:NSDateFormatterShortStyle];
		NSLog(@"Current time local setDateStyle:NSDateFormatterShortStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setDateStyle:NSDateFormatterFullStyle];
		NSLog(@"Current time local setDateStyle:NSDateFormatterFullStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setDateStyle:NSDateFormatterLongStyle];
		NSLog(@"Current time local setDateStyle:NSDateFormatterLongStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setDateStyle:NSDateFormatterMediumStyle];
		NSLog(@"Current time local setDateStyle:NSDateFormatterMediumStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		[oFormatter setDateStyle:NSDateFormatterNoStyle];
		NSLog(@"Current time local setDateStyle:NSDateFormatterNoStyle -> %@",[oFormatter stringFromDate:oDateNow]);
		
		NSLog(@"------------------");
		NSLog(@"NSDateFormatter Custom Style: yy/MM/dd HH:mm:ss");
		NSLog(@"------------------");
		
		[oFormatter setDateFormat:@"yy/MM/dd HH:mm:ss"];
		
		oTimeZoneName = @"UTC";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
		
		oTimeZoneName = @"Australia/Sydney";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
		
		oTimeZoneName = @"Europe/Paris";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
		
		oTimeZoneName = @"Pacific/Midway";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
		
		NSLog(@"------------------");
		NSLog(@"NSDateFormatter Custom Style: HH:mm:ss");
		NSLog(@"------------------");
		[oFormatter setDateFormat:@"HH:mm:ss"];
		
		oTimeZoneName = @"UTC";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
		
		oTimeZoneName = @"Australia/Sydney";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
		
		oTimeZoneName = @"Europe/Paris";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
		
		oTimeZoneName = @"Pacific/Midway";
		[oFormatter setTimeZone:[NSTimeZone timeZoneWithName:oTimeZoneName]];
		NSLog(@"Current time %@ -> %@",oTimeZoneName,[oFormatter stringFromDate:oDateNow]);
	};
	return self;
}



// --------------------------------------
#pragma mark - Lifecycle

-(void) viewDidLoad {

	[super viewDidLoad];
}

@end
