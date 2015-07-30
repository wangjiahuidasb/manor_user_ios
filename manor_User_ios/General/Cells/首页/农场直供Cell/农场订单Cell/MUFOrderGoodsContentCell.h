//
//  MUFOrderGoodsContentCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/12.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUFOrderGoodsContentCell : UITableViewCell
{
    int sum;
}
@property (weak, nonatomic) IBOutlet UIImageView *goodsImg;
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UIView *numView;
@property (weak, nonatomic) IBOutlet UILabel *package;
@property (weak, nonatomic) IBOutlet UILabel *price;
//数量属性
@property (weak, nonatomic) IBOutlet UILabel *goodsCount;
@end
