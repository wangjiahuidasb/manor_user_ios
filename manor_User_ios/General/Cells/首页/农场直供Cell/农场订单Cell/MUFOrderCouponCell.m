//
//  MUFOrderCouponCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/11.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFOrderCouponCell.h"

@implementation MUFOrderCouponCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)couponSelected
{
    _statusImg.image = [UIImage imageNamed:@"couponLight"];
}

- (void)couponUnSelected
{
    _statusImg.image = [UIImage imageNamed:@"couponGray"];
}
@end
