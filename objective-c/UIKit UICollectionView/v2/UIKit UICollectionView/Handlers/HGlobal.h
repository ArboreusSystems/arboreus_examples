//
//  HGlobal.h
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 26/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGlobal : NSObject {

	BOOL pIsPhone;
	BOOL pIsLandscape;
}

+(HGlobal*) mInstance;
-(BOOL) mIsPhone;
-(BOOL) mIsLandscape;

@end

NS_ASSUME_NONNULL_END
