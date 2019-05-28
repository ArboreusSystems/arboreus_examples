//
//  MainViewController.h
//  XibFile
//
//  Created by Alexandr Kirilov on 28/05/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Handler.h"
#import "AuxiliaryViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelMessage;

-(IBAction) buttonExit:(id)sender;
-(IBAction) buttonAuxiliaryViewController:(id)sender;

@end

NS_ASSUME_NONNULL_END
