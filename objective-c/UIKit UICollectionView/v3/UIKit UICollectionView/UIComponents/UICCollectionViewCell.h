//
//  UICCollectionViewCell.h
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 01/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICCollectionViewCell : UICollectionViewCell

@property (atomic,strong) UIButton* pButton;

+(NSString*) mGetClassID;
-(void) mSetupWithTitle:(NSString*)inTitle;

@end

NS_ASSUME_NONNULL_END
