//
//  HLoggerMessageType.m
//  Date&Time
//
//  Created by Alexandr Kirilov on 20/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "HLoggerMessageType.h"

NSString* _Nonnull const HLoggerMessageTypeToString[] = {
	
	[HLoggerMessageNotice] = @"[Notice]",
	[HLoggerMessageWarning] = @"[Warning]",
	[HLoggerMessageCritical] = @"[Critical]",
	[HLoggerMessageUserAction] = @"[User action]"
};
