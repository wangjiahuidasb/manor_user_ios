//
//  MUFarmDetailViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/9.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFarmDetailViewController.h"
#import "MUFDetailHeadImgCell.h"
#import "MUFDetailContentCell.h"
#import "MUFDetailManorCell.h"
#import "Tools.h"
#import "MUFDetailCommentsCell.h"
#import "MUFarmOrderViewController.h"
#import "MUCommentViewController.h"
#import "MUTabBarViewController.h"

#define BORDER_COLOR [UIColor colorWithRed:33/255.0f green:179/255.0f blue:68/255.0f alpha:1.0]
@interface MUFarmDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MUTabBarViewController *tabBarView;
    NSArray *dataArray;
    int num;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *itemView;
@property (weak, nonatomic) IBOutlet UIButton *shopCartBtn;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
//包装View
@property (strong, nonatomic) IBOutlet UIView *packView;
@property (weak, nonatomic) IBOutlet UIButton *typeBtn1;
@property (weak, nonatomic) IBOutlet UIButton *typeBtn2;
@property (weak, nonatomic) IBOutlet UIView *numBtnView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *count;

@end

@implementation MUFarmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"商品详情";
    num =1;
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    UIButton *shopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shopButton setBackgroundImage:[UIImage imageNamed:@"navShop"] forState:UIControlStateNormal];
    [shopButton addTarget:self action:@selector(shopBtn) forControlEvents:UIControlEventTouchUpInside];
    [shopButton setFrame:CGRectMake(255, 0, 25, 25)];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc]initWithCustomView:shopButton];
    
    UIButton *itemBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBarButton setImage:[UIImage imageNamed:@"item"] forState:UIControlStateNormal];
    [itemBarButton addTarget:self action:@selector(itemBtn) forControlEvents:UIControlEventTouchUpInside];
    [itemBarButton setFrame:CGRectMake(285, 0, 25, 25)];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithCustomView:itemBarButton];
    
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.backgroundColor = [UIColor clearColor];
    [clearBtn setFrame:CGRectMake(0, 0, 5, 25)];
    UIBarButtonItem *clearBar = [[UIBarButtonItem alloc]initWithCustomView:clearBtn];
    
    [self.navigationItem setRightBarButtonItems:@[right2,clearBar,right1]];
    [self drawRadius];
    
    [_tableView registerClass:[MUFDetailCommentsCell class] forCellReuseIdentifier:@"commentCell"];
    
    dataArray = @[@"可骄傲和SD卡就阿訇多好好看电话卡还得靠哈的哦八十多和卡号的卡号考得好卡号的卡号看等哈看电话卡和的卡号的",@"阿克苏建档立卡就倒垃圾啊时间段辣椒SD卡哈坎DHA考得好卡号的 阿卡华盛顿卡号考得好卡号的卡U盾拉拉的哈卡号的卡号的卡号的卡号考得好可活动求我饿uoqeuoqwu饿哦去我饿哦去和卡号吧出卡机店里啊ueohaasdasdasdjlajksd辣椒"];
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
    //tabBarView
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
    
}

#pragma mark Custom
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)shopBtn
{
    
}
- (void)itemBtn
{
    BOOL itemStatus;
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



- (IBAction)buyButtonFunction:(id)sender {
    MUFarmOrderViewController *farmOrderVC = [[MUFarmOrderViewController alloc]init];
    [self.navigationController pushViewController:farmOrderVC animated:YES];
}

- (IBAction)addShopCartButton:(id)sender {
}

- (void)drawRadius
{
    _shopCartBtn.layer.cornerRadius = 4.0f;
    _buyBtn.layer.cornerRadius = 4.0f;
    _typeBtn1.layer.cornerRadius = 2.0f;
    _typeBtn2.layer.cornerRadius = 2.0f;
    _typeBtn2.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _typeBtn2.layer.borderWidth = 1.0f;
    
    _cancelBtn.layer.cornerRadius = 4.0f;
    _sureBtn.layer.cornerRadius = 4.0f;
    _numBtnView.layer.borderWidth = 1.0f;
    _numBtnView.layer.borderColor = BORDER_COLOR.CGColor;
    _packView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    [_packView setFrame:CGRectMake(0, 0, SCREENWIDTH,SCREENHEIGHT)];
}

#pragma mark 评价View
- (void)commentFunction
{
    MUCommentViewController *commentVC = [[MUCommentViewController alloc]init];
    [self.navigationController pushViewController:commentVC animated:YES];
}
#pragma mark 包装View
- (void)pushToDetailVC
{
    NSLog(@"1111");
}
- (void)packTypeChooseFunction
{
    _packView.hidden = NO;
    [self.navigationController.view addSubview:_packView];
}


- (IBAction)dissMissPackTypeView:(id)sender {
    [_packView setHidden:YES];
}
- (IBAction)reduceButton:(id)sender {
    if (num>1) {
        num--;
        _count.text = [NSString stringWithFormat:@"%d",num];
    }
}
- (IBAction)addButton:(id)sender {
    if (num<99) {
        num++;
        _count.text = [NSString stringWithFormat:@"%d",num];
    }
}
#pragma mark tableView 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 165;
        
    }else if (indexPath.row==1)
    {
        return 337;
    }else if (indexPath.row>1&&indexPath.row<4)
    {
        UITableViewCell *cell =[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }else
    {
        return 210;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        MUFDetailHeadImgCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"FDHeadCell"];
        if (headCell ==nil) {
            headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFDetailHeadImgCell" owner:self options:nil]lastObject];
        }
        [headCell setSelectedStar:3];
        return headCell;
    }else if (indexPath.row==1)
    {
        MUFDetailContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"FDContentCell"];
        if (contentCell ==nil) {
            contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFDetailContentCell" owner:self options:nil]lastObject];
        }
        UITapGestureRecognizer *detailTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToDetailVC)];
        contentCell.detailView.userInteractionEnabled = YES;
        [contentCell.detailView addGestureRecognizer:detailTap];
        
        UITapGestureRecognizer *packTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(packTypeChooseFunction)];
        contentCell.packView.userInteractionEnabled = YES;
        [contentCell.packView addGestureRecognizer:packTap];
        
        UITapGestureRecognizer *commentTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(commentFunction)];
        contentCell.commentView.userInteractionEnabled = YES;
        [contentCell.commentView addGestureRecognizer:commentTap];
        
        return contentCell;
    }else if (indexPath.row>1&&indexPath.row<4)
    {
        MUFDetailCommentsCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
        [commentCell setIntroductionText:dataArray[indexPath.row-2]];
        [commentCell setSelectedStar:4];
        return commentCell;
    }else
    {
        MUFDetailManorCell *manorCell = [tableView dequeueReusableCellWithIdentifier:@"FDManorCell"];
        if (manorCell ==nil) {
            manorCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFDetailManorCell" owner:self options:nil]lastObject];
        }
        [manorCell setSelectedStar:4];
        return manorCell;
    }
}
@end
