//
//  MUTDetailContentCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUTDetailContentCell.h"

#define BORDER_COLOR [UIColor colorWithRed:33/255.0f green:179/255.0f blue:78/255.0f alpha:1.0]
@implementation MUTDetailContentCell

- (void)awakeFromNib {
    // Initialization code
    _featureView.layer.cornerRadius = 4.0f;
    _featureView.layer.masksToBounds = YES;
    _featureView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _featureView.layer.borderWidth = 1.0f;
    
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
- (IBAction)reduceFunction:(id)sender {
    if (sum>1) {
        sum--;
        _num.text = [NSString stringWithFormat:@"%d",sum];
    }
    
}

- (IBAction)addFunction:(id)sender {
    if (sum<99) {
        sum++;
        _num.text = [NSString stringWithFormat:@"%d",sum];
    }
}
@end
