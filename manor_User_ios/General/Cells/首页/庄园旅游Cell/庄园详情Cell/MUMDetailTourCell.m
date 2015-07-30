//
//  MUMDetailTourCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/16.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMDetailTourCell.h"

@implementation MUMDetailTourCell

- (void)awakeFromNib {
    // Initialization code
    _bkgImg.layer.cornerRadius = 4.0f;
    _bkgImg.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
