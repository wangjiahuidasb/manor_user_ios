//
//  MUFOrderCommonCouponCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/12.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MUFOrderCouponCell.h"

@interface MUFOrderCommonCouponCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UILabel *useCoupon;
@property (strong, nonatomic) UILabel *CouponNoteHead;
@property (strong, nonatomic) UILabel *CouponNote;

@property (nonatomic) int commonCouponCellNum;
@property (strong, nonatomic) NSString *note;
@property (strong,nonatomic) NSMutableArray *selectArray;

- (int)setIntroductionFrame;
@end
