//
//  MUFOrderAddressCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/11.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFOrderAddressCell.h"

@implementation MUFOrderAddressCell

- (void)awakeFromNib {
    // Initialization code
    _nonAddressView.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
