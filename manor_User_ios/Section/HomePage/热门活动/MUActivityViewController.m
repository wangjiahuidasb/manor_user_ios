//
//  MUActivityViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/16.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUActivityViewController.h"
#import "MUTabBarViewController.h"
#import "MUActivityCell.h"
#import "MUSecKillViewController.h"

#define LINEWIDTH SCREENWIDTH/2
@interface MUActivityViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MUTabBarViewController *tabBarView;
    UIImageView *lineImg;
    BOOL status;
    BOOL itemStatus;
}
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (strong, nonatomic) IBOutlet UIView *typeView;
@property (weak, nonatomic) IBOutlet UIView *typeContainView;

@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation MUActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(0,0,0,0);
    [btn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    UIBarButtonItem *navBarBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = navBarBtn;
    
    _titleView.frame = CGRectMake(-15, 0, SCREENWIDTH, 44);
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
    [titleView addSubview:_titleView];
    self.navigationItem.titleView = titleView;
    
    lineImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, LINEWIDTH, 2)];
    lineImg.image = [UIImage imageNamed:@"line"];
    [_headView addSubview:lineImg];
    
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
    
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
    _typeView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _typeView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _typeView.hidden = YES;
    [self.view addSubview:_typeView];
    
    [self drawlayer];
    
    NSLog(@"type is--%@",_type);
    
}

#pragma mark 常用方法
- (void)drawlayer
{
    _containView.layer.cornerRadius = 15.0f;
    _containView.layer.masksToBounds = YES;
    _containView.layer.borderColor = [UIColor whiteColor].CGColor;
    _containView.layer.borderWidth = 1.0;
    _chooseBtn.layer.cornerRadius = 13.0f;
    _chooseBtn.layer.masksToBounds = YES;
    _chooseBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    _typeContainView.layer.cornerRadius = 4.0f;
    _typeContainView.layer.masksToBounds = YES;
    
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)item:(id)sender {
    
    
    if (itemStatus ==NO) {
        _itemView.hidden = NO;
        itemStatus = YES;
    }else
    {
        _itemView.hidden = YES;
        itemStatus = NO;
    }
}

- (IBAction)typeFunction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    [button setSelected:YES];
    for (int i =400; i<402; i++) {
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
            
        default:
            break;
    }

}
- (IBAction)chooseFunction:(id)sender {
    if (status == NO) {
        [_chooseBtn setSelected:YES];
        _typeView.hidden = NO;
        status = YES;
    }else
    {
        [_chooseBtn setSelected:NO];
        _chooseBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        _typeView.hidden = YES;
        status = NO;
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MUActivityCell *activityCell = [tableView dequeueReusableCellWithIdentifier:@"activity"];
    if (activityCell == nil) {
        activityCell = [[[NSBundle mainBundle]loadNibNamed:@"MUActivityCell" owner:self options:nil]lastObject];
    }
    return activityCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MUSecKillViewController *seckillVC = [[MUSecKillViewController alloc]init];
    [self.navigationController pushViewController:seckillVC animated:YES];
}
@end
