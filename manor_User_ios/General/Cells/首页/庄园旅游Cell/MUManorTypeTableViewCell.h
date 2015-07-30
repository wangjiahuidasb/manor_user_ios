//
//  MUManorTypeTableViewCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUManorTypeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *borderView;
@property (weak, nonatomic) IBOutlet UIButton *featureBtn;
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
@property (weak, nonatomic) IBOutlet UIButton *distanceBtn;

@end
