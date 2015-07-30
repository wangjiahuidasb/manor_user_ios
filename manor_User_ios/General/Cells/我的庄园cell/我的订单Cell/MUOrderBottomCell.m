//
//  MUOrderBottomCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUOrderBottomCell.h"

@implementation MUOrderBottomCell

- (void)awakeFromNib {
    // Initialization code
    _colorBtn.layer.cornerRadius = 4.0f;
    _commentBtn.layer.cornerRadius = 4.0f;
    _commentBtn.hidden =YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
