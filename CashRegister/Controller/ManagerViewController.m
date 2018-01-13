//
//  ManagerViewController.m
//  CashRegister
//
//  Created by Ritz on 2017-10-21.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import "ManagerViewController.h"
#import "HistoryTableViewController.h"
#import "RestockViewController.h"


@interface ManagerViewController ()<HistoryTableViewControllerDelegate, RestockViewControllerDelegate>

@end

@implementation ManagerViewController

-(void)historyTableViewFinish{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"history"]){
        HistoryTableViewController *hc = [segue destinationViewController];
        hc.historyArray = self.historyArray;
        hc.historyDelegate = self;
    }
    else if([segue.identifier isEqualToString:@"restock"]){
        RestockViewController *rc = [segue destinationViewController];
        rc.listOfItems = self.itemList;
        rc.updateStore = self.store;
        rc.picker = self.picker;
        rc.restockDelegate = self;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
