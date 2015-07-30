//
//  MUTourOrderViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/18.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUTourOrderViewController.h"

@interface MUTourOrderViewController ()
@property (weak, nonatomic) IBOutlet UIView *dateView;
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UIView *btnView;

//属性
@property (weak, nonatomic) IBOutlet UILabel *tourName;
@property (weak, nonatomic) IBOutlet UILabel *tourPirce;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@end

@implementation MUTourOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"订单填写";
    //navBar
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    [self drawBorder];
}


#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)drawBorder
{
    _dateView.layer.borderColor = [UIColor colorWithRed:225/255.0f green:225/255.0f blue:225/255.0f alpha:1.0].CGColor;
    _dateView.layer.borderWidth = 2.0;
    
    
    _btnView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _btnView.layer.borderWidth = 1.0;

    
    _phoneView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _phoneView.layer.borderWidth = 1.0;
    
    _commitBtn.layer.cornerRadius = 4.0f;
    
}
#pragma mark numView
- (IBAction)reduceFunction:(id)sender {
}
- (IBAction)addFunction:(id)sender {
}

@end
