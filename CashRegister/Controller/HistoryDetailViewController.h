//
//  HistoryDetailViewController.h
//  CashRegister
//
//  Created by Ritz on 2017-10-21.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "History.h"
@protocol HistoryDetailViewControllerDelegate;
@interface HistoryDetailViewController : UIViewController
@property(nonatomic)NSMutableArray *historyDetailArr;
@property(nonatomic) id<HistoryDetailViewControllerDelegate> historyDetailDelegate;
@property(nonatomic) NSIndexPath *selectedRow;
@end
@protocol HistoryDetailViewControllerDelegate
@end
