//
//  MUMyManorViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/5/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMyManorViewController.h"
#import "MUEditInfoViewController.h"
#import "MUTabBarViewController.h"
#import "MUCouponViewController.h"
#import "MUMyOrderListViewController.h"
#import "MUPublicCommentsViewController.h"
#import "MUMyCareViewController.h"
#import "MUMyTourViewController.h"
#import "MUMyAddressViewController.h"
#import "MUAboutUsViewController.h"

@interface MUMyManorViewController ()
{
    MUTabBarViewController *tabBarView;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

//属性
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;

@end

@implementation MUMyManorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的庄园";
    
   
    [self drawRect];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewShow];
}

- (void)viewDidAppear:(BOOL)animated
{
    _scrollView.contentSize = CGSizeMake(SCREENWIDTH, 754);
}

#pragma mark 常用方法
- (void)drawRect
{
    _headImg.layer.cornerRadius = 75/2.0f;
    _headImg.layer.borderColor = [UIColor whiteColor].CGColor;
    _headImg.layer.borderWidth = 2.0;
    _headImg.layer.masksToBounds = YES;
    
    _loginBtn.layer.cornerRadius = 4.0f;
    _loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _loginBtn.layer.borderWidth = 1.0;
    
    _registerBtn.layer.cornerRadius = 4.0f;
    _registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _registerBtn.layer.borderWidth = 1.0;
    _userName.hidden = YES;
    _editBtn.hidden = NO;
}

#pragma mark 按钮
- (IBAction)infoEditBtnFunction:(id)sender {
    MUEditInfoViewController *editInfoVC = [[MUEditInfoViewController alloc]init];
    [self.navigationController pushViewController:editInfoVC animated:YES];
}

#pragma mark tap方法
- (IBAction)orderTap:(id)sender {
    MUMyOrderListViewController *orderListVC = [[MUMyOrderListViewController alloc]init];
    [self.navigationController pushViewController:orderListVC animated:YES];
}
- (IBAction)addressTap:(id)sender {
//    MUPublicCommentsViewController *myCommentsVC = [[MUPublicCommentsViewController alloc]init];
//    [self.navigationController pushViewController:myCommentsVC animated:YES];
    MUMyAddressViewController *myAddress = [[MUMyAddressViewController alloc]init];
    [self.navigationController pushViewController:myAddress animated:YES];
}


- (IBAction)couponTap:(id)sender {
    MUCouponViewController *couponVC = [[MUCouponViewController alloc]init];
   [self.navigationController pushViewController:couponVC animated:YES];
}
- (IBAction)careTap:(id)sender {
    MUMyCareViewController *myCareVC = [[MUMyCareViewController alloc]init];
    [self.navigationController pushViewController:myCareVC animated:YES];
}
- (IBAction)travelTap:(id)sender {
    MUMyTourViewController *myTourVC = [[MUMyTourViewController alloc]init];
    [self.navigationController pushViewController:myTourVC animated:YES];
}
- (IBAction)aboutUsTap:(id)sender {
    MUAboutUsViewController *aboutUsVC = [[MUAboutUsViewController alloc]init];
    [self.navigationController pushViewController:aboutUsVC animated:YES];
}

@end
