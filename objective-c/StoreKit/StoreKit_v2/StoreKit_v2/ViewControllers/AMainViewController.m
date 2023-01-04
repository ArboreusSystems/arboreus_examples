//
//  AMainViewController.m
//  StoreKit_v2
//
//  Created by Alexandr Kirilov on 15/12/2022.
//

#import "AMainViewController.h"

@implementation AMainViewController

-(void) loadView {
    
    [super loadView];
    [self.view setBackgroundColor:__COLOR_ORANGE];
    [self.pViewContent setBackgroundColor:__COLOR_FIOLENT];
    [self setTitle:@"StoreKit_v2"];
}

@end
