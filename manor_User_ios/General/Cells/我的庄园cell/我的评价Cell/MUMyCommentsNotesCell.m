//
//  MUMyCommentsNotesCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUMyCommentsNotesCell.h"

@implementation MUMyCommentsNotesCell

- (void)awakeFromNib {
    // Initialization code
    _textView.layer.cornerRadius = 4.0f;
    _textView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _textView.layer.borderWidth = 1.0f;
    _textView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSelectedStar:(int)num
{
    switch (num) {
        case 0:
            [_star_1 setSelected:NO];
            [_star_2 setSelected:NO];
            [_star_3 setSelected:NO];
            [_star_4 setSelected:NO];
            [_star_5 setSelected:NO];
            
            break;
        case 1:
            [_star_1 setSelected:YES];
            [_star_2 setSelected:NO];
            [_star_3 setSelected:NO];
            [_star_4 setSelected:NO];
            [_star_5 setSelected:NO];
            break;
        case 2:
            [_star_1 setSelected:YES];
            [_star_2 setSelected:YES];
            [_star_3 setSelected:NO];
            [_star_4 setSelected:NO];
            [_star_5 setSelected:NO];
            break;
        case 3:
            [_star_1 setSelected:YES];
            [_star_2 setSelected:YES];
            [_star_3 setSelected:YES];
            [_star_4 setSelected:NO];
            [_star_5 setSelected:NO];
            break;
        case 4:
            [_star_1 setSelected:YES];
            [_star_2 setSelected:YES];
            [_star_3 setSelected:YES];
            [_star_4 setSelected:YES];
            [_star_5 setSelected:NO];
            break;
        case 5:
            [_star_1 setSelected:YES];
            [_star_2 setSelected:YES];
            [_star_3 setSelected:YES];
            [_star_4 setSelected:YES];
            [_star_5 setSelected:YES];
            break;
        default:
            break;
    }
}

@end
