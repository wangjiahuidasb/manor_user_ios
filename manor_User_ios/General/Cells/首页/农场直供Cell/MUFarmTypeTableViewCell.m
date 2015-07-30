//
//  MUFarmTypeTableViewCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/8.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFarmTypeTableViewCell.h"

#define BKGCOLOR [UIColor colorWithRed:33/255.0f green:179/255.0f blue:18/255.0f alpha:1]
#define TEXTCOLOR [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1]
@implementation MUFarmTypeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _containView.layer.cornerRadius = 8.0f;
    _containView.layer.borderColor = BKGCOLOR.CGColor;
    _containView.layer.borderWidth = 1.0f;
    _containView.layer.masksToBounds = YES;
    
    _salesBtn.layer.masksToBounds = YES;
    _typeBtn.layer.masksToBounds = YES;
    
    [_typeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_typeBtn setImage:[UIImage imageNamed:@"arrowUp"] forState:UIControlStateSelected];
    [_typeBtn setBackgroundImage:[UIImage imageNamed:@"navColor"] forState:UIControlStateSelected];
   
    [_priceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_priceBtn setBackgroundImage:[UIImage imageNamed:@"navColor"] forState:UIControlStateSelected];
    
    [_salesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_salesBtn setBackgroundImage:[UIImage imageNamed:@"navColor"] forState:UIControlStateSelected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
