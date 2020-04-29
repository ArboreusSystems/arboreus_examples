//
//  VCTemplate.h
//  StackView
//
//  Created by Alexandr Kirilov on 28/04/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCTemplate : UIViewController

@property (atomic,strong) UIView* pContentWrapper;
@property (atomic,strong) UIView* pContent;

@end

NS_ASSUME_NONNULL_END
