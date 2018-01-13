//
//  HistoryDetailViewController.m
//  CashRegister
//
//  Created by Ritz on 2017-10-21.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import "HistoryDetailViewController.h"
#import "History.h"

@interface HistoryDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *item;
@property (weak, nonatomic) IBOutlet UILabel *quantity;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UILabel *pDate;
@property(nonatomic)History *historyDetail;

@end

@implementation HistoryDetailViewController
- (IBAction)isDone {
    [self dismissViewControllerAnimated:YES completion:nil];
    //  [self.historyDetailDelegate historyDetailViewFinish];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.historyDetail = self.historyDetailArr[self.selectedRow.row];
    self.item.text = self.historyDetail.name;
    self.quantity.text = [NSString stringWithFormat:@"%d", self.historyDetail.quantity];
    self.total.text = [NSString stringWithFormat:@"%.2f", self.historyDetail.price];
    self.pDate.text = self.historyDetail.date;
    
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
