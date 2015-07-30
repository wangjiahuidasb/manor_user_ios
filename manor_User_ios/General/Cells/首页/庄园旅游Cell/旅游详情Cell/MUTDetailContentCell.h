//
//  MUTDetailContentCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUTDetailContentCell : UITableViewCell
{
    int sum;
}

//nameView
@property (weak, nonatomic) IBOutlet UILabel *tourName;
@property (weak, nonatomic) IBOutlet UILabel *tourInfo;

//priceView
@property (weak, nonatomic) IBOutlet UILabel *manorPrice;
@property (weak, nonatomic) IBOutlet UILabel *orgPrice;
@property (weak, nonatomic) IBOutlet UIButton *discountBtn;
//featureView
@property (weak, nonatomic) IBOutlet UIView *featureView;
@property (weak, nonatomic) IBOutlet UILabel *featureLabel_1;
@property (weak, nonatomic) IBOutlet UILabel *featureLabel_2;
@property (weak, nonatomic) IBOutlet UILabel *featureLabel_3;

//dateView
@property (weak, nonatomic) IBOutlet UIView *dateView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


//numView
@property (weak, nonatomic) IBOutlet UIView *borderBtnView;
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

//detailView
@property (weak, nonatomic) IBOutlet UIView *detailView;

//commentView
@property (weak, nonatomic) IBOutlet UIView *commentView;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@end
