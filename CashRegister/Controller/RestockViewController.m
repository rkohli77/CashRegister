//
//  RestockViewController.m
//  CashRegister
//
//  Created by Ritz on 2017-10-22.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import "RestockViewController.h"
#import "Product.h"

@interface RestockViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *stockTable;
@property (weak, nonatomic) IBOutlet UITextField *restockQty;
@property(nonatomic) Product *product;
@end

@implementation RestockViewController

- (IBAction)cancel:(id)sender {
    [self.restockQty resignFirstResponder];
    self.navigationItem.title = @"";
}

- (IBAction)ok {
    NSString *setQuantity = self.restockQty.text;
    NSNumberFormatter *noFormat = [[NSNumberFormatter alloc]init];
    NSNumber *num = [noFormat numberFromString:setQuantity];
    int qty = [num intValue];
    NSString *selProduct = self.navigationItem.title;
    self.restockQty.text = @"";
    if([selProduct length] !=0){
        self.listOfItems = [self.updateStore updateStockForItem:selProduct withQuantity:qty];
        [self.stockTable reloadData];
        [self.picker reloadAllComponents];
        [self.restockQty resignFirstResponder];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)stockTable{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listOfItems.count;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.product = [self.listOfItems objectAtIndex:indexPath.row];
    cell.textLabel.text = self.product.desc;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.product = [self.listOfItems objectAtIndex:indexPath.row];
    self.navigationItem.title = self.product.name;
}

@end







