//
//  MUSecKillContentCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUSecKillContentCell.h"

#define BORDER_COLOR [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0]
@implementation MUSecKillContentCell

- (void)awakeFromNib {
    // Initialization code
    _borderBtnView.layer.borderColor = BORDER_COLOR.CGColor;
    _borderBtnView.layer.borderWidth = 1.0f;
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:_orgPrice.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, [_orgPrice.text length])];
    [_orgPrice setAttributedText:attri];
    [_orgPrice sizeToFit];
    sum =1;
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)reduceButton:(id)sender {
    if (sum>1) {
        sum--;
        _num.text = [NSString stringWithFormat:@"%d",sum];
    }
}

- (IBAction)addButton:(id)sender {
    if (sum<99) {
        sum++;
        _num.text = [NSString stringWithFormat:@"%d",sum];
    }
    
}
@end
