//
//  MUForgetPwdViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUForgetPwdViewController.h"

@interface MUForgetPwdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *surePwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@end

@implementation MUForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"忘记密码";
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    [self drawlayer];

}


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navColor"] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)drawlayer
{
    _sureBtn.layer.cornerRadius = 4.0f;
    _codeBtn.layer.cornerRadius = 4.0f;
    
}
- (IBAction)commitFunction:(id)sender {
}
@end
