//
//  MUMyTourViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/13.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMyTourViewController.h"
#import "MUTabBarViewController.h"
#import "MUStrategyCell.h"

@interface MUMyTourViewController ()
{
    MUTabBarViewController *tabBarView;
    NSArray *dataArray;
    BOOL itemStatus;
}

@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (strong, nonatomic) IBOutlet UIView *cancelView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//删除属性
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

@implementation MUMyTourViewController

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
  
    
    
    _cancelView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _cancelView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _cancelView.hidden = YES;
    [self.navigationController.view addSubview:_cancelView];
    
    
    dataArray = @[@"1",@"2",@"3",@"4",@"5"];

    
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
    return dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MUStrategyCell *strategyCell = [tableView dequeueReusableCellWithIdentifier:@"strategy"];
    if (strategyCell == nil) {
        strategyCell = [[[NSBundle mainBundle]loadNibNamed:@"MUStrategyCell" owner:self options:nil]lastObject];
    }
    [strategyCell.cancelBtn addTarget:self action:@selector(cancelBtnFunction) forControlEvents:UIControlEventTouchUpInside];
    return strategyCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
}



@end
