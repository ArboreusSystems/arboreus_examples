//
//  AMainViewController.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import "AMainViewController.h"

@implementation AMainViewController

-(instancetype) init {
    
    self = [super init];
    if (self) {

    }
    return self;
}

-(void) loadView {
    
    [super loadView];
    [self.view setBackgroundColor:__COLOR_SALAD_DARK];
    [self setTitle:@"UsingRust_v1"];
}

-(void) viewDidLoad {
 
    [super viewDidLoad];
    
    [self setPButton:[[AButtonTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
    [_pButton setTitle:@"Get from Rust" forState:UIControlStateNormal];
    [_pButton addTarget:self action:@selector(mActionGetDataFromRustLibrary:) forControlEvents:UIControlEventTouchUpInside];
    [self.pViewContent addSubview:_pButton];
    [[_pButton.topAnchor constraintEqualToAnchor:self.pViewContent.topAnchor] setActive:YES];
    [[_pButton.heightAnchor constraintEqualToConstant:80.0] setActive:YES];
    [[_pButton.leftAnchor constraintEqualToAnchor:self.pViewContent.leftAnchor] setActive:YES];
    [[_pButton.rightAnchor constraintEqualToAnchor:self.pViewContent.rightAnchor] setActive:YES];
    
    [self setPLabel:[[ALabelTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0 )]];
    [_pLabel setText:@"No data yet"];
    [self.pViewContent addSubview:_pLabel];
    [[_pLabel.centerYAnchor constraintEqualToAnchor:self.pViewContent.centerYAnchor constant:-50.0] setActive:YES];
    [[_pLabel.centerXAnchor constraintEqualToAnchor:self.pViewContent.centerXAnchor] setActive:YES];
    [[_pLabel.leftAnchor constraintEqualToAnchor:self.pViewContent.leftAnchor] setActive:YES];
    [[_pLabel.rightAnchor constraintEqualToAnchor:self.pViewContent.rightAnchor] setActive:YES];
}

-(void) mActionGetDataFromRustLibrary:(id)inSender {
    
    NSLog(@"mActionGetDataFromRustLibrary");
    [_pLabel setText:@(fStringFromRustLibrary())];
}

@end
