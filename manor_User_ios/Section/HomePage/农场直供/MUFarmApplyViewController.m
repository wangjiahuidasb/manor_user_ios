//
//  MUFarmApplyViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/8.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFarmApplyViewController.h"
#import "MUFarmApplyTableViewCell.h"
#import "EScrollerView.h"
#import "MUScrollViewTableViewCell.h"
#import "MUFarmTypeTableViewCell.h"
#import "MUTabBarViewController.h"
#import "MUFarmDetailViewController.h"
#import "MUSeachViewController.h"
#import "MUFarmCategyCell.h"

#define BTN_WIDTH 65
#define BTN_HEIGHT 30
#define BTNCOLOR [UIColor colorWithRed:33/255.0f green:179/255.0f blue:18/255.0f alpha:1]
@interface MUFarmApplyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   
    MUTabBarViewController *tabBarView;
    NSString *selected;
    BOOL typeStatu;
    int slide_X;
    int slide_Y;
    
    NSArray *cateArray;
    NSArray *cateDetailArray;
    
    BOOL itemStatus;
   

    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITableView *categyTableView;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (strong, nonatomic) IBOutlet UIView *itemView;

//属性
@property (weak, nonatomic) IBOutlet UIView *searchView;
//cateView
@property (strong, nonatomic) IBOutlet UIView *blurView;


@end

@implementation MUFarmApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //tableView注册
    [_tableView registerClass:[MUScrollViewTableViewCell class] forCellReuseIdentifier:@"scrollCell"];
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
    
    //tabBarView
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
    
    ///计算边界
    slide_X = (SCREENWIDTH-4*BTN_WIDTH)/5;
    slide_Y = 10;
    
    //cateView
    _blurView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    [_blurView setFrame:CGRectMake(0, 0, SCREENWIDTH,SCREENHEIGHT)];
  

    cateArray = @[@"水果",@"蔬菜",@"水产",@"禽类",@"肉类",@"保健品"];
    cateDetailArray = @[@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6",@"测试7",@"测试8"];
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
    
    NSLog(@"type is ---%@",_type);
}


