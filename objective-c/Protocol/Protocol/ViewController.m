//
//  ViewController.m
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "ViewController.h"
#import "Handler.h"

@interface ViewController ()

- (IBAction)buttonExit:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonExit:(id)sender {
    [Handler exit];
}

@end
