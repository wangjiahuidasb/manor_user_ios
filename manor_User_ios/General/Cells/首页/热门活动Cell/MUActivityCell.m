//
//  MUActivityCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUActivityCell.h"

@implementation MUActivityCell

- (void)awakeFromNib {
    // Initialization code
    _headImg.layer.cornerRadius = 4.0f;
    _containView.layer.cornerRadius = 15.0f;
    _containView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.7];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
