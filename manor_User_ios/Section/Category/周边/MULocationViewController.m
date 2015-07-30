//
//  MULocationViewController.m
//  manor_User_ios
//
//  Created by Apple on 15/7/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MULocationViewController.h"
#import "MUTabBarViewController.h"

@interface MULocationViewController ()
{
    MUTabBarViewController *tabBarView;
}

@end

@implementation MULocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"周边";
    
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
}

#pragma mark 常用方法
- (void)back 
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
