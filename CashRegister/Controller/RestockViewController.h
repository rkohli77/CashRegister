//
//  RestockViewController.h
//  CashRegister
//
//  Created by Ritz on 2017-10-22.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreModel.h"
@protocol RestockViewControllerDelegate;

@interface RestockViewController : UIViewController
@property(nonatomic)NSMutableArray *listOfItems;
@property(nonatomic) id<RestockViewControllerDelegate> restockDelegate;
@property(nonatomic) StoreModel *updateStore;
@property(nonatomic) UIPickerView *picker;
@end

@protocol RestockViewControllerDelegate
@end
