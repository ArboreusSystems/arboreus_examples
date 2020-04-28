//
//  VCMain.h
//  StackView
//
//  Created by Alexandr Kirilov on 28/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCMain : UIViewController <UITextFieldDelegate> {

	BOOL pIsKeyboardShowing;
	CGSize pContentSize;
	CGRect pKeyboardFrame;
}

@property (nonatomic,strong) NSLayoutConstraint *bottomConstraint;
@property (atomic,strong) UIScrollView* pScrollView;
@property (atomic,strong) UIStackView* pStackView;
@property (atomic,strong) UITextField* pFieldUser;
@property (atomic,strong) UITextField* pFieldPassword;
@property (atomic,strong) UIButton* pButtonOk;

@end

NS_ASSUME_NONNULL_END
