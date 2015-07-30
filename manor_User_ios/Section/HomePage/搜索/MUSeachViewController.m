//
//  MUSeachViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/23.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUSeachViewController.h"
#import "MUTabBarViewController.h"

@interface MUSeachViewController ()
{
    MUTabBarViewController *tabBarView;
    BOOL itemStatus;
}
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (weak, nonatomic) IBOutlet UIView *nonDataView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MUSeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //titleView
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
    _searchView.layer.cornerRadius = 15.0f;
    _searchView.layer.masksToBounds = YES;
    
    //tabBarView
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
    _tableView.hidden = YES;
    _nonDataView.hidden = NO;
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
}
#pragma mark 常用方法
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


@end
