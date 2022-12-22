//
//  AViewControllerTemplate.m
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 21/12/2022.
//

#import "AViewControllerTemplate.h"

@interface AViewControllerTemplate ()

@end

@implementation AViewControllerTemplate

-(void) loadView {

    [super loadView];
    
    [self setPColorWrapper:__COLOR_BLACK];
    
    _pViewContent = [[UIView alloc] init];
    [_pViewContent setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_pViewContent setBackgroundColor:__COLOR_GREEN_DARK];
    
    _pViewWrapper = [[UIView alloc] init];
    [_pViewWrapper setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_pViewWrapper setBackgroundColor:_pColorWrapper];
}

-(void) viewDidLoad {

    [super viewDidLoad];
    
    _pElementWidth = [self view].frame.size.width * 0.3;
    _pElementHeight = self.view.frame.size.width * 0.2;
    
    [self.view addSubview:_pViewWrapper];
    [[_pViewWrapper.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
    [[_pViewWrapper.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
    [[_pViewWrapper.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
    [[_pViewWrapper.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
    
    [_pViewWrapper addSubview:_pViewContent];
    [[_pViewContent.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
    [[_pViewContent.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
    [[_pViewContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
    [[_pViewContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
}

-(void) mSetColorWrapper:(UIColor*)inColor {
    
    [self setPColorWrapper:inColor];
    [_pViewWrapper setBackgroundColor:_pColorWrapper];
}

@end

