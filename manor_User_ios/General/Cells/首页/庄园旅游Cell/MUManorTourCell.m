//
//  MUManorTourCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUManorTourCell.h"

#define BORDER_COLOR [UIColor colorWithRed:96/255.0f green:210/255.0f blue:131/255.0f alpha:1.0]
@implementation MUManorTourCell

- (void)awakeFromNib {
    // Initialization code
    _tourImg.layer.cornerRadius = 4.0f;
    _tourImg.layer.masksToBounds = YES;
    
    _locationView.layer.cornerRadius = 10.0f;
    _locationView.layer.masksToBounds = YES;
    _locationView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.7];
    
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
