//
//  MUManorTypeTableViewCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUManorTypeTableViewCell.h"

#define BKGCOLOR [UIColor colorWithRed:33/255.0f green:179/255.0f blue:18/255.0f alpha:1]
#define TEXTCOLOR [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1]
@implementation MUManorTypeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _borderView.layer.cornerRadius = 8.0f;
    _borderView.layer.borderColor = BKGCOLOR.CGColor;
    _borderView.layer.borderWidth = 1.0f;
    _borderView.layer.masksToBounds = YES;
    
    _featureBtn.layer.masksToBounds = YES;
    _distanceBtn.layer.masksToBounds = YES;
    
    [_featureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_featureBtn setImage:[UIImage imageNamed:@"arrowUp"] forState:UIControlStateSelected];
    [_featureBtn setBackgroundImage:[UIImage imageNamed:@"navColor"] forState:UIControlStateSelected];
    
    [_locationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_locationBtn setImage:[UIImage imageNamed:@"arrowUp"] forState:UIControlStateSelected];
    [_locationBtn setBackgroundImage:[UIImage imageNamed:@"navColor"] forState:UIControlStateSelected];
    
    [_distanceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_distanceBtn setBackgroundImage:[UIImage imageNamed:@"navColor"] forState:UIControlStateSelected];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
