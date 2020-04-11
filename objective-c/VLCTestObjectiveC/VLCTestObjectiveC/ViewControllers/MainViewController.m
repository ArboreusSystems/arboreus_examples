//
//  MainViewController.m
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 08/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) loadView {
	
	[super loadView];
	self.view.backgroundColor = __COLOR_BLUE;
	self.pPlayer = [HandlerVLC mInstance].pPlayer;
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	NSURL* oUrl = [NSURL URLWithString:@"http://185.26.157.6:8081/live/1_test/mpeg.2ts"];
	VLCMedia* oMedia = [VLCMedia mediaWithURL:oUrl];

	_pPlayer = [[VLCMediaPlayer alloc] init];
	_pPlayer.media = oMedia;
	_pPlayer.drawable = self.view;
	[_pPlayer play];
}

@end
