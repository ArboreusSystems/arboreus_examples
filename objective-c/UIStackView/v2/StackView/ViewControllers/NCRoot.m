//
//  NCRoot.m
//  StackView
//
//  Created by Alexandr Kirilov on 28/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "NCRoot.h"

@interface NCRoot ()

@end

@implementation NCRoot

-(instancetype) init {

	self = [super init];
	if (self) {
		
		VCMain* oVCInitial = [[VCMain alloc] init];
		[self setViewControllers:@[oVCInitial] animated:YES];
	}
	return self;
}

-(void)viewDidLoad {

	[super viewDidLoad];
}

@end
