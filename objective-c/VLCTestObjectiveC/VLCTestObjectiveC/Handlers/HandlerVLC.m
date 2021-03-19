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
		NSURL* oUrl = [NSURL URLWithString:@"https://cf-de5.instatfootball.tv/720/1765511_1.mp4?Expires=1616065990&Signature=o~Y2GFLJOnxVGdN76gimrv86I8MiMX3HqcJsvxvII47Q7QYkkMJ5EArFozkRdLBb-6ARF9r6b45xWYp6R~BCjbDJAPLK4vf2xGQmv8q2tdw6OmUt513hpOSYv9Hp0zuyc0of9dcnf6qHTxTAeFPVV0mR-nKeW~gLzeHEeZ0HNvX5hOc~t9QW6FAd5562URe9whtUgz~Sup12qT1~VUaMDe-3XMHuoOycXO~9F7wE8J9ppKp4jHJybwgm~hsWwkYOtZITMwsdIlk2qwBiiGeBzNgWGQHbXVGE3bz1uVbXpIkrppIPMSJDRXk2Zo0KeJZPELv3ASdPZhIz~ATYanW68J6kGcwtW-sjFVhZhhfc1e5FEoFvy58LQc5~-35Lu1FcNpWmFjNBXa-ndFDAs41z2JUPWfm2Qs6gTku5uAG-Fpkk3CB~CtSyERtaTLpii4pc8SQ2PL0n71wgXUsfvArL8GR-VFDzJS2~MO9sEveWYUqhM1qRFLQGsIaFKSSr~WMwlTp4z3nLkW01AssS0-LSl8eizfN8c7BMOooFxuAb~jLzp4aRPvoIFSEWgzO3Qb54cywLhCI6wEWqPEfp4BJ3wqE4QOAf73bflZ3ZFERmtzV-jz57a~ICns16Wy0il9Egjvr8fKF4w0R2Qrl-8mCS6UNKG~3OM2Pmw~urHAPD4nM_&Key-Pair-Id=APKAJP7V33NW3RCUW6CQ"];
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
