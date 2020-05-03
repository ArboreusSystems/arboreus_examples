//
//  Element1Cell.h
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 02/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface Element1Cell : UITableViewCell

@property (atomic,strong) UIButton* pButtonAction;

+(NSString*) mIdentifier;
-(void) mSetup;

@end

NS_ASSUME_NONNULL_END
