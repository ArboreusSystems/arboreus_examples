//
//  AAsyncAwaitView.h
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 22/12/2022.
//

#import <UIKit/UIKit.h>

#import "AsyncAwait_v1-Swift.h"
#import "../Logger/ALogger.h"
#import "../Templates/AButtonTemplate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AAsyncAwaitView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (strong,atomic) AAsyncAwait* pAsyncAwait;
@property (strong,atomic) NSArray* pUsers;
@property (strong,atomic) NSString* pCellID;
@property (strong,atomic) AButtonTemplate* pButtonGetUsers;
@property (strong,atomic) UITableView* pTableView;

@end

NS_ASSUME_NONNULL_END
