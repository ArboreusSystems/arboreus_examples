// ----------------------------------------------------------
/*!
	\class APrivacyNativeIOS
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/09/2026 at 15:18:42
	\endlist
*/
// ----------------------------------------------------------


// -----------
// IOS part
// -----------

// Class header
#include "aprivacynativeios.h"

// Global variables
APrivacyNativeIOSHandler* gAPrivacyNativeIOSHandler = nullptr;

// Class definitions
@implementation APrivacyNativeIOSHandler

+(instancetype) mInstance {
    
	static APrivacyNativeIOSHandler* oInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		oInstance = [[APrivacyNativeIOSHandler alloc] init];
	});
	return oInstance;
}

-(instancetype) init {
    
	self = [super init];
	if (self) {
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        [center addObserver:self selector:@selector(mShowPrivacyScreen) name:UIApplicationWillResignActiveNotification object:nil];
		[center addObserver:self selector:@selector(mShowPrivacyScreen) name:UIApplicationDidEnterBackgroundNotification object:nil];
		[center addObserver:self selector:@selector(mHidePrivateScreen) name:UIApplicationDidBecomeActiveNotification object:nil];
		[center addObserver:self selector:@selector(mOnScreenshotDetected) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
		[center addObserver:self selector:@selector(mOnScreenRecordingChanged) name:UIScreenCapturedDidChangeNotification object:nil];
        
		[self setPAction:YES];
        
        gAPrivacyNativeIOSHandler = self;
	}
    
	return self;
}

-(UIWindow*) mActiveWindow {
    
	for (UIScene* oScene in [UIApplication sharedApplication].connectedScenes) {
        
		if ([oScene isKindOfClass:[UIWindowScene class]]) {
            
			UIWindowScene* oWindowScene = (UIWindowScene*)oScene;
			for (UIWindow* oWwindow in oWindowScene.windows) {
				if (oWwindow.isKeyWindow) {
					return oWwindow;
				}
			}

            if (oWindowScene.windows.count > 0) {
				return oWindowScene.windows.firstObject;
			}
		}
	}
    
	return nil;
}

-(void) mShowPrivacyScreen {
    
    if ([self pAction]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIWindow* oWindow = [self mActiveWindow];
            if (!oWindow) return;

            if (!self.pPrivacyScreen) {
            
                UIBlurEffect* oBlur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
                UIVisualEffectView* oBlurView = [[UIVisualEffectView alloc] initWithEffect:oBlur];
                oBlurView.frame = oWindow.bounds;
                oBlurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

                UILabel* oLabel = [[UILabel alloc] init];
				oLabel.text = @"Sensitive data covered";
                oLabel.textColor = [UIColor whiteColor];
                oLabel.font = [UIFont boldSystemFontOfSize:20];
                [oLabel sizeToFit];
                oLabel.center = oBlurView.contentView.center;
                oLabel.autoresizingMask =
                    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;

                [oBlurView.contentView addSubview:oLabel];
                self.pPrivacyScreen = oBlurView;
            }

            [oWindow addSubview:self.pPrivacyScreen];
            [oWindow bringSubviewToFront:self.pPrivacyScreen];
            [oWindow layoutIfNeeded];
        });
    }
}

-(void) mHidePrivateScreen {
    
    if ([self pAction]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (self.pPrivacyScreen) {
                [self.pPrivacyScreen removeFromSuperview];
                self.pPrivacyScreen = nil;
            }
        });
    }
}

-(void) mOnScreenshotDetected {
    
	if ([self pAction]) APrivacy::mInstance()->mScreenshotTakenHandler();
}

-(void) mOnScreenRecordingChanged {
    
    if ([self pAction]) {
        if ([UIScreen mainScreen].isCaptured) {
            APrivacy::mInstance()->mScreenRecordingHandler(true);
        } else {
            APrivacy::mInstance()->mScreenRecordingHandler(false);
        }
    }
}

@end


// -----------
// Qt part
// -----------

QT_BEGIN_NAMESPACE


// -----------
/*!
	\fn

	Doc.
*/

extern "C" void fAPrivacy_Init(void) {

	@autoreleasepool {
		[APrivacyNativeIOSHandler mInstance];
	}
}


// -----------
/*!
	\fn

	Doc.
*/

extern "C" void fAPrivacy_SetAction(bool inAction) {

    if (inAction) {
        [gAPrivacyNativeIOSHandler setPAction: YES];
    } else {
        [gAPrivacyNativeIOSHandler setPAction: NO];
    }
}

QT_END_NAMESPACE
