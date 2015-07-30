//
//  MUTourDetailViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUTourDetailViewController.h"
#import "MUFDetailHeadImgCell.h"
#import "MUTDetailContentCell.h"
#import "MUFDetailCommentsCell.h"
#import "MUFDetailManorCell.h"
#import "MUTourListViewController.h"
#import "MUTourOrderViewController.h"
#import "MUCommentViewController.h"

@interface MUTourDetailViewController ()<UITableViewDataSource,UITabBarDelegate>
{
    NSArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MUTourDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"商品详情";
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setBackgroundImage:[UIImage imageNamed:@"navShare"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareBtn) forControlEvents:UIControlEventTouchUpInside];
    [shareButton setFrame:CGRectMake(255, 0, 25, 25)];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc]initWithCustomView:shareButton];
    
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
    
    dataArray = @[@"可骄傲和SD卡就阿訇多好好看电话卡还得靠哈的哦八十多和卡号的卡号考得好卡号的卡号看等哈看电话卡和的卡号的",@"阿克苏建档立卡就倒垃圾啊时间段辣椒SD卡哈坎DHA考得好卡号的 阿卡华盛顿卡号考得好卡号的卡U盾拉拉的哈卡号的卡号的卡号的卡号考得好可活动求我饿uoqeuoqwu饿哦去我饿哦去和卡号吧出卡机店里啊ueohaasdasdasdjlajksd辣椒"];
    
    [_tableView registerClass:[MUFDetailCommentsCell class] forCellReuseIdentifier:@"commentCell"];
}


#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareBtn
{
    
}
- (void)itemBtn
{
    
}


- (void)pushToDetailVC
{
    MUTourListViewController *tourListVC = [[MUTourListViewController alloc]init];
    [self.navigationController pushViewController:tourListVC animated:YES];
    
}


- (IBAction)orderFunction:(id)sender {
    MUTourOrderViewController *tourOrderVC = [[MUTourOrderViewController alloc]init];
    [self.navigationController pushViewController:tourOrderVC animated:YES];
}
#pragma mark 价格日历View
- (void)datePriceFunction
{
    NSLog(@"价格日历");
}

#pragma mark 评价View
- (void)commentFunction
{
    MUCommentViewController *commentVC = [[MUCommentViewController alloc]init];
    [self.navigationController pushViewController:commentVC animated:YES];
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
        return 523;
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
        MUTDetailContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
        if (contentCell ==nil) {
            contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUTDetailContentCell" owner:self options:nil]lastObject];
        }
       
        UITapGestureRecognizer *detailTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToDetailVC)];
        contentCell.detailView.userInteractionEnabled = YES;
        [contentCell.detailView addGestureRecognizer:detailTap];
        
        UITapGestureRecognizer *packTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(datePriceFunction)];
        contentCell.dateView.userInteractionEnabled = YES;
        [contentCell.dateView addGestureRecognizer:packTap];
        
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
