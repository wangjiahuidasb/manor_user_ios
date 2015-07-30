//
//  MUMyCareViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/10.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMyCareViewController.h"
#import "MUTabBarViewController.h"
#import "MUStrategyCell.h"
#import "MUGoodsCell.h"
#import "MUZChouCell.h"
#import "MUManorCell.h"

#define LINEWIDTH SCREENWIDTH/4
@interface MUMyCareViewController ()
{
    MUTabBarViewController *tabBarView;
    UIImageView *lineImg;
    BOOL itemStatus;
    NSArray *dataArray;
    NSString *type;
}
@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (strong, nonatomic) IBOutlet UIView *cancelView;
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//删除属性
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

@implementation MUMyCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
    
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
    
    lineImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, LINEWIDTH, 2)];
    lineImg.image = [UIImage imageNamed:@"line"];
    [_headView addSubview:lineImg];
    
    
    _cancelView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _cancelView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _cancelView.hidden = YES;
    [self.navigationController.view addSubview:_cancelView];

    
    dataArray = @[@"1",@"2",@"3",@"4",@"5"];
    
    type = @"庄园";
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"head"];
    
    _sureBtn.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _sureBtn.layer.borderWidth = 1.0;
    _sureBtn.layer.cornerRadius = 4.0f;
    
    _cancelBtn.layer.cornerRadius = 4.0f;
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

- (void)cancelBtnFunction
{
    _cancelView.hidden = NO;
}
#pragma mark 按钮View
- (IBAction)careTypeFunction:(id)sender
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
            //庄园
            type = @"庄园";
            lineImg.frame = CGRectMake(0, 42, LINEWIDTH, 2);
            
            break;
        case 401:
            //商品
            type = @"商品";
            lineImg.frame = CGRectMake(LINEWIDTH, 42, LINEWIDTH, 2);
            break;
        case 402:
            //攻略
            type = @"攻略";
            lineImg.frame = CGRectMake(2*LINEWIDTH, 42, LINEWIDTH, 2);
            break;
        case 403:
            //众筹
            type = @"众筹";
            lineImg.frame = CGRectMake(3*LINEWIDTH, 42, LINEWIDTH, 2);
            break;
        
            
        default:
            break;
    }
    [_tableView reloadData];

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

#pragma mark 删除View
- (IBAction)cancalFunction:(id)sender {
    _cancelView.hidden = YES;
}

- (IBAction)sureFunction:(id)sender {
    _cancelView.hidden = YES;
}
#pragma mark tableView 代理


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1+dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return 10;
    }else
    {
        return 120;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"head"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor colorWithRed:249/255.0f green:249/255.0f blue:249/255.0f alpha:1.0]];
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0];
        [cell addSubview:lineView];
        return cell;
    }else
    {
        if (([type isEqualToString:@"庄园"])) {
            
            MUManorCell *manorCell = [tableView dequeueReusableCellWithIdentifier:@"manor"];
            if (manorCell == nil) {
                manorCell = [[[NSBundle mainBundle]loadNibNamed:@"MUManorCell" owner:self options:nil]lastObject];
            }
            [manorCell.cancelBtn addTarget:self action:@selector(cancelBtnFunction) forControlEvents:UIControlEventTouchUpInside];
            return manorCell;
            
        }else if ([type isEqualToString:@"攻略"]) {
            MUStrategyCell *strategyCell = [tableView dequeueReusableCellWithIdentifier:@"strategy"];
            if (strategyCell == nil) {
                strategyCell = [[[NSBundle mainBundle]loadNibNamed:@"MUStrategyCell" owner:self options:nil]lastObject];
            }
             [strategyCell.cancelBtn addTarget:self action:@selector(cancelBtnFunction) forControlEvents:UIControlEventTouchUpInside];
            return strategyCell;
        }else if ([type isEqualToString:@"商品"]) {
            MUGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:@"goods"];
            if (goodsCell == nil) {
                goodsCell = [[[NSBundle mainBundle]loadNibNamed:@"MUGoodsCell" owner:self options:nil]lastObject];
            }
             [goodsCell.cancelBtn addTarget:self action:@selector(cancelBtnFunction) forControlEvents:UIControlEventTouchUpInside];
            return goodsCell;
        }else
        {
            MUZChouCell *zchouCell = [tableView dequeueReusableCellWithIdentifier:@"zchou"];
            if (zchouCell == nil) {
                zchouCell = [[[NSBundle mainBundle]loadNibNamed:@"MUZChouCell" owner:self options:nil]lastObject];
            }
             [zchouCell.cancelBtn addTarget:self action:@selector(cancelBtnFunction) forControlEvents:UIControlEventTouchUpInside];
            return zchouCell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    
    
}

@end
