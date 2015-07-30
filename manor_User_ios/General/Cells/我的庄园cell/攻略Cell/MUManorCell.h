//
//  MUManorCell.h
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/10.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUManorCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UILabel *note_1;
@property (weak, nonatomic) IBOutlet UILabel *note_2;
@property (weak, nonatomic) IBOutlet UILabel *note_3;
@end
