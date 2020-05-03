//
//  VCMain.h
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 01/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Definitions/DColors.h"
#import "TableViewTemplate.h"
#import "../Cells/Element1Cell.h"
#import "../Cells/Element2Cell.h"
#import "../Cells/Element3Cell.h"
#import "../Cells/Element4Cell.h"
#import "../Cells/Element5Cell.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCMain : UIViewController <UITableViewDelegate,UITableViewDataSource> {

	NSMutableDictionary* pViewStructure;
}

@property (atomic,strong) UITableView* pTableView;

@end

NS_ASSUME_NONNULL_END
