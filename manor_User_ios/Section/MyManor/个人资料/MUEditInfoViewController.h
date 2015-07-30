//
//  MUEditInfoViewController.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUEditInfoViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
//昵称View
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
//性别View
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
//生日View
@property (weak, nonatomic) IBOutlet UILabel *bornLabel;
//学历View
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;
//职业View
@property (weak, nonatomic) IBOutlet UILabel *professionLabel;
//所在地View
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
//邮箱View
@property (weak, nonatomic) IBOutlet UITextField *emailLabel;
//电话号码View
@property (weak, nonatomic) IBOutlet UITextField *phoneLabel;


//pick
@property (strong, nonatomic) IBOutlet UIView *blurView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UIView *containView;


@end
