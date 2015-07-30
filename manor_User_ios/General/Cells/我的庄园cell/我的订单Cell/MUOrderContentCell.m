//
//  MUOrderContentCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUOrderContentCell.h"

@implementation MUOrderContentCell

- (void)awakeFromNib {
    // Initialization code
    _goodsImg.layer.cornerRadius = 4.0f;
    _goodsImg.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
