//
//  AMainViewController.m
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 21/12/2022.
//

#import "AMainViewController.h"

@interface AMainViewController ()

@end

@implementation AMainViewController

-(instancetype) init {
    
    self = [super init];
    if (self) {
        
        [self setPAsyncAwaitView:[[AAsyncAwaitView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];

    }
    return self;
}

-(void) loadView {
    
    [super loadView];
    [self setTitle:@"AsyncAwait_v1"];
    [self.view setBackgroundColor:__COLOR_SALAD_DARK];
}

-(void) viewDidLoad {
 
    [super viewDidLoad];
    
    [self.pViewContent addSubview:_pAsyncAwaitView];
    [[_pAsyncAwaitView.topAnchor constraintEqualToAnchor:self.pViewContent.topAnchor] setActive:YES];
    [[_pAsyncAwaitView.bottomAnchor constraintEqualToAnchor:self.pViewContent.bottomAnchor] setActive:YES];
    [[_pAsyncAwaitView.leftAnchor constraintEqualToAnchor:self.pViewContent.leftAnchor] setActive:YES];
    [[_pAsyncAwaitView.rightAnchor constraintEqualToAnchor:self.pViewContent.rightAnchor] setActive:YES];
}

@end
