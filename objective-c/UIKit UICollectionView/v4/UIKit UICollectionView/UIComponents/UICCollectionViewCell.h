//
//  UICCollectionViewCell.h
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 01/06/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"
#import "UICCollectionViewDataModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICCollectionViewCell : UICollectionViewCell {
	
	BOOL pCreated;
}

@property (atomic,strong) UICCollectionViewItemObject* pItem;
@property (atomic,strong) UIButton* pButton;
@property (atomic,strong) UILabel* pName;

+(NSString*) mGetClassID;
-(void) mSetupWithItem:(UICCollectionViewItemObject*)inItem;
-(CGRect) mEstimatedFrameName;
-(void) mShowSelected:(BOOL)inStatus;

@end

NS_ASSUME_NONNULL_END
