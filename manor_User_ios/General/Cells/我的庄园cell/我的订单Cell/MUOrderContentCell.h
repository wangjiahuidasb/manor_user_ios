//
//  MUOrderContentCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUOrderContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *goodsImg;
@property (weak, nonatomic) IBOutlet UILabel *goodsTitle;
@property (weak, nonatomic) IBOutlet UILabel *goodsMoney;
@property (weak, nonatomic) IBOutlet UILabel *date_pack;
@property (weak, nonatomic) IBOutlet UILabel *expenseCode;
@property (weak, nonatomic) IBOutlet UILabel *refundNote;

@property (weak, nonatomic) IBOutlet UIView *lineView;
@end
