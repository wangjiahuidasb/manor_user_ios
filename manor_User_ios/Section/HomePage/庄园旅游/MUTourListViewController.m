//
//  MUTourListViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/16.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUTourListViewController.h"
#import "MUMDetailTourCell.h"
#import "MUTourDetailViewController.h"

#define SELECTEDCOLOR [UIColor colorWithRed:33/255.0f green:179/255.0f blue:78/255.0f alpha:1]
#define LINEWIDTH SCREENWIDTH/3
@interface MUTourListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *lineImg;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headView;
//headView
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UIButton *recommendBtn;
@end

@implementation MUTourListViewController

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
    
    [self drawButton];
    
    
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

- (void)drawButton
{
    [_detailBtn setTitleColor:SELECTEDCOLOR forState:UIControlStateSelected];
    
    [_orderBtn setTitleColor:SELECTEDCOLOR forState:UIControlStateSelected];
    
    [_recommendBtn setTitleColor:SELECTEDCOLOR forState:UIControlStateSelected];

    [_detailBtn setSelected:YES];
    lineImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, LINEWIDTH, 2)];
    lineImg.image = [UIImage imageNamed:@"line"];
    [_headView addSubview:lineImg];
    
}
- (IBAction)typeDetailFunction:(id)sender {
    [_detailBtn setSelected:YES];
    [_orderBtn setSelected:NO];
    [_recommendBtn setSelected:NO];
   
    lineImg.frame = CGRectMake(0, 43, LINEWIDTH, 2);
    
}
- (IBAction)typeOrderFunction:(id)sender {
    [_detailBtn setSelected:NO];
    [_orderBtn setSelected:YES];
    [_recommendBtn setSelected:NO];
    
    lineImg.frame = CGRectMake(LINEWIDTH, 43,LINEWIDTH, 2);
  
}
- (IBAction)typeRecommendFunction:(id)sender {
    [_detailBtn setSelected:NO];
    [_orderBtn setSelected:NO];
    [_recommendBtn setSelected:YES];

    lineImg.frame = CGRectMake(2*LINEWIDTH, 43,LINEWIDTH, 2);
   
}

- (IBAction)orderFunction:(id)sender {
}

#pragma mark tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MUMDetailTourCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourCell" owner:self options:nil]lastObject];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MUTourDetailViewController *tourDetailVC = [[MUTourDetailViewController alloc]init];
    [self.navigationController pushViewController:tourDetailVC animated:YES];
    
}
@end
