//
//  MUMemberContentCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/24.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMemberContentCell.h"

@implementation MUMemberContentCell

- (void)awakeFromNib {
    // Initialization code
    _headImg.layer.cornerRadius = 21.0f;
    _headImg.layer.masksToBounds = YES;
    _bkgImg.layer.cornerRadius = 4.0f;
    _bkgImg.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
