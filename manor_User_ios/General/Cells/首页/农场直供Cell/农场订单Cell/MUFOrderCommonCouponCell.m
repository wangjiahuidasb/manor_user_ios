//
//  MUFOrderCommonCouponCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/12.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFOrderCommonCouponCell.h"

#define BKGCOLOR [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0]

@implementation MUFOrderCommonCouponCell

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
//        [self.contentView setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0]];
        _selectArray = [NSMutableArray array];
        _commonCouponCellNum = 2;
        int table_height = 110+40*_commonCouponCellNum;

        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(12, 10, SCREENWIDTH-24, table_height)];
        _tableView.layer.cornerRadius = 4.0f;
        _tableView.layer.borderColor = [UIColor colorWithRed:221/255.0f green:221/255.0f blue:221/255.0f alpha:1.0].CGColor;
//        _tableView.layer.borderColor = [UIColor redColor].CGColor;
        _tableView.layer.borderWidth = 1.0;
        _tableView.scrollEnabled = NO;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"headCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"bottomCell"];
        [self.contentView addSubview:_tableView];

        
    }
    return self;
}


#pragma mark tableView 代理


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2+_commonCouponCellNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 40;
    }else if(indexPath.row>0&&indexPath.row<=_commonCouponCellNum)
    {
        return 40;
        
    }else
    {
        return 70;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row is---%ld",(long)indexPath.row);
    
    if (indexPath.row==0) {
        UITableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
        headCell.backgroundColor = BKGCOLOR;
        [headCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        _useCoupon = [[UILabel alloc]initWithFrame:CGRectMake(10, 13,100, 15)];
        _useCoupon.font = [UIFont systemFontOfSize:14.0];
        _useCoupon.text = @"使用优惠劵";
        _useCoupon.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0];
        [headCell.contentView addSubview:_useCoupon];
        return headCell;
    }else if(indexPath.row>0&&indexPath.row<=_commonCouponCellNum)
    {
        
                    //优惠劵cell
        MUFOrderCouponCell *FOCouponCell = [tableView dequeueReusableCellWithIdentifier:@"FOCouponCell"];
        
        if (FOCouponCell==nil) {
            FOCouponCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderCouponCell" owner:self options:nil]lastObject];
            FOCouponCell.backgroundColor = BKGCOLOR;
        }
        if (_selectArray.count !=0) {
            if ([_selectArray containsObject:[NSNumber numberWithInteger:indexPath.row]])
            {
                 [FOCouponCell couponSelected];
            }else
            {
                [FOCouponCell couponUnSelected];
            }
           
            
        }else
        {
            [FOCouponCell couponUnSelected];
        }

        return FOCouponCell;
        
        
        
    }else
    {
        UITableViewCell *bottomCell = [tableView dequeueReusableCellWithIdentifier:@"bottomCell"];
        bottomCell.backgroundColor = BKGCOLOR;
        [bottomCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        _CouponNoteHead = [[UILabel alloc]initWithFrame:CGRectMake(10, 15,100, 15)];
        _CouponNoteHead.font = [UIFont systemFontOfSize:14.0];
        _CouponNoteHead.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0];
        _CouponNoteHead.text = @"满送活动";
        [bottomCell.contentView addSubview:_CouponNoteHead];
        
        _CouponNote = [[UILabel alloc]initWithFrame:CGRectMake(10,40,100, 15)];
        _CouponNote.font = [UIFont systemFontOfSize:12.0];
        _CouponNote.textColor = [UIColor colorWithRed:254/255.0f green:199/255.0f blue:103/255.0f alpha:1.0];
        _CouponNote.text = _note;
        [bottomCell.contentView addSubview:_CouponNote];
        return bottomCell;
    }
}

- (int)setIntroductionFrame
{
    
    
    CGRect frame = [self frame];
    frame.size.height = CGRectGetMaxY(_tableView.frame) + 20;
    self.frame = frame;
    return CGRectGetMaxY(_tableView.frame) + 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row>0&&indexPath.row<=_commonCouponCellNum)
    {
        if([_selectArray containsObject:[NSNumber numberWithInteger:indexPath.row]])
        {
            [_selectArray removeAllObjects];
        }else
        {
            [_selectArray removeAllObjects];
            [_selectArray addObject:[NSNumber numberWithInteger:indexPath.row]];
        }
    }
    [_tableView reloadData];
}
@end
