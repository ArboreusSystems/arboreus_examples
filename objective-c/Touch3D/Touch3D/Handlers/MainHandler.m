//
//  MainHandler.m
//  Touch3D
//
//  Created by Alexandr Kirilov on 09/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "MainHandler.h"

@implementation MainHandler

+(void) mDoExit {
	
    UIAlertController *oAlert = [UIAlertController
    	alertControllerWithTitle:@"Exit"
    	message:@"Are sure about to exit application?"
    	preferredStyle:UIAlertControllerStyleAlert
    ];
    UIAlertAction *oActionYes = [UIAlertAction
    	actionWithTitle:@"Yes"
    	style:UIAlertActionStyleDefault
    	handler:^(UIAlertAction *action){
    		exit(0);
		}
    ];
    UIAlertAction *oActionNo = [UIAlertAction
    	actionWithTitle:@"Cancel"
    	style:UIAlertActionStyleDefault
    	handler:^(UIAlertAction *action){}
    ];
    [oAlert addAction:oActionNo];
    [oAlert addAction:oActionYes];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:oAlert
    	animated:YES
    	completion:nil
    ];
}

+(UIColor *) mCreateRandomColor {
	
	return [UIColor
		colorWithRed: (arc4random() % 255) / 255.0
		green: (arc4random() % 255) / 255.0
		blue: (arc4random() % 255) / 255.0
		alpha: 1.0
	];
}

@end
