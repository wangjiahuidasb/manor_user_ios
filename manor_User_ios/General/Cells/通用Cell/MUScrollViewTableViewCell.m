//
//  MUScrollViewTableViewCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/8.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUScrollViewTableViewCell.h"

@implementation MUScrollViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0]];
        
        
        //        _scrollView = [[EScrollerView alloc]init];
        //
        //        [self.contentView addSubview:_scrollView];
        
    }
    return self;
}

- (void)setArray:(NSArray *)array frame:(CGRect) frame adNum:(int) num pushView:(UINavigationController *)Nav
{
    nav = Nav;
    _scrollView = [[EScrollerView alloc]initWithFrameRect:frame ImageArray:array];
    _scrollView.delegate = self;
    [self.contentView addSubview:_scrollView];
  
    
}


#pragma mark EScrollView 代理
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"点击的下标是--%lu",(unsigned long)index);
    
}

@end
