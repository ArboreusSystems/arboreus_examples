//
//  VCMain.m
//  Localization
//
//  Created by Alexandr Kirilov on 08/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "VCMain.h"



@interface VCMain ()

@end

@implementation VCMain


// --------------------------------------
#pragma mark - Init

-(instancetype) init {

    self = [super init];
    if (self) {
        
        [self setTitle:NSLocalizedString(@"VCMain.Title",@"")];
        [self.view setBackgroundColor:__COLOR_BLUE];
        
    }
    return self;
}


// --------------------------------------
#pragma mark - Lifecycle

-(void) viewDidLoad {

	[super viewDidLoad];
}

@end
