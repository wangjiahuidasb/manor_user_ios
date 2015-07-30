//
//  MUSecKillHeadCell.h
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUSecKillHeadCell : UITableViewCell<UIScrollViewDelegate>
{
    BOOL state;
    int pageNum;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *careBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIView *blurView;
@property (nonatomic,strong) NSArray *imageArray;
@end
