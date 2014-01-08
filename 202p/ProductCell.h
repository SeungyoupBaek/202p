//
//  ProductCell.h
//  202p
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CartDelegate.h"

@interface ProductCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UILabel* productName;
@property(weak, nonatomic) IBOutlet UILabel* productPrice;
@property(weak, nonatomic) IBOutlet UIImageView* productImage;

@property (weak)id<CartDelegate> delegate;

-(void)setProductInfo:(Product *)item;

@end
