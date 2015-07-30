//
//  MUCouponTableViewCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/29.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUCouponTableViewCell.h"

@implementation MUCouponTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _borderView.layer.cornerRadius = 15.0f;
    _borderView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _borderView.layer.borderWidth = 1.0;
    _borderView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
