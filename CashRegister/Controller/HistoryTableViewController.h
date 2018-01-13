//
//  HistoryTableViewController.h
//  CashRegister
//
//  Created by Ritz on 2017-10-21.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreModel.h"
@protocol HistoryTableViewControllerDelegate;

@interface HistoryTableViewController : UITableViewController
@property(nonatomic) id<HistoryTableViewControllerDelegate> historyDelegate;
@property(nonatomic)NSMutableArray *historyArray;
@property(nonatomic) StoreModel *myStore;
@end

@protocol HistoryTableViewControllerDelegate
@required
-(void)historyTableViewFinish;

@end
