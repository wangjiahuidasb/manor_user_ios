//
//  MUSecKillContentCell.h
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUSecKillContentCell : UITableViewCell
{
    int sum;
}
//nameView
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UILabel *goodsInfo;

//priceView
@property (weak, nonatomic) IBOutlet UILabel *manorPrice;
@property (weak, nonatomic) IBOutlet UILabel *orgPrice;
@property (weak, nonatomic) IBOutlet UILabel *deliverPrice;
@property (weak, nonatomic) IBOutlet UILabel *salesCount;
@property (weak, nonatomic) IBOutlet UIButton *discountBtn;


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
