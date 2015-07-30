//
//  MUFDetailHeadImgCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/9.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUFDetailHeadImgCell : UITableViewCell<UIScrollViewDelegate>
{
    BOOL state;
    int pageNum;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *blurView;
@property (weak, nonatomic) IBOutlet UIButton *starBtn1;
@property (weak, nonatomic) IBOutlet UIButton *starBtn2;
@property (weak, nonatomic) IBOutlet UIButton *starBtn3;
@property (weak, nonatomic) IBOutlet UIButton *starBtn4;
@property (weak, nonatomic) IBOutlet UIButton *starBtn5;
@property (weak, nonatomic) IBOutlet UILabel *starScore;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;

@property (weak, nonatomic) IBOutlet UIButton *careBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (nonatomic,strong) NSArray *imageArray;

- (void)setSelectedStar:(int)num;
@end
