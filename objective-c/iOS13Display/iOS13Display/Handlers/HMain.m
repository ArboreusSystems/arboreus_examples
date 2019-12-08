//
//  HMain.m
//  iOS13Display
//
//  Created by Alexandr Kirilov on 08/12/2019.
//  Copyright © 2019 Alexandr Kirilov. All rights reserved.
//

#import "HMain.h"

@implementation HMain

+(void) mDoExit {

	UIAlertController *oAlert = [UIAlertController
		alertControllerWithTitle:@"Exit"
		message:@"Are sure about to exit application?"
		preferredStyle:UIAlertControllerStyleAlert
	];
	UIAlertAction *oActionYes = [UIAlertAction
		actionWithTitle:@"Yes"
		style:UIAlertActionStyleDefault
		handler:^(UIAlertAction *action){exit(0);}
	];
	UIAlertAction *oActionNo = [UIAlertAction
		actionWithTitle:@"Cancel"
		style:UIAlertActionStyleDefault
		handler:^(UIAlertAction *action){}
	];
	[oAlert addAction:oActionNo];
	[oAlert addAction:oActionYes];
	[[UIApplication sharedApplication].keyWindow.rootViewController
		presentViewController:oAlert
		animated:YES
		completion:nil
	];
}

@end
