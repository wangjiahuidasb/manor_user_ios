//
//  MUMDetailHeadCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/16.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMDetailHeadCell.h"

#define BORDER_COLOR [UIColor colorWithRed:96/255.0f green:210/255.0f blue:131/255.0f alpha:1.0]
@implementation MUMDetailHeadCell

- (void)awakeFromNib {
    // Initialization code

    _note1.layer.cornerRadius = 4.0f;
    _note1.layer.masksToBounds = YES;
    _note1.layer.borderColor = BORDER_COLOR.CGColor;
    _note1.layer.borderWidth = 1.0f;
    
    _note2.layer.cornerRadius = 4.0f;
    _note2.layer.masksToBounds = YES;
    _note2.layer.borderColor = BORDER_COLOR.CGColor;
    _note2.layer.borderWidth = 1.0f;
    
    _note3.layer.cornerRadius = 4.0f;
    _note3.layer.masksToBounds = YES;
    _note3.layer.borderColor = BORDER_COLOR.CGColor;
    _note3.layer.borderWidth = 1.0f;
    
    _note4.layer.cornerRadius = 4.0f;
    _note4.layer.masksToBounds = YES;
    _note4.layer.borderColor = BORDER_COLOR.CGColor;
    _note4.layer.borderWidth = 1.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
