//
//  ViewController.m
//  LocalNotifications_v2
//
//  Created by Alexandr Kirilov on 15.06.2022.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

-(void) loadView {
	
	[super loadView];
	
	[self setPNotifications:[ANotifications mInstance]];
	[self.view setBackgroundColor:__COLOR_SALAD];
	
	[self setPButtonShowNotification:[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
	[_pButtonShowNotification setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pButtonShowNotification setBackgroundColor:__COLOR_FIOLENT_DARK];
	[_pButtonShowNotification setTitle:@"SHOW NOTIFICATION" forState:UIControlStateNormal];
	[_pButtonShowNotification setTitleColor:__COLOR_WHITE_LIGHT forState:UIControlStateNormal];
	[_pButtonShowNotification addTarget:self action:@selector(mActionButtonShowNotification:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_pButtonShowNotification];
}

-(void) viewDidLoad {
	
	[super viewDidLoad];
	
	[_pButtonShowNotification removeConstraints:[_pButtonShowNotification constraints]];
	[[_pButtonShowNotification.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
	[[_pButtonShowNotification.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
	[[_pButtonShowNotification.widthAnchor constraintEqualToConstant:self.view.bounds.size.width * 0.8] setActive:YES];
	[[_pButtonShowNotification.heightAnchor constraintEqualToConstant:self.view.bounds.size.height * 0.15] setActive:YES];
}

-(void) mActionButtonShowNotification:(id)inSender {
	
	NSLog(@"Button clicked");
	[_pNotifications mSend:@"Title" inSubtitle:@"Subtitle" inBody:@"Body" inBadge:1 inDelay:0];
}


@end
