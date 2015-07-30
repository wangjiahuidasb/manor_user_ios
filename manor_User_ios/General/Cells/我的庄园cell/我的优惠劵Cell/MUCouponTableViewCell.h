//
//  MUCouponTableViewCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/29.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUCouponTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *borderView;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *limit;
@property (weak, nonatomic) IBOutlet UILabel *useRange;
@property (weak, nonatomic) IBOutlet UILabel *overTime;

@end
