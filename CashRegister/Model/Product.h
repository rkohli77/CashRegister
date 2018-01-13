//
//  Product.h
//  CashRegister
//
//  Created by Ritz on 2017-10-19.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property(nonatomic) NSString *desc;
@property(nonatomic) NSString *name;
@property(nonatomic) double price;
@property(nonatomic) int quantity;
-(NSString*)getDesc;
- (instancetype)initWithname:(NSString*)name
                    andPrice:(double)price
                 andQuantity:(int)quantity;
-(instancetype)initWithString:(NSString*)firstStr;
@end
