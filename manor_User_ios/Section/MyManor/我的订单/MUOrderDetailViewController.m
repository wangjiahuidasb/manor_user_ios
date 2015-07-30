//
//  MUOrderDetailViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/6.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUOrderDetailViewController.h"
#import "MUTabBarViewController.h"
#import "MUOrderDetailHeadCell.h"
#import "MUOrderDetailAddressCell.h"
#import "MUOrderDetailCodeCell.h"
#import "MUOrderDetailBottomCell.h"
#import "MUOrderHeadCell.h"
#import "MUOrderContentCell.h"



@interface MUOrderDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MUTabBarViewController *tabBarView;
    BOOL itemStatus;
    NSArray *dataArray;
    
}

@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *refundBtn;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;
@end

@implementation MUOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"订单详情";
    
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    
    UIButton *itemBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBarButton setImage:[UIImage imageNamed:@"item"] forState:UIControlStateNormal];
    [itemBarButton addTarget:self action:@selector(itemBtn) forControlEvents:UIControlEventTouchUpInside];
    [itemBarButton setFrame:CGRectMake(285, 0, 25, 25)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:itemBarButton];
    [self.navigationItem setRightBarButtonItem:right];
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    
    dataArray = @[@"1",@"2"];
    
    _type = @"address";
    [self BtnType:2];
    
}


#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)itemBtn
{
    if (itemStatus ==NO) {
        _itemView.hidden = NO;
        itemStatus = YES;
    }else
    {
        _itemView.hidden = YES;
        itemStatus = NO;
    }
    
}
- (void)BtnType:(int) num
{
    _payBtn.layer.cornerRadius = 4.0f;
    _payBtn.layer.masksToBounds = YES;
    
    if (_btnType == num) {
        _refundBtn.hidden = NO;
        _bottomView.hidden = YES;
    }else if (_btnType == num)
    {
        //待付款
        _refundBtn.hidden = YES;
        _bottomView.hidden = NO;
        _cancelBtn.hidden = NO;
        
        [_payBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        
    }else
    {
        //已发货
        _refundBtn.hidden = YES;
        _bottomView.hidden = NO;
        _cancelBtn.hidden = YES;
        
        [_payBtn setTitle:@"确认收货" forState:UIControlStateNormal];
    }
}

#pragma mark 更多按钮View
- (IBAction)goHomePageVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:400];
}
- (IBAction)goCategyVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:401];
}
- (IBAction)goShopcartVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:402];
}
- (IBAction)goMymanorVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:403];
}

#pragma mark tableView 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 2;
    }else if (section ==1)
    {
        return 1+dataArray.count;
    }else
    {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        if(indexPath.row ==0)
        {
            return 110;
        }else 
        {
            if([_type isEqualToString:@"code"])
            {
                return 40;
            }else
            {
                return 70;
            }
        }
    }else if (indexPath.section ==1)
    {
        if(indexPath.row ==0)
        {
            return 50;
        }else
        {
            return 120;
        }
    }else
    {
        return 152;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        if(indexPath.row ==0)
        {
            
            MUOrderDetailHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"detailHead"];
            if (headCell == nil) {
                headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderDetailHeadCell" owner:self options:nil]lastObject];
            }
            return headCell;
        }else
        {
            if([_type isEqualToString:@"code"])
            {
                MUOrderDetailCodeCell *codeCell = [tableView dequeueReusableCellWithIdentifier:@"detailCode"];
                if (codeCell == nil) {
                    codeCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderDetailCodeCell" owner:self options:nil]lastObject];
                }
                return codeCell;
            }else
            {
                MUOrderDetailAddressCell *addressCell = [tableView dequeueReusableCellWithIdentifier:@"detailAddress"];
                if (addressCell == nil) {
                    addressCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderDetailAddressCell" owner:self options:nil]lastObject];
                }
                return addressCell;
            }
        }
    }else if (indexPath.section ==1)
    {
        if(indexPath.row ==0)
        {
            MUOrderHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"orderHead"];
            if (headCell == nil) {
                headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderHeadCell" owner:self options:nil]lastObject];
            }
            return headCell;
            
        }else
        {
            MUOrderContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"orderContent"];
            if (contentCell == nil) {
                contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderContentCell" owner:self options:nil]lastObject];
            }
            if (indexPath.row == dataArray.count)
            {
                contentCell.lineView.hidden = YES;
            }
            return contentCell;
        }
    }else
    {
        MUOrderDetailBottomCell *bottomCell = [tableView dequeueReusableCellWithIdentifier:@"detailBottom"];
        if (bottomCell == nil) {
            bottomCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderDetailBottomCell" owner:self options:nil]lastObject];
        }
        return bottomCell;
    }

    
    
    
}

@end
