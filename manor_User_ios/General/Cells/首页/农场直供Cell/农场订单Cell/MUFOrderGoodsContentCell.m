//
//  MUFOrderGoodsContentCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/12.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFOrderGoodsContentCell.h"

@implementation MUFOrderGoodsContentCell

- (void)awakeFromNib {
    // Initialization code
    sum  =1;
    
    _goodsImg.layer.cornerRadius = 2.0f;
    _goodsImg.layer.masksToBounds = YES;
    _numView.layer.borderWidth = 1.0f;
    _numView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)reduceButtonFunction:(id)sender {
    if (sum>1) {
        sum--;
        _goodsCount.text = [NSString stringWithFormat:@"%d",sum];
    }
    
    
}
- (IBAction)addButtonFunction:(id)sender {
    if (sum<99) {
        sum++;
        _goodsCount.text = [NSString stringWithFormat:@"%d",sum];
    }
}
@end
