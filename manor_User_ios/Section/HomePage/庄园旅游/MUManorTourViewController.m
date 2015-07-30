//
//  MUManorTourViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUManorTourViewController.h"
#import "MUTabBarViewController.h"
#import "MUScrollViewTableViewCell.h"
#import "MUManorTypeTableViewCell.h"
#import "MUManorTourHeadCell.h"
#import "MUManorTourCell.h"
#import "MUManorTourDetailViewController.h"
#import "MUSeachViewController.h"

@interface MUManorTourViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    MUTabBarViewController *tabBarView;
    NSString *selected;
    BOOL typeFeature;
    BOOL typeLocation;
    
    NSArray *proArray;
    NSArray *cityArray;
    NSArray *areaArray;
    
    BOOL itemStatus;
   

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (strong, nonatomic) IBOutlet UIView *itemView;

//属性
@property (weak, nonatomic) IBOutlet UIView *searchView;
//区域View
@property (strong, nonatomic) IBOutlet UIView *blurView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@end

@implementation MUManorTourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
    
    //区域View
    _blurView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    [_blurView setFrame:CGRectMake(0, 0, SCREENWIDTH,SCREENHEIGHT)];
    _pickView.dataSource = self;
    _pickView.delegate = self;
    proArray = @[@"北京",@"湖南",@"湖北",@"贵州",@"河南",@"广州"];
    cityArray = @[@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6",@"测试7",@"测试8"];
    areaArray = @[@"area测试1",@"area测试2",@"area测试3",@"area测试4",@"area测试5",@"area测试6"];
    
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

#pragma mark 区域
- (IBAction)cancelFunction:(id)sender {
    _blurView.hidden = YES;
    selected = @"";
    typeLocation = NO;
    [_tableView reloadData];
}
- (IBAction)sureFunction:(id)sender {
    _blurView.hidden = YES;
    selected = @"";
    typeLocation = NO;
    [_tableView reloadData];
}

- (void)pickViewShow
{
    _blurView.hidden = NO;
    [self.navigationController.view addSubview:_blurView];
}
#pragma mark 分类cell的btn
- (void)featureBtnFunction
{
    typeLocation = NO;
    if (typeFeature ==NO) {
        selected = @"特色";
        typeFeature = YES;
        [_tableView reloadData];
    }else
    {
        selected = @"";
        typeFeature = NO;
        [_tableView reloadData];
    }
    
}

- (void)locationBtnFunction
{
    typeFeature =NO;
    if (typeLocation ==NO) {
        selected = @"区域";
        typeLocation = YES;
        [_tableView reloadData];
    }else
    {
        selected = @"";
        typeLocation = NO;
        [_tableView reloadData];
    }
    
}

- (void)distanceBtnFunction
{
    typeFeature =NO;
    typeLocation= NO;
    selected = @"距离";
    [_tableView reloadData];
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
        if(indexPath.row ==0)
        {
            return 20;
        }else
        {
           return 240;
        }
        
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    MUManorTypeTableViewCell *manorTypeCell = [tableView dequeueReusableCellWithIdentifier:@"manorTypeCell"];
    if (manorTypeCell ==nil) {
        manorTypeCell = [[[NSBundle mainBundle]loadNibNamed:@"MUManorTypeTableViewCell" owner:self options:nil]lastObject];
    }
    
    [manorTypeCell.featureBtn addTarget:self action:@selector(featureBtnFunction) forControlEvents:UIControlEventTouchUpInside];
    [manorTypeCell.locationBtn addTarget:self action:@selector(locationBtnFunction) forControlEvents:UIControlEventTouchUpInside];
    [manorTypeCell.distanceBtn addTarget:self action:@selector(distanceBtnFunction) forControlEvents:UIControlEventTouchUpInside];
    
    if ([selected isEqualToString:@"特色"]) {
        
        [manorTypeCell.featureBtn setSelected:YES];
        [manorTypeCell.locationBtn setSelected:NO];
        [manorTypeCell.distanceBtn setSelected:NO];
        
        
    }else if ([selected isEqualToString:@"区域"]) {
        
        [manorTypeCell.featureBtn setSelected:NO];
        [manorTypeCell.locationBtn setSelected:YES];
        [manorTypeCell.distanceBtn setSelected:NO];
        [self  pickViewShow];
        
    }else if ([selected isEqualToString:@"距离"])
    {
        
        [manorTypeCell.featureBtn setSelected:NO];
        [manorTypeCell.locationBtn setSelected:NO];
        [manorTypeCell.distanceBtn setSelected:YES];
    }else if ([selected isEqualToString:@""])
    {
        [manorTypeCell.featureBtn setSelected:NO];
        [manorTypeCell.locationBtn setSelected:NO];
        [manorTypeCell.distanceBtn setSelected:NO];
        
    }
    
    return manorTypeCell;
    
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
        if (indexPath.row == 0) {
            MUManorTourHeadCell *manorTourHeadCell = [tableView dequeueReusableCellWithIdentifier:@"manorTourHeadCell"];
            if (manorTourHeadCell ==nil) {
                manorTourHeadCell = [[[NSBundle mainBundle]loadNibNamed:@"MUManorTourHeadCell" owner:self options:nil]lastObject];
            }
            return manorTourHeadCell;
        }else
        {
            MUManorTourCell *manorTourCell = [tableView dequeueReusableCellWithIdentifier:@"manorTourCell"];
            if (manorTourCell ==nil) {
                manorTourCell = [[[NSBundle mainBundle]loadNibNamed:@"MUManorTourCell" owner:self options:nil]lastObject];
            }
            return manorTourCell;
        }
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        MUManorTourDetailViewController *tourDetailVC = [[MUManorTourDetailViewController alloc]init];
        [self.navigationController pushViewController:tourDetailVC animated:YES];
    }
    
    
}

#pragma mark 实现协议UIPickerViewDelegate方法

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component ==0) {
        return proArray.count;
    }else if (component ==1)
    {
        return cityArray.count;
    }else
    {
        return areaArray.count;
    }
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        
        return [proArray objectAtIndex:row];
    }else if (component ==1)
    {
        return [cityArray objectAtIndex:row];
    }else
    {
        return [areaArray objectAtIndex:row];
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        
        NSLog(@"proID is%@",[proArray objectAtIndex:row]);
        
        [_pickView selectRow:0 inComponent:1 animated:YES];
        [_pickView reloadComponent:1];
        
    }else if (component ==1)
    {
        [_pickView selectRow:0 inComponent:2 animated:YES];
        [_pickView reloadComponent:2];
        NSLog(@"cityID is%@",[cityArray objectAtIndex:row]);
    }else
    {
        NSLog(@"areaID is%@",[areaArray objectAtIndex:row]);
    }
    
}

@end
