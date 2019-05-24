//
//  ViewController.m
//  Protocol
//
//  Created by Alexandr Kirilov on 24/05/2019.
//  Based on raywanderlich.com video and official Apple developers documentation
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
