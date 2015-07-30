//
//  MUAboutUsViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUAboutUsViewController.h"
#import "MUTabBarViewController.h"

@interface MUAboutUsViewController ()
{
    MUTabBarViewController *tabBarView;
}

@end

@implementation MUAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"关于我们";
    self.navigationItem.leftBarButtonItem = [Tools  getNavBarItem:self clickAction:@selector(back)];
    
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
}

#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
