//
//  ViewController.m
//  202p
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "CartDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CartDelegate>{
    NSArray *data;
    NSMutableArray *cart;
}
@property(weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

-(void)addItem:(id)sender{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [_table indexPathForCell:cell];
    Product *item = data[indexPath.row];
    
    [cart addObject:item];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [_table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (0 == section) {
        return data.count;
    }else{
        return cart.count;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return (0 == section) ? @"상품목록" : @"카트";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(0 == indexPath.section){
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    
    // 셀 내용갱신
    Product *item = data[indexPath.row];
    [cell setProductInfo:item];
        cell.delegate = self;
    
    return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        
        Product *item = cart[indexPath.row];
        cell.textLabel.text = item.name;
        return cell;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    data = @[[Product product:@"BaseBall" price:@"100" image:@"Baseball.png"],
             [Product product:@"BasketBall" price:@"200" image:@"Basketball.png"],
             [Product product:@"FootBall" price:@"250" image:@"Football.png"],
             [Product product:@"RugbyBall" price:@"300" image:@"Rugby.png"],
             [Product product:@"VolleyBall" price:@"999" image:@"Volleyball.png"]];
    
    cart = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
