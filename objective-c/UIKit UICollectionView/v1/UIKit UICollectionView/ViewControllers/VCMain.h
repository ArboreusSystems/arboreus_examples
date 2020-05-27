//
//  VCMain.h
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 25/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCMain : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {

	UICollectionViewFlowLayout* pCollectionFlowLayot;
	UICollectionView* pCollectionView;
	NSString* pClassID;
}

@end

NS_ASSUME_NONNULL_END
