 //
//  MULoginViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/14.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MULoginViewController.h"
#import "MUHomePageViewController.h"
#import "MUCategoryViewController.h"
#import "MUShopCartViewController.h"
#import "MUMyManorViewController.h"
#import "MUTabBarViewController.h"
#import "MURegisterViewController.h"
#import "MUForgetPwdViewController.h"



@interface MULoginViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *nameView;
@property (weak, nonatomic) IBOutlet UIView *pwdView;


@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation MULoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    
    
    UIButton *registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    registButton.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
    [registButton setFrame:CGRectMake(0, 0,40, 25)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:registButton];
    [self.navigationItem setRightBarButtonItem:right];
    
    _loginBtn.layer.cornerRadius = 15.0f;
    _nameView.layer.cornerRadius = 4.0f;
    _pwdView.layer.cornerRadius = 4.0f;
}


- (void)viewWillAppear:(BOOL)animated
{
   
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"transparent_nav"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//   self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidAppear:(BOOL)animated
{
    if (SCREENHEIGHT == 480) {
        _scrollView.contentSize = CGSizeMake(SCREENWIDTH, 530);
    }
    

}
- (void)viewDidDisappear:(BOOL)animated
{
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navColor"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.hidden = NO;
    
}
#pragma mark 常用方法
- (void)registerBtn
{
    MURegisterViewController *registerVC = [[MURegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
- (IBAction)loginFunction:(id)sender {
    MUHomePageViewController *homePageVC = [[MUHomePageViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:homePageVC];
    
    
    
    MUCategoryViewController *categoryVC = [[MUCategoryViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:categoryVC];
    
    
    MUShopCartViewController *shopCartVC = [[MUShopCartViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:shopCartVC];
    
    
    MUMyManorViewController *myManorVC = [[MUMyManorViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:myManorVC];
    
    MUTabBarViewController *tabBarVC = [[MUTabBarViewController alloc] initWithViewController:@[nav1,nav2,nav3,nav4]];
    
    [self presentViewController:tabBarVC animated:YES completion:nil];
}
- (IBAction)forgetPwdFunction:(id)sender {
    MUForgetPwdViewController *forgetPwdVC = [[MUForgetPwdViewController alloc]init];
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
}

- (IBAction)QQLogin:(id)sender {
}
- (IBAction)sinaLogin:(id)sender {
}

@end
