//
//  MUFarmTypeTableViewCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/8.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUFarmTypeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *containView;

@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UIButton *salesBtn;

@end
