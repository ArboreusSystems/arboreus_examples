//
//  MainViewController.m
//  AVPlayer_v1
//
//  Created by Alexandr Kirilov on 18.03.2021.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) loadView {
	
	[super loadView];
	
	_pButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_pButton addTarget:self action:@selector(mActionStartPlayer) forControlEvents:UIControlEventTouchUpInside];
	[_pButton setTitle:@"Play video" forState:UIControlStateNormal];
	[_pButton setFrame:CGRectMake(80.0, 210.0, 160.0, 40.0)];
}

-(void) viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = __COLOR_GREEN;
    
    [self.view addSubview:_pButton];
    _pButton.center = self.view.center;
}

-(void) mActionStartPlayer {
	
	NSLog(@"Button PlayVideo pressed");
	
	NSURL* oURL = [[NSURL alloc] initWithString:@"Place URL here"];
	AVPlayer* oPlayer = [[AVPlayer alloc] initWithURL:oURL];
	AVPlayerViewController* oPlayerView = [[AVPlayerViewController alloc] init];
	[oPlayerView setPlayer:oPlayer];
	
	[self presentViewController:oPlayerView animated:true completion:NULL];
}

@end
