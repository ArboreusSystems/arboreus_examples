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
        
        [self setPViewItems:[[AItemsCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];

    }
    return self;
}

-(void) loadView {
    
    [super loadView];
    [self.view setBackgroundColor:__COLOR_SALAD_DARK];
    [self setTitle:@"StoreKit_v2"];
}

-(void) viewDidLoad {
 
    [super viewDidLoad];
    
    [self.pViewContent addSubview:_pViewItems];
    [[_pViewItems.topAnchor constraintEqualToAnchor:self.pViewContent.topAnchor] setActive:YES];
    [[_pViewItems.bottomAnchor constraintEqualToAnchor:self.pViewContent.bottomAnchor] setActive:YES];
    [[_pViewItems.leftAnchor constraintEqualToAnchor:self.pViewContent.leftAnchor] setActive:YES];
    [[_pViewItems.rightAnchor constraintEqualToAnchor:self.pViewContent.rightAnchor] setActive:YES];
}

@end