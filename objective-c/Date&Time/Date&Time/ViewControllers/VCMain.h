//
//  VCMain.h
//  Date&Time
//
//  Created by Alexandr Kirilov on 20/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"
#import "../Handlers/HGlobal.h"
#import "../Handlers/HLogger.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCMain : UIViewController {

	HGlobal* pGlobal;
	HLogger* pLogger;
}

@end

NS_ASSUME_NONNULL_END
