//
//  StoreModel.h
//  CashRegister
//
//  Created by Ritz on 2017-10-19.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
@interface StoreModel : NSObject
@property(nonatomic) NSMutableArray *listOfProducts;
-(double)calculateTotalAmountForItem:(NSString*)itemName
                        andQaunatity:(int)quantity;
-(void)completeBuywithProduct:(NSString*)productName
                  andQuantity:(int)quantity
               andTotalAmount:(double)totalAmount;
@property(nonatomic)NSMutableArray *historyArr;
-(NSMutableArray*)updateStockForItem:(NSString*)pName
                        withQuantity:(int)quantity;
@end
