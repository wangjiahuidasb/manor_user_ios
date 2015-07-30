//
//  MUManageAddressCell.h
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/13.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUManageAddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *defaultLabel;

- (void)setData:(BOOL) status;
@end
