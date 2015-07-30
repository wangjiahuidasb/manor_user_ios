//
//  MUMyCommentsNotesCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUMyCommentsNotesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UIButton *star_1;
@property (weak, nonatomic) IBOutlet UIButton *star_2;
@property (weak, nonatomic) IBOutlet UIButton *star_3;
@property (weak, nonatomic) IBOutlet UIButton *star_4;
@property (weak, nonatomic) IBOutlet UIButton *star_5;


- (void)setSelectedStar:(int)num;
@end
