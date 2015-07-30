//
//  MUCarContentCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUCarContentCell.h"

@implementation MUCarContentCell

- (void)awakeFromNib {
    // Initialization code
    _btnView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _btnView.layer.borderWidth = 1.0;
    
    _headImg.layer.cornerRadius = 4.0f;
    _overBtn.hidden = YES;
    _overLabel.hidden = YES;
    sum =1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)reduceButton:(id)sender {
    if (sum>1) {
        sum--;
        _count.text = [NSString stringWithFormat:@"%d",sum];
    }
}

- (IBAction)addButton:(id)sender {
    if (sum<99) {
        sum++;
        _count.text = [NSString stringWithFormat:@"%d",sum];
    }
    
}
@end
