//
//  MainViewController.m
//  Touch3D
//
//  Created by Alexandr Kirilov on 09/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "MainViewController.h"
#define __METHOD_NAME_TO_LOG NSLog(@"%@: %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));

@interface MainViewController ()

@property (nonatomic,assign) BOOL pForceTouch;
@property (weak,nonatomic) IBOutlet UILabel *pLabelTouch3D;
@property (nonatomic,strong) DemoObject *pObject;

- (IBAction)mButtonExit:(id)sender;

@end

@implementation MainViewController

-(instancetype) init {
    self = [super init];
    if (self) {
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        	[self setPForceTouch:YES];
		} else {
			[self setPForceTouch:NO];
		}
		_pObject = [[DemoObject alloc] init];
		_pObject.center = CGPointMake(
			[UIScreen mainScreen].bounds.size.width / 2,
			[UIScreen mainScreen].bounds.size.height / 2
		);
		[self.view addSubview:_pObject];
    }
    return self;
}

-(void) viewDidLoad {

    [super viewDidLoad];
    if (_pForceTouch) {
    	_pLabelTouch3D.text = @"Touch 3D - supported on this device";
	} else {
		_pLabelTouch3D.text = @"Touch 3D - NOT supported on this device";
	}
}

- (IBAction)mButtonExit:(id)sender {

	[MainHandler mDoExit];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	
	__METHOD_NAME_TO_LOG
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

	__METHOD_NAME_TO_LOG
	NSSet *oTouches = [event allTouches];
	UITouch *oTouch = [[oTouches allObjects] firstObject];
	if (oTouch) {
		_pObject.center = [oTouch locationInView:self.view];
	}
	if (_pForceTouch) {
		CGFloat oForce = oTouch.force / oTouch.maximumPossibleForce;
		NSLog(@"Touch force is: %f, %f g",oForce,oForce * 385);
	}
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *) event {

	__METHOD_NAME_TO_LOG
	NSSet *oTouches = [event allTouches];
	UITouch *oTouch = [[oTouches allObjects] firstObject];
	_pObject.backgroundColor = [MainHandler mCreateRandomColor];
	if (oTouch) {
		_pObject.center = [oTouch locationInView:self.view];
	}
}

-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

	__METHOD_NAME_TO_LOG
}

@end
