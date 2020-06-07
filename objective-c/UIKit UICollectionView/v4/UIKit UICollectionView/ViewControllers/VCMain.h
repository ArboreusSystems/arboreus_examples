//
//  VCMain.h
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 25/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "../Definitions/DColors.h"
#import "../Handlers/HGlobal.h"
#import "../Handlers/HLogger.h"
#import "../UIComponents/UICCollectionView.h"
#import "../UIComponents/UICCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCMain : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {

	HGlobal* pGlobal;
	HLogger* pLogger;
	
	UIView* pContent;
	UIView* pContentWrapper;
	UICollectionViewFlowLayout* pCollectionFlowLayot;
	UICollectionView* pCollectionView;
	NSString* pClassID;
	NSIndexPath* pCurrentItemPath;
	
	NSMutableArray* pTestData;
}

@end

NS_ASSUME_NONNULL_END
