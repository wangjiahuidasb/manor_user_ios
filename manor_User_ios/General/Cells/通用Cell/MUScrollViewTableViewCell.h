//
//  MUScrollViewTableViewCell.h
//  manor_User_ios
//
//  Created by MR.L on 15/6/8.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EScrollerView.h"

@interface MUScrollViewTableViewCell : UITableViewCell<EScrollerViewDelegate>
{
    UINavigationController *nav;
}

@property (nonatomic,strong) EScrollerView *scrollView;

- (void)setArray:(NSArray *)array frame:(CGRect) frame adNum:(int) num pushView:(UINavigationController *)Nav;
@end
























