//
//  ManagerViewController.h
//  CashRegister
//
//  Created by Ritz on 2017-10-21.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreModel.h"

@protocol ManagerViewControllerDelegate;
@interface ManagerViewController : UIViewController

@property(nonatomic) id<ManagerViewControllerDelegate> managerDelegate;
@property(nonatomic) NSMutableArray *itemList;;
@property(nonatomic) NSMutableArray *historyArray;
@property(nonatomic) StoreModel *store;
@property(nonatomic) UIPickerView *picker;
@end

@protocol ManagerViewControllerDelegate
@required
-(void)managerViewFinish;
@end
