//
//  MUShopCartViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/5/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUShopCartViewController.h"
#import "MUCarHeadCell.h"
#import "MUCarBottomCell.h"
#import "MUCarManorHeadCell.h"
#import "MUCarContentCell.h"
#import "MUFarmOrderViewController.h"

@interface MUShopCartViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int sec;
    int row;
    BOOL status;
    UIButton *editButton;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *finalBtn;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;


@end

@implementation MUShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    
    editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setImage:[UIImage imageNamed:@"infoEdit"] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editBtn) forControlEvents:UIControlEventTouchUpInside];
    [editButton setFrame:CGRectMake(285, 0, 25, 25)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:editButton];
    [self.navigationItem setRightBarButtonItem:right];
    _finalBtn.layer.cornerRadius = 4.0f;
    
    sec = 2;
    row = 1;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"3");
}

#pragma mark 常用方法
- (void)editBtn
{
    if(status == NO)
    {
        [editButton setImage:nil forState:UIControlStateNormal];
        [_finalBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_finalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finalBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        _priceLabel.hidden = YES;
        [_finalBtn setTitle:@"删除" forState:UIControlStateNormal];
        status = YES;
    }else
    {
        [editButton setImage:[UIImage imageNamed:@"infoEdit"] forState:UIControlStateNormal];
        [_finalBtn setTitle:nil forState:UIControlStateNormal];
        _priceLabel.hidden = NO;
        [_finalBtn setTitle:@"结算" forState:UIControlStateNormal];
        status = NO;
    }
    
}

- (IBAction)checkallFunction:(id)sender
{
    if(_allBtn.selected)
    {
        [_allBtn setSelected:NO];
    }else
    {
        [_allBtn setSelected:YES];
    }
}

- (IBAction)sumOrCancelFunction:(id)sender
{
    if([_finalBtn.titleLabel.text isEqualToString:@"结算"])
    {
        MUFarmOrderViewController *shopCartVC = [[MUFarmOrderViewController alloc]init];
        [self.navigationController pushViewController:shopCartVC animated:YES];
    }else
    {
        NSLog(@"删除就是");
    }
}


- (void)manorSelected
{
    for (int i=0; i<sec;i++)
    {
        
    }
}
#pragma mark tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1+sec;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }else
    {
        return row+2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 45;
    }else
    {
        if (indexPath.row ==0) {
            return 50;
        }else if(indexPath.row<=row)
        {
            
            return 120;
        }else
        {
           
            return 45;
        }

    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        MUCarHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"carHead"];
        if (headCell == nil) {
            headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUCarHeadCell" owner:self options:nil]lastObject];

        }
        return headCell;
    }else
    {
        if (indexPath.row ==0) {
            MUCarManorHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"manorHead"];
            if (headCell == nil) {
                headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUCarManorHeadCell" owner:self options:nil]lastObject];
                
            }
            return headCell;
        }else if(indexPath.row<=row&&indexPath.row>0)
        {
            MUCarContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"carContent"];
            if (contentCell == nil) {
                contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUCarContentCell" owner:self options:nil]lastObject];
                
            }
            return contentCell;
        }else
        {
            MUCarBottomCell *bottomCell = [tableView dequeueReusableCellWithIdentifier:@"carBottom"];
            if (bottomCell == nil) {
                bottomCell = [[[NSBundle mainBundle]loadNibNamed:@"MUCarBottomCell" owner:self options:nil]lastObject];
                
            }
            return bottomCell;
        }
    }
}

@end
