//
//  MUFDetailCommentsCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/9.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUFDetailCommentsCell : UITableViewCell
@property (nonatomic,strong) UIImageView *headerImg;
@property (nonatomic,strong) UILabel *phone;
@property (nonatomic,strong) UILabel *date;
@property (nonatomic,strong) UILabel *starScore;
@property (nonatomic,strong) UILabel *content;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIView *starBtnView;
@property (nonatomic,strong) UIButton *starBtn;

- (int)setIntroductionText:(NSString*)text;
- (void)setSelectedStar:(int) num;
@end
