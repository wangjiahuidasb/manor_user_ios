//
//  MUSecKillViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUSecKillViewController.h"
#import "MUSecKillHeadCell.h"
#import "MUSecKillContentCell.h"
#import "MUFDetailCommentsCell.h"
#import "MUFDetailManorCell.h"
#import "MUCommentViewController.h"

@interface MUSecKillViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@end

@implementation MUSecKillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"商品详情";
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    dataArray = @[@"可骄傲和SD卡就阿訇多好好看电话卡还得靠哈的哦八十多和卡号的卡号考得好卡号的卡号看等哈看电话卡和的卡号的",@"阿克苏建档立卡就倒垃圾啊时间段辣椒SD卡哈坎DHA考得好卡号的 阿卡华盛顿卡号考得好卡号的卡U盾拉拉的哈卡号的卡号的卡号的卡号考得好可活动求我饿uoqeuoqwu饿哦去我饿哦去和卡号吧出卡机店里啊ueohaasdasdasdjlajksd辣椒"];
    
    [_tableView registerClass:[MUFDetailCommentsCell class] forCellReuseIdentifier:@"commentCell"];
}

#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushToDetailVC

{
    
}
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
        return 289;
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
        MUSecKillHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"head"];
        if (headCell ==nil) {
            headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUSecKillHeadCell" owner:self options:nil]lastObject];
        }
        return headCell;
    }else if (indexPath.row==1)
    {
        MUSecKillContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"content"];
        if (contentCell ==nil) {
            contentCell = [[[NSBundle mainBundle]loadNibNamed:@"MUSecKillContentCell" owner:self options:nil]lastObject];
        }
        UITapGestureRecognizer *detailTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToDetailVC)];
        contentCell.detailView.userInteractionEnabled = YES;
        [contentCell.detailView addGestureRecognizer:detailTap];
        
    
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
