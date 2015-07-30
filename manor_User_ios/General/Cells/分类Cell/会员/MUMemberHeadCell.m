//
//  MUMemberHeadCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/24.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMemberHeadCell.h"

@implementation MUMemberHeadCell

- (void)awakeFromNib {
    // Initialization code
    _btnView.layer.cornerRadius = 8.0f;
    _btnView.layer.borderWidth = 1.0f;
    _btnView.layer.masksToBounds = YES;
    _btnView.layer.borderColor = [UIColor colorWithRed:33/255.0f green:179/255.0f blue:78/255.0f alpha:1.0].CGColor;
    [_tuijianBtn setSelected:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
