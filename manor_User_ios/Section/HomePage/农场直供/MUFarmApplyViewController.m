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

#define BTN_WIDTH 65
#define BTN_HEIGHT 30
#define BTNCOLOR [UIColor colorWithRed:33/255.0f green:179/255.0f blue:18/255.0f alpha:1]
@interface MUFarmApplyViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
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
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (strong, nonatomic) IBOutlet UIView *itemView;

//属性
@property (weak, nonatomic) IBOutlet UIView *searchView;
//cateView
@property (strong, nonatomic) IBOutlet UIView *blurView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

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
    _pickView.dataSource = self;
    _pickView.delegate = self;
   
   [_pickView selectRow:cateArray.count/2 inComponent:1 animated:YES];
    [_pickView selectRow:4 inComponent:0 animated:YES];

    cateArray = @[@"水果",@"蔬菜",@"水产",@"禽类",@"肉类",@"保健品"];
    cateDetailArray = @[@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6",@"测试7",@"测试8"];
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
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
   
    return 2;
   
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }else
    {
        return 6;
    }
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 0.01;
    }else
    {
        return 58;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0)
    {
        return 165;
    }
    else
    {
        return 122;
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
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        MUFarmDetailViewController *farmDetailVC = [[MUFarmDetailViewController alloc]init];
        [self.navigationController pushViewController:farmDetailVC animated:YES];
    }
    
    
}


#pragma mark 实现协议UIPickerViewDelegate方法

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component ==0) {
        return cateArray.count;
    }else
    {
        return cateDetailArray.count;
    }
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        
        return [cateArray objectAtIndex:row];
    }else
    {
        return [cateDetailArray objectAtIndex:row];
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        
        NSLog(@"proID is%@",[cateArray objectAtIndex:row]);

        [_pickView selectRow:cateArray.count/2 inComponent:1 animated:YES];
        [_pickView reloadComponent:1];
        
    }else
    {
       
        NSLog(@"areaID is%@",[cateDetailArray objectAtIndex:row]);
    }
    
}


@end
