//
//  ViewController.m
//  Selectors
//
//  Created by Alexandr Kirilov on 08/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)buttonExit:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {

	[super viewDidLoad];
}

- (IBAction)buttonExit:(id)sender {

	[MainHandler mDoExit];
}

@end
