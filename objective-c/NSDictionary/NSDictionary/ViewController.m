//
//  ViewController.m
//  NSDictionary
//
//  Created by Alexandr Kirilov on 27/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)buttonExit:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)buttonExit:(id)sender {
	
	Handler *oHandler = [[Handler alloc] init];
	[oHandler mDoExit];
}

@end
