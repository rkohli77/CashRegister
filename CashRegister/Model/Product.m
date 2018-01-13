//
//  Product.m
//  CashRegister
//
//  Created by Ritz on 2017-10-19.
//  Copyright © 2017 Seneca college. All rights reserved.
//

#import "Product.h"

@interface Product()
@property(nonatomic) NSString *firstStr;

@end
@implementation Product
@synthesize desc = _desc;
@synthesize name = _name;
@synthesize price = _price;
@synthesize quantity = _quantity;
- (instancetype)initWithname:(NSString*)name
                    andPrice:(double)price
                 andQuantity:(int)quantity
{
    self = [super init];
    if (self) {
        _name = name;
        _price = price;
        _quantity = quantity;
    }
    return self;
}
-(instancetype)initWithString:(NSString*)firstStr
{
    self = [super init];
    if (self) {
        _firstStr = firstStr;
    }
    return self;
}
-(void)setName:(NSString *)name{
    _name = name;
}

-(void)setPrice:(double)price{
    _price = price;
}

-(void)setQuantity:(int)quantity{
    _quantity = quantity;
}
-(NSString*)getDesc{
    _desc = [NSString stringWithFormat:@"%@ %d price: %.2f",_name,_quantity, _price];
    return _desc;
}
-(void)setDesc:(NSString *)desc{
    _desc = desc;
}
@end
