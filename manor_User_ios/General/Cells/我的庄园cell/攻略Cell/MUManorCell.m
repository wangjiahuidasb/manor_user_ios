//
//  MUManorCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/10.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUManorCell.h"

@implementation MUManorCell

- (void)awakeFromNib {
    // Initialization code
    _headImg.layer.cornerRadius = 4.0f;
    _headImg.layer.masksToBounds = YES;
    
    _note_1.layer.cornerRadius = 4.0f;
    _note_1.layer.borderColor = [UIColor colorWithRed:33/255.0f green:179/255.0f blue:78/255.0f alpha:1.0].CGColor;
    _note_1.layer.borderWidth = 1.0;
    _note_1.layer.masksToBounds = YES;
    
    _note_2.layer.cornerRadius = 4.0f;
    _note_2.layer.borderColor = [UIColor colorWithRed:33/255.0f green:179/255.0f blue:78/255.0f alpha:1.0].CGColor;
    _note_2.layer.borderWidth = 1.0;
    _note_2.layer.masksToBounds = YES;
    
    _note_3.layer.cornerRadius = 4.0f;
    _note_3.layer.borderColor = [UIColor colorWithRed:33/255.0f green:179/255.0f blue:78/255.0f alpha:1.0].CGColor;
    _note_3.layer.borderWidth = 1.0;
    _note_3.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