#pragma mark Custom
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
- (IBAction)searchTap:(id)sender {
    MUSeachViewController *searchVC = [[MUSeachViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
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
#pragma mark 分类View
- (IBAction)cancelFuntion:(id)sender {
    _blurView.hidden = YES;
    selected = @"";
    typeStatu = NO;
    [_tableView reloadData];

}

- (IBAction)sureFunction:(id)sender {
    _blurView.hidden = YES;
    selected = @"";
    typeStatu = NO;
    [_tableView reloadData];

    
}

- (void)pickViewShow
{
    _blurView.hidden = NO;
    [self.navigationController.view addSubview:_blurView];
}

#pragma mark 分类cell的btn
- (void)typeBtnFunction
{
    if (typeStatu ==NO) {
        selected = @"分类";
        typeStatu = YES;
        [_tableView reloadData];
    }else
    {
        selected = @"";
        typeStatu = NO;
        [_tableView reloadData];
    }
    
}

- (void)priceBtnFunction
{
    typeStatu =NO;
    selected = @"价格";
    [_tableView reloadData];
}

- (void)salesBtnFunction
{
    typeStatu =NO;
    selected = @"销量";
    [_tableView reloadData];
}

- (void)categoryBtnFunction:(UIButton *)button
{
    NSLog(@"button tag is---%ld",(long)button.tag);
}
#pragma mark tableView 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _tableView)
    {
        return 2;
        
    }else if (tableView == _categyTableView)
    {
        //分类table
        return 1;
    }else
    {
        //详情table
        return 1;
    }
    
   
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _tableView)
    {
        if (section ==0) {
            return 1;
        }else
        {
            return 6;
        }
    }else if (tableView == _categyTableView)
    {
        //分类table
        return 5;
    }else
    {
        //详情table
        return 5;
    }
    
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _tableView)
    {
        if(section ==0)
        {
            return 0.01;
        }else
        {
            return 58;
        }
        
    }else
    {
        //详情table
        return 0.01;
    }
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView)
    {
        if (indexPath.section ==0)
        {
            return 165;
        }
        else
        {
            return 122;
        }
        
    }else
    {
        
        return 21;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    MUFarmTypeTableViewCell *farmTypeCell = [tableView dequeueReusableCellWithIdentifier:@"farmTypeCell"];
    if (farmTypeCell ==nil) {
        farmTypeCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFarmTypeTableViewCell" owner:self options:nil]lastObject];
    }
    [farmTypeCell.typeBtn addTarget:self action:@selector(typeBtnFunction) forControlEvents:UIControlEventTouchUpInside];
    [farmTypeCell.priceBtn addTarget:self action:@selector(priceBtnFunction) forControlEvents:UIControlEventTouchUpInside];
    [farmTypeCell.salesBtn addTarget:self action:@selector(salesBtnFunction) forControlEvents:UIControlEventTouchUpInside];
    
    if ([selected isEqualToString:@"分类"]) {
        
        [farmTypeCell.typeBtn setSelected:YES];
        [farmTypeCell.priceBtn setSelected:NO];
        [farmTypeCell.salesBtn setSelected:NO];
        [self pickViewShow];
        
    }else if ([selected isEqualToString:@"价格"]) {
        
        [farmTypeCell.typeBtn setSelected:NO];
        [farmTypeCell.priceBtn setSelected:YES];
        [farmTypeCell.salesBtn setSelected:NO];
        
    }else if ([selected isEqualToString:@"销量"])
    {
        
        [farmTypeCell.typeBtn setSelected:NO];
        [farmTypeCell.priceBtn setSelected:NO];
        [farmTypeCell.salesBtn setSelected:YES];
    }else if ([selected isEqualToString:@""])
    {
        [farmTypeCell.typeBtn setSelected:NO];
        [farmTypeCell.priceBtn setSelected:NO];
        [farmTypeCell.salesBtn setSelected:NO];
       
    }
    
    return farmTypeCell;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView)
    {
        if(indexPath.section ==0)
        {
            MUScrollViewTableViewCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:@"scrollCell"];
            [scrollCell setArray:@[@"example_3",@"example_3"] frame:CGRectMake(0, 0, SCREENWIDTH, 165) adNum:1 pushView:self.navigationController];
            return scrollCell;
        }
        else
        {
            MUFarmApplyTableViewCell *farmCell = [tableView dequeueReusableCellWithIdentifier:@"farmCell"];
            if (farmCell ==nil) {
                farmCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFarmApplyTableViewCell" owner:self options:nil]lastObject];
            }
            return farmCell;
        }

        
    }else if (tableView == _categyTableView)
    {
        //分类table
        MUFarmCategyCell *cateCell = [tableView dequeueReusableCellWithIdentifier:@"cateCell"];
        if (cateCell == nil) {
            cateCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFarmCategyCell" owner:self options:nil]lastObject];
        }
        return cateCell;
        
    }else
    {
        //详情table
        MUFarmCategyCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"cateCell"];
        if (detailCell == nil) {
            detailCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFarmCategyCell" owner:self options:nil]lastObject];
        }
        detailCell.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0];
        detailCell.selectionStyle = UITableViewCellSelectionStyleBlue;
        detailCell.titleLabel.text = @"包子";
        return detailCell;
    }
    
    
    
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView)
    {
        if (indexPath.section==1) {
            MUFarmDetailViewController *farmDetailVC = [[MUFarmDetailViewController alloc]init];
            [self.navigationController pushViewController:farmDetailVC animated:YES];
        }
        
    }else if (tableView == _categyTableView)
    {
        //分类table
        
    }else
    {
        //详情table
    }
    
    
    
    
    
    
    
}



@end
