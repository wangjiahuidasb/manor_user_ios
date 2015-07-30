//
//  MUMyOrderListViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMyOrderListViewController.h"
#import "MUTabBarViewController.h"
#import "MUOrderHeadCell.h"
#import "MUOrderContentCell.h"
#import "MUOrderPayCell.h"
#import "MUOrderBottomCell.h"
#import "MUOrderMoreCell.h"
#import "MUOrderDetailViewController.h"

#define LINEWIDTH SCREENWIDTH/5
@interface MUMyOrderListViewController ()
{
    MUTabBarViewController *tabBarView;
    UIImageView *lineImg;
    BOOL itemStatus;
    
    int contentNum;
    BOOL bottomStatus;
    
}

@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MUMyOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的订单";
    
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
    [tabBarView tabBarViewHidden];
    
    lineImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, LINEWIDTH, 2)];
    lineImg.image = [UIImage imageNamed:@"line"];
    [_headView addSubview:lineImg];
    
    contentNum = 2;
    bottomStatus = NO;
    

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

#pragma mark 订单类型按钮
- (IBAction)orderTypeFunction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    [button setSelected:YES];
    for (int i =400; i<405; i++) {
        UIButton *btn = (UIButton *)[_headView viewWithTag:i];
        if (i!= button.tag) {
            [btn setSelected:NO];
        }
    }
    
    switch (button.tag) {
        case 400:
            //全部
            lineImg.frame = CGRectMake(0, 42, LINEWIDTH, 2);
            break;
        case 401:
            //待付款
            lineImg.frame = CGRectMake(LINEWIDTH, 42, LINEWIDTH, 2);
            break;
        case 402:
            //待消费
            lineImg.frame = CGRectMake(2*LINEWIDTH, 42, LINEWIDTH, 2);
            break;
        case 403:
            //待收货
            lineImg.frame = CGRectMake(3*LINEWIDTH, 42, LINEWIDTH, 2);
            break;
        case 404:
            //待评价
            lineImg.frame = CGRectMake(4*LINEWIDTH, 42, LINEWIDTH, 2);
            break;
            
        default:
            break;
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
    if (contentNum>2) {
        if (bottomStatus) {
            return 2+contentNum+1+1;
        }else
        {
            return 2+contentNum+1;
        }
    }else
    {
        if (bottomStatus) {
            return 2+contentNum+1;
        }
        else
        {
            return 2+contentNum;
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (contentNum>2) {
        if (bottomStatus) {
            if (indexPath.row ==0) {
                return 50;
            }else if (indexPath.row<=contentNum)
            {
                return 120;
            }else if (indexPath.row<=contentNum+1)
            {
                return 30;
            }else if (indexPath.row<=contentNum+2)
            {
                return 40;
            }else
            {
                return 40;
            }
        }else
        {
            if (indexPath.row ==0) {
                return 50;
            }else if (indexPath.row<=contentNum)
            {
                return 120;
            }else if (indexPath.row<=contentNum+1)
            {
                return 40;
            }else
            {
                return 40;
            }

        }
    }else
    {
        if (bottomStatus) {
            if (indexPath.row ==0) {
                return 50;
            }else if (indexPath.row<=contentNum)
            {
                return 120;
            }else if (indexPath.row<=contentNum+1)
            {
                return 40;
            }else
            {
                return 40;
            }
        }
        else
        {
            if (indexPath.row ==0) {
                return 50;
            }else if (indexPath.row<=contentNum)
            {
                return 120;
            }else
            {
                return 40;
            }
        }
    }

    
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (contentNum>2) {
        if (bottomStatus) {
            //无评价，支付
            if (indexPath.row ==0) {
                MUOrderHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"orderHead"];
                if (headCell == nil) {
                    headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderHeadCell" owner:self options:nil]lastObject];
                }
                return headCell;
            }else if (indexPath.row<=contentNum)
            {
                MUOrderContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"orderContent"];
                if (contentCell == nil) {
                    contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderContentCell" owner:self options:nil]lastObject];
                }
                return contentCell;
            }else if (indexPath.row<=contentNum+1)
            {
                MUOrderMoreCell *moreCell = [tableView dequeueReusableCellWithIdentifier:@"orderMore"];
                if (moreCell == nil) {
                    moreCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderMoreCell" owner:self options:nil]lastObject];
                }
                return moreCell;
            }else if (indexPath.row<=contentNum+2)
            {
                MUOrderPayCell *payCell = [tableView dequeueReusableCellWithIdentifier:@"orderPay"];
                if (payCell == nil) {
                    payCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderPayCell" owner:self options:nil]lastObject];
                }
                return payCell;
            }else
            {
                MUOrderBottomCell *bottomCell = [tableView dequeueReusableCellWithIdentifier:@"orderBottom"];
                if (bottomCell == nil) {
                    bottomCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderBottomCell" owner:self options:nil]lastObject];
                }
                return bottomCell;
            }
        }else
        {
            //有评价，支付
            if (indexPath.row ==0) {
                MUOrderHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"orderHead"];
                if (headCell == nil) {
                    headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderHeadCell" owner:self options:nil]lastObject];
                }
                return headCell;
            }else if (indexPath.row<=contentNum)
            {
                MUOrderContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"orderContent"];
                if (contentCell == nil) {
                    contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderContentCell" owner:self options:nil]lastObject];
                }
                return contentCell;
                
                
            }else if (indexPath.row<=contentNum+1)
            {
                MUOrderMoreCell *moreCell = [tableView dequeueReusableCellWithIdentifier:@"orderMore"];
                if (moreCell == nil) {
                    moreCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderMoreCell" owner:self options:nil]lastObject];
                }
                return moreCell;
            }else
            {
                MUOrderPayCell *payCell = [tableView dequeueReusableCellWithIdentifier:@"orderPay"];
                if (payCell == nil) {
                    payCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderPayCell" owner:self options:nil]lastObject];
                }
                return payCell;
            }
            
        }
    }else
    {
        //无更多
        if (bottomStatus) {
            //无评价，支付
            if (indexPath.row ==0) {
                MUOrderHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"orderHead"];
                if (headCell == nil) {
                    headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderHeadCell" owner:self options:nil]lastObject];
                }
                return headCell;
                
            }else if (indexPath.row<=contentNum)
            {
                MUOrderContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"orderContent"];
                if (contentCell == nil) {
                    contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderContentCell" owner:self options:nil]lastObject];
                }
                return contentCell;
            }else if (indexPath.row<=contentNum+1)
            {
                MUOrderPayCell *payCell = [tableView dequeueReusableCellWithIdentifier:@"orderPay"];
                if (payCell == nil) {
                    payCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderPayCell" owner:self options:nil]lastObject];
                }
                return payCell;
            }else
            {
                MUOrderBottomCell *bottomCell = [tableView dequeueReusableCellWithIdentifier:@"orderBottom"];
                if (bottomCell == nil) {
                    bottomCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderBottomCell" owner:self options:nil]lastObject];
                }
                return bottomCell;
            }
        }
        else
        {
            //有评价，支付
            if (indexPath.row ==0) {
                MUOrderHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"orderHead"];
                if (headCell == nil) {
                    headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderHeadCell" owner:self options:nil]lastObject];
                }
                return headCell;
                
                
            }else if (indexPath.row<=contentNum)
            {
                MUOrderContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"orderContent"];
                if (contentCell == nil) {
                    contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderContentCell" owner:self options:nil]lastObject];
                }
                return contentCell;
            }else
            {
                MUOrderPayCell *payCell = [tableView dequeueReusableCellWithIdentifier:@"orderPay"];
                if (payCell == nil) {
                    payCell = [[[NSBundle mainBundle]loadNibNamed:@"MUOrderPayCell" owner:self options:nil]lastObject];
                }
                return payCell;
            }
        }
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.row<=contentNum &&indexPath.row>0)
    {
        MUOrderDetailViewController *orderDetailVC = [[MUOrderDetailViewController alloc]init];
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
     

}

@end
