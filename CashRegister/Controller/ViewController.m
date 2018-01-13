//
//  ViewController.m
//  CashRegister
//
//  Created by Ritz on 2017-10-19.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import "ViewController.h"
#import "StoreModel.h"
#import "Product.h"
#import "ManagerViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,ManagerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *tVal;
@property (weak, nonatomic) IBOutlet UILabel *qVal;
@property (weak, nonatomic) IBOutlet UILabel *iVal;
@property(nonatomic) StoreModel *store;
@property (weak, nonatomic) IBOutlet UIPickerView *storePicker;
@end

@implementation ViewController
BOOL isNew = YES;
-(void)managerViewFinish{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"manager"]){
        ManagerViewController *mv = [segue destinationViewController];
        mv.historyArray = self.store.historyArr;
        mv.itemList = self.store.listOfProducts;
        mv.store = self.store;
        mv.picker = self.storePicker;
        mv.managerDelegate = self;
    }
}
-(StoreModel*)store{
    if(_store == nil){
        _store = [[StoreModel alloc]init];
    }
    return _store;
}
- (IBAction)calcButton:(UIButton*)sender {
    
    //CHECK THE CODE-----------------------
    NSString *pVal = @"";
    if(isNew){
        self.qVal.text = sender.currentTitle;
        pVal = sender.currentTitle;
        isNew = NO;
    }
    else{
        self.qVal.text = [NSString stringWithFormat:@"%@%@", self.qVal.text, sender.currentTitle]  ;
    }
    NSString *quantity = self.qVal.text;
    NSString *itemName = self.iVal.text;
    double totalVal = [self.store calculateTotalAmountForItem:itemName andQaunatity:[quantity intValue]];
    self.tVal.text = [NSString stringWithFormat:@"%.2f", totalVal];
}

- (IBAction)resetVal {
    self.qVal.text = @"0";
    //self.iVal.text = @"None";
}

- (IBAction)buy {
    NSString *quantity = self.qVal.text;
    NSString *itemName = self.iVal.text;
    NSString *total = self.tVal.text;
    [self.store completeBuywithProduct:itemName andQuantity:[quantity intValue] andTotalAmount:[total doubleValue]];
    [self.storePicker reloadAllComponents];
    self.qVal.text = @"0";
    self.iVal.text = @"None";
    self.tVal.text = @"0";
    isNew = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.store.listOfProducts.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    Product *p = [self.store.listOfProducts objectAtIndex:row];
    NSString *a = [p getDesc];
    return a;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    Product *p = self.store.listOfProducts[row];
    self.iVal.text = p.name;
}

@end
