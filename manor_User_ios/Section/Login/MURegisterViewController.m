//
//  MURegisterViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MURegisterViewController.h"

@interface MURegisterViewController ()
{
    BOOL status;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UIView *pwdView;
@property (weak, nonatomic) IBOutlet UIView *surePwdView;


@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *surePwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *protocolBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@end

@implementation MURegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"注册";
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    [self drawlayer];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (SCREENHEIGHT == 480) {
        _scrollView.contentSize = CGSizeMake(SCREENWIDTH, 530);
    }
}
#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)drawlayer
{
    _phoneView.layer.cornerRadius = 4.0f;
    _codeView.layer.cornerRadius = 4.0f;
    _pwdView.layer.cornerRadius = 4.0f;
    _surePwdView.layer.cornerRadius = 4.0f;
    
    _registerBtn.layer.cornerRadius = 15.0f;
    _codeBtn.layer.cornerRadius = 4.0f;
    
    [_phoneTextField setValue:[UIColor colorWithRed:104/255.0f green:200/255.0f blue:134/255.0f alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [_codeTextField setValue:[UIColor colorWithRed:104/255.0f green:200/255.0f blue:134/255.0f alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [_pwdTextField setValue:[UIColor colorWithRed:104/255.0f green:200/255.0f blue:134/255.0f alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [_surePwdTextField setValue:[UIColor colorWithRed:104/255.0f green:200/255.0f blue:134/255.0f alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    
}
- (IBAction)codeFunction:(id)sender {
}
- (IBAction)registerFunction:(id)sender {
}
- (IBAction)protocalFunction:(id)sender {
    if (status == NO) {
        [_codeBtn setSelected:YES];
        status = YES;
    }else
    {
        [_codeBtn setSelected:NO];
        status = NO;
    }
    
}
- (IBAction)goLoginVC:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
