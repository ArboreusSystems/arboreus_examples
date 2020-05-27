//
//  HLoggerMessageType.h
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 26/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum HLoggerMessageType {
	
	HLoggerMessageNotice,
	HLoggerMessageWarning,
	HLoggerMessageCritical,
	HLoggerMessageUserAction
	
} HLoggerMessageType;

extern NSString* _Nonnull const HLoggerMessageTypeToString[];

NS_ASSUME_NONNULL_END
