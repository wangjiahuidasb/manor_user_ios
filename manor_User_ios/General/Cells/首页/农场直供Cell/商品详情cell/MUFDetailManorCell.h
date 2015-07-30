//
//  MUFDetailManorCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/9.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUFDetailManorCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *manorImg;
@property (weak, nonatomic) IBOutlet UIView *manorView;
@property (weak, nonatomic) IBOutlet UILabel *manorName;
@property (weak, nonatomic) IBOutlet UILabel *countComment;
@property (weak, nonatomic) IBOutlet UIButton *careBtn;
@property (weak, nonatomic) IBOutlet UIButton *goManorBtn;
@property (weak, nonatomic) IBOutlet UIButton *starBtn1;
@property (weak, nonatomic) IBOutlet UIButton *starBtn2;
@property (weak, nonatomic) IBOutlet UIButton *starBtn3;
@property (weak, nonatomic) IBOutlet UIButton *starBtn4;
@property (weak, nonatomic) IBOutlet UIButton *starBtn5;
@property (weak, nonatomic) IBOutlet UILabel *starScore;

- (void)setSelectedStar:(int)num;
@end
