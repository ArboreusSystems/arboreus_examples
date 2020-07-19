//
//  HandlerVLC.m
//  VLCTestObjectiveC
//
//  Created by Alexandr Kirilov on 08/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HandlerVLC.h"

@implementation HandlerVLC

-(id) init {
	
	self = [super init];
	if (self) {
		
		_pPlayerView = [[UIView alloc] init];
		[_pPlayerView setTranslatesAutoresizingMaskIntoConstraints:NO];
		
		_pPlayer = [[VLCMediaPlayer alloc] init];
		NSURL* oUrl = [NSURL URLWithString:@"past/your/media/url/here"];
		VLCMedia* oMedia = [VLCMedia mediaWithURL:oUrl];
		_pPlayer.media = oMedia;
		_pPlayer.drawable = _pPlayerView;
	}
	return self;
}

+(HandlerVLC*) mInstance {
	
	static HandlerVLC* oInstance = nil;
	static dispatch_once_t oThread;
	dispatch_once(&oThread,^{
		oInstance = [[self alloc] init];
	});
	return oInstance;
}

@end
