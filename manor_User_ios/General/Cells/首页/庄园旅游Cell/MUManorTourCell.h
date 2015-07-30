//
//  MUManorTourCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/15.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUManorTourCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tourImg;
@property (weak, nonatomic) IBOutlet UIView *locationView;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *manorName;
@property (weak, nonatomic) IBOutlet UILabel *note1;
@property (weak, nonatomic) IBOutlet UILabel *note2;
@property (weak, nonatomic) IBOutlet UILabel *note3;
@property (weak, nonatomic) IBOutlet UILabel *note4;

@end
