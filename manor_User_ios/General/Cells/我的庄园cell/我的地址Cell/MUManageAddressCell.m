//
//  MUManageAddressCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/13.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUManageAddressCell.h"

@implementation MUManageAddressCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setData:(BOOL) status
{
    if (status == YES) {
        _defaultLabel.hidden = NO;
        _addressLabel.frame = CGRectMake(51, 40, SCREENWIDTH-62, 15);
    }else
    {
        _defaultLabel.hidden = YES;
        _addressLabel.frame = CGRectMake(12, 40, SCREENWIDTH-24, 15);
    }
    
}
@end
