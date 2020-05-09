//
//  VCMain.h
//  Localization
//
//  Created by Alexandr Kirilov on 08/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"
#import "../Handlers/HGlobal.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCMain : UIViewController {

	UILabel* pLabelTestString;
	UIButton* pButtonENG;
	UIButton* pButtonFIN;
	UIButton* pButtonRUS;
	HGlobal* pGlobal;
}

//-(void) mSetLocalization;
//-(void) mSetLocalization:(NSNotification *)inNotification;

@end

NS_ASSUME_NONNULL_END
