//
//  MUFOrderCouponCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/11.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUFOrderCouponCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *addition;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *statusImg;

- (void)couponSelected;
- (void)couponUnSelected;
@end
