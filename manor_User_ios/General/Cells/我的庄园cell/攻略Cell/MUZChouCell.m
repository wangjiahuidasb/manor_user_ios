//
//  MUZChouCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/10.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUZChouCell.h"

@implementation MUZChouCell

- (void)awakeFromNib {
    // Initialization code
    _headImg.layer.cornerRadius = 4.0f;
    _headImg.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
