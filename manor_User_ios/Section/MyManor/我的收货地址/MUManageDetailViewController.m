//
//  MUManageDetailViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/14.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUManageDetailViewController.h"

@interface MUManageDetailViewController ()





@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *postcodeTextField;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UITextField *streetTextField;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
@end

@implementation MUManageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"收货地址管理";
    
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    _saveBtn.layer.cornerRadius = 4.0f;
}



#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)saveFunction:(id)sender {
}
- (IBAction)cancelFunction:(id)sender {
}
- (IBAction)defaultFunction:(id)sender {
    if (_defaultBtn.selected) {
        [_defaultBtn setSelected:NO];
    }else
    {
        [_defaultBtn setSelected:YES];
    }
}


@end
