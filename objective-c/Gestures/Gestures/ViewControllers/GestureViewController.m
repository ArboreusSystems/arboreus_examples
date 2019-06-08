//
//  GestureViewController.m
//  Gestures
//
//  Created by Alexandr Kirilov on 08/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "GestureViewController.h"


@interface GestureViewController ()

@property (nonatomic,strong) Object *pObject;

- (IBAction)buttonExit:(id)sender;

@end

@implementation GestureViewController

-(instancetype) init {
	
	self = [super init];
	if (self) {
		_pObject = [[Object alloc] init];
	}
	return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.view addSubview: _pObject];
	
    UITapGestureRecognizer *oTapReckognizer = [[UITapGestureRecognizer alloc]
    	initWithTarget:self
    	action:@selector(mTapHandler:)
    ];
	
    // It highly reckomended to use phisical device for testing.
    // To use Simulator for testing gestures is a very bad idea.
    // Try it by your own and you will see why.
	
    // Uncomment it for active Double click
	// oReckognizer.numberOfTapsRequired = 2;
	
	// Uncommetn in for active Two Fingers click
	// oReckognizer.numberOfTouchesRequired = 2;
	
    [self.view addGestureRecognizer:oTapReckognizer];
	
    UIPinchGestureRecognizer *oPinchReckogniser = [[UIPinchGestureRecognizer alloc]
    	initWithTarget:self
    	action:@selector(mPinchHandler:)
    ];
	oPinchReckogniser.delegate = self;
    [self.view addGestureRecognizer:oPinchReckogniser];
	
    UIRotationGestureRecognizer *oRotationReckogniser = [[UIRotationGestureRecognizer alloc]
    	initWithTarget:self
    	action: @selector(mRotationHandler:)
    ];
	oRotationReckogniser.delegate = self;
    [self.view addGestureRecognizer:oRotationReckogniser];
	
    UIPanGestureRecognizer *oPanReckogniser = [[UIPanGestureRecognizer alloc]
    	initWithTarget:self
    	action: @selector(mTapHandler:)
    ];
    [self.view addGestureRecognizer:oPanReckogniser];
}

-(void) mTapHandler: (UITapGestureRecognizer *) inReckogniser {
	
	NSLog(@"Gesture Tap Handler action");
	[UIView animateWithDuration:0.5 animations:^{
		self.pObject.center = [inReckogniser locationInView: self.view];
		self.pObject.backgroundColor = [MainHandler mCreateRandomColor];
	}];
}

-(void) mPinchHandler: (UIPinchGestureRecognizer *) inRecogniser {

	NSLog(@"Gesture Pinch Handler action. Scale is: %f",inRecogniser.scale);
	if (inRecogniser.state == UIGestureRecognizerStateBegan) {
		_pObject.pScale = 1.0;
	}
	_pObject.transform = CGAffineTransformScale(
		_pObject.transform,
		1 + inRecogniser.scale - _pObject.pScale,
		1 + inRecogniser.scale - _pObject.pScale
	);
	_pObject.pScale = inRecogniser.scale;
}

-(void) mRotationHandler: (UIRotationGestureRecognizer *) inRecockgniser {

	NSLog(@"Gesture Rotation Handler action. Angle: %f",inRecockgniser.rotation);
	if (inRecockgniser.state == UIGestureRecognizerStateBegan) {
		_pObject.pAngle = 0;
	}
	_pObject.transform = CGAffineTransformRotate(
		_pObject.transform,
		inRecockgniser.rotation - _pObject.pAngle
	);
}

-(void) mPanHandler: (UIPanGestureRecognizer *) inRecogniser {

	NSLog(@"Gesture Pan Handler action");
	_pObject.center = [inRecogniser locationInView:self.view];
}

-(IBAction) buttonExit:(id)sender {

	MainHandler *oHandler = [[MainHandler alloc] init];
	[oHandler mDoExit];
}

-(BOOL) gestureRecognizer: (UIGestureRecognizer *) gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer: (nonnull UIGestureRecognizer *) otherGestureRecognizer {
	return YES;
}

@end
