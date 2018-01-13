//
//  StoreModel.m
//  CashRegister
//
//  Created by Ritz on 2017-10-19.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import "StoreModel.h"
#import "Product.h"
#import "History.h"

@interface StoreModel()
@property(nonatomic) Product *product;
@property(nonatomic) History *history;
@end

@implementation StoreModel
-(NSMutableArray*)listOfProducts{
    if(_listOfProducts == nil){
        _listOfProducts = [[NSMutableArray alloc]init];
    }
    return _listOfProducts;
}

-(NSMutableArray*)historyArr{
    if(_historyArr == nil){
        _historyArr = [[NSMutableArray alloc]init];
    }
    return _historyArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //Product *p0 = [[Product alloc]initWithname:@"-------" andPrice: andQuantity:];
        Product *p1 = [[Product alloc]initWithname:@"Pants" andPrice:39.99 andQuantity:20];
        Product *p2 = [[Product alloc]initWithname:@"Shirts" andPrice:29.99 andQuantity:10];
        Product *p3 = [[Product alloc]initWithname:@"Shoes" andPrice:59.99 andQuantity:30];
        Product *p4 = [[Product alloc]initWithname:@"Dress" andPrice:49.99 andQuantity:40];
        Product *p5 = [[Product alloc]initWithname:@"Shorts" andPrice:19.99 andQuantity:15];
        // [self.listOfProducts addObject:p1];
        [self.listOfProducts addObjectsFromArray:@[p1,p2,p3,p4,p5]];
    }
    return self;
}

-(double)calculateTotalAmountForItem:(NSString*)itemName
                        andQaunatity:(int)quantity{
    Product *p = [self returnProductwithName:itemName];
    double total = quantity * p.price;
    return total;
    
}

-(void)completeBuywithProduct:(NSString*)productName
                  andQuantity:(int)quantity
               andTotalAmount:(double)totalAmount{
    Product *p = [self returnProductwithName:productName];
    int leftQuantity = p.quantity - quantity;
    [p setQuantity:leftQuantity];
    History *h1 = [[History alloc]init];
    h1.name = p.name;
    h1.price = p.price * quantity;
    h1.quantity = quantity;
    NSDateFormatter *dFormat = [[NSDateFormatter alloc]init];
    [dFormat setDateFormat:@"yyyy-MM-dd hh:mm:ss a"];
    h1.date = [dFormat stringFromDate:[NSDate date]];
    [self.historyArr addObject:h1];
}

-(Product*)returnProductwithName:(NSString*)name{
    Product *p = [[Product alloc]init];
    for(int i = 0; i < self.listOfProducts.count; i++){
        Product *element = self.listOfProducts[i];
        if([element.name isEqualToString:name]){
            p = self.listOfProducts[i];
            break;
        }
    }
    return p;
}

-(NSMutableArray*)updateStockForItem:(NSString*)pName
                        withQuantity:(int)qty{
    Product * p = [self returnProductwithName:pName];
    NSUInteger index = [self.listOfProducts indexOfObject:p];
    [self.listOfProducts removeObject:p];
   // p.quantity = p.quantity + qty;
    int q = p.quantity + qty;
    [p setQuantity:q];
    p.desc = [NSString stringWithFormat:@"%@ %d price: %.2f",p.name,p.quantity, p.price];
    [self.listOfProducts insertObject:p atIndex:index];
    return self.listOfProducts;
}
@end
