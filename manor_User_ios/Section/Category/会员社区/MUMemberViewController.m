//
//  MUMemberViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/24.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMemberViewController.h"
#import "MUTabBarViewController.h"
#import "MUMemberHeadCell.h"
#import "MUMemberContentCell.h"
#import "MUScrollViewTableViewCell.h"

@interface MUMemberViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MUTabBarViewController *tabBarView;
    BOOL itemStatus;
    int row;
}
@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MUMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"会员社区";
    
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
    UIButton *itemBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBarButton setImage:[UIImage imageNamed:@"item"] forState:UIControlStateNormal];
    [itemBarButton addTarget:self action:@selector(itemBtn) forControlEvents:UIControlEventTouchUpInside];
    [itemBarButton setFrame:CGRectMake(285, 0, 25, 25)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:itemBarButton];
    [self.navigationItem setRightBarButtonItem:right];
    row =5;
    [_tableView registerClass:[MUScrollViewTableViewCell class] forCellReuseIdentifier:@"scrollCell"];
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


#pragma mark tableView代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }else
    {
        return row;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return 0.01;
    }else
    {
        return 58;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 165;
    }else
    {
        return 275;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MUMemberHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
    if (headCell == nil) {
        headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMemberHeadCell" owner:self options:nil]lastObject];
    }
    return headCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MUScrollViewTableViewCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:@"scrollCell"];
        [scrollCell setArray:@[@"example_3",@"example_3"] frame:CGRectMake(0, 0, SCREENWIDTH, 165) adNum:1 pushView:self.navigationController];
        return scrollCell;
        
    }else
    {
        MUMemberContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
        if (contentCell == nil) {
            contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMemberContentCell" owner:self options:nil]lastObject];
        }
        return contentCell;
    }
}
@end
