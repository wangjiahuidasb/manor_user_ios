//
//  MUFDetailManorCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/9.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFDetailManorCell.h"

#define BORDER_COLOR [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0]
@implementation MUFDetailManorCell

- (void)awakeFromNib {
    // Initialization code
    _manorImg.layer.cornerRadius = 45;
    _manorImg.layer.masksToBounds = YES;
    
    _careBtn.layer.cornerRadius = 4.0f;
    _careBtn.layer.borderColor = BORDER_COLOR.CGColor;
    _careBtn.layer.borderWidth = 1.0f;
    
    _manorView.layer.borderWidth = 1.0f;
    _manorView.layer.borderColor = BORDER_COLOR.CGColor;
    
    _goManorBtn.layer.cornerRadius = 4.0f;
    _goManorBtn.layer.borderColor = BORDER_COLOR.CGColor;
    _goManorBtn.layer.borderWidth = 1.0f;
    
    [_starBtn1 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn2 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn3 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn4 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn5 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSelectedStar:(int)num
{
    switch (num) {
        case 0:
            [_starBtn1 setSelected:NO];
            [_starBtn2 setSelected:NO];
            [_starBtn3 setSelected:NO];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];

            break;
        case 1:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:NO];
            [_starBtn3 setSelected:NO];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];
            break;
        case 2:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:NO];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];
            break;
        case 3:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:YES];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];
            break;
        case 4:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:YES];
            [_starBtn4 setSelected:YES];
            [_starBtn5 setSelected:NO];
            break;
        case 5:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:YES];
            [_starBtn4 setSelected:YES];
            [_starBtn5 setSelected:YES];
            break;
        default:
            break;
    }
}
@end
