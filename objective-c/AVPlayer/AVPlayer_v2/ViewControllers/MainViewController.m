//
//  MainViewController.m
//  AVPlayer_v2
//
//  Created by Alexandr Kirilov on 21.03.2021.
//  Copyright © 2021 Alexandr Kirilov. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) loadView {
    
    [super loadView];
    [self.view setBackgroundColor:__COLOR_GREEN];
}

-(void) viewDidLoad {
    
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height / 3.0;
    AVPlayer *player = [AVPlayer playerWithURL:[[NSURL alloc] initWithString:@"Stream URL here"]];
    AVPlayerLayer *playerLayer = [AVPlayerLayer layer];
    playerLayer.player = player;
    playerLayer.frame = CGRectMake(.0, height, width, height);
    playerLayer.backgroundColor = [UIColor blackColor].CGColor;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.view.layer addSublayer:playerLayer];
    
    [player play];
}

@end
