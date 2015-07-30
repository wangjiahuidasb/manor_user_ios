//
//  MUNewAddressViewController.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/13.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUNewAddressViewController.h"

@interface MUNewAddressViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UITextField *streetTextField;
@property (weak, nonatomic) IBOutlet UITextField *postcodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@end

@implementation MUNewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"新增收货地址";
    
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

@end
