//
//  HandlerVLC.h
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 08/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MobileVLCKit/MobileVLCKit.h>

#import "../Definitions/DefinitionColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface HandlerVLC : NSObject {
	
	UIView* pTestView;
}

@property (strong,atomic) VLCMediaPlayer* pPlayer;
@property (strong,atomic) UIView* pPlayerView;

+(HandlerVLC*) mInstance;

@end

NS_ASSUME_NONNULL_END
