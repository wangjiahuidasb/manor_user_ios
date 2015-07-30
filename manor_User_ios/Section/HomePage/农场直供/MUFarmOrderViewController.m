//
//  MUFarmOrderViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/11.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFarmOrderViewController.h"
#import "Tools.h"
#import "MUFOrderAddressCell.h"
#import "MUFOrderGoodsContentCell.h"
#import "MUFOrderDeliverNoteCell.h"
#import "MUFOrderCouponHeadCell.h"
#import "MUFOrderCouponCell.h"
#import "MUFOrderCouponNoteCell.h"
#import "MUFOrderDeliverFeeCell.h"
#import "MUFOrderSumCell.h"
#import "MUFOrderGoodsHeadCell.h"
#import "MUFOrderCommonCouponCell.h"

@interface MUFarmOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int goodsCellNum;//商品cell
    int deliverNoteNum;//配送说明
    int couponHeadNum;//优惠劵head
    int couponCellNum;//优惠劵cell
    int couponNoteNum;//满送提示
    int deliverFeeNum;//运费
    
    int commonCouponCellNum;//通用优惠劵
    int commonCouponNoteNum;//通用优惠劵
    NSMutableArray *selectArray;
}
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MUFarmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"订单填写";
    selectArray = [NSMutableArray array];
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    [_tableView registerClass:[MUFOrderCommonCouponCell class] forCellReuseIdentifier:@"commonCouponCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"headCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"bottomCell"];
    [self drawRadius];
}

#pragma mark Custom
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)drawRadius
{
    _commitBtn.layer.cornerRadius = 4.0f;
    goodsCellNum = 2;//商品cell
    deliverNoteNum = 1;//配送说明
    couponHeadNum = 0;//优惠劵head
    couponCellNum = 3 ;//优惠劵cell
    couponNoteNum = 0;//满送提示
    deliverFeeNum = 1;//运费
    
 
}

#pragma mark tableView代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(section==0)
    {
        return 1;
    }else if(section == 1)
    {
        return 2+goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum+couponNoteNum+deliverFeeNum ;
    }else
    {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 84;
    }else if(indexPath.section==1)
    {
//        return 40+125+98;
        if(indexPath.row == 0)
        {
            //商品title
            return 40;
            
        }else if(indexPath.row >0&&indexPath.row<=goodsCellNum)
        {
            //商品cell
            return 125;
        }else if(indexPath.row == goodsCellNum+deliverNoteNum)
        {
            //配送说明
            return 29*deliverNoteNum;
        }else if(indexPath.row ==  goodsCellNum+deliverNoteNum+couponHeadNum)
        {
            //优惠劵head
            return 55*couponHeadNum;
        }else if(indexPath.row >(goodsCellNum+deliverNoteNum+couponHeadNum)&&indexPath.row<=(goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum))
        {
            //优惠劵cell
            return 40;
        }else if(indexPath.row== goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum+couponNoteNum)
        {
            //满送提示
            return 40*couponNoteNum;
        }else if(indexPath.row == goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum+couponNoteNum+deliverFeeNum)
        {
            //运费
            return 40*deliverFeeNum;
        }else
        {
            //结算和留言
            return 98;
        }
        
    }else
    {
        UITableViewCell *cell =[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        MUFOrderAddressCell *FOAddrCell = [tableView dequeueReusableCellWithIdentifier:@"FOAddrCell"];
        if (FOAddrCell==nil) {
            FOAddrCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderAddressCell" owner:self options:nil]lastObject];
        }
        return FOAddrCell;
    }else if(indexPath.section==1)
    {
        
        if(indexPath.row == 0)
        {
            //商品title
            MUFOrderGoodsHeadCell *FOGoodsHeadCell = [tableView dequeueReusableCellWithIdentifier:@"FOGoodsHeadCell"];
            if (FOGoodsHeadCell==nil) {
                FOGoodsHeadCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderGoodsHeadCell" owner:self options:nil]lastObject];
            }
            return FOGoodsHeadCell;
            
            
        }else if(indexPath.row >0&&indexPath.row<goodsCellNum+deliverNoteNum)
        {
            //商品cell
            MUFOrderGoodsContentCell *FOGoodsCell = [tableView dequeueReusableCellWithIdentifier:@"FOGoodsCell"];
            if (FOGoodsCell==nil) {
                FOGoodsCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderGoodsContentCell" owner:self options:nil]lastObject];
            }
            return FOGoodsCell;
        }else if(indexPath.row == goodsCellNum+deliverNoteNum)
        {
            //配送说明
            MUFOrderDeliverNoteCell *FODelieverNoteCell = [tableView dequeueReusableCellWithIdentifier:@"FODelieverNoteCell"];
            if (FODelieverNoteCell==nil) {
                FODelieverNoteCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderDeliverNoteCell" owner:self options:nil]lastObject];
            }
            return FODelieverNoteCell;
        }else if(indexPath.row == goodsCellNum+deliverNoteNum+couponHeadNum)
        {
            //优惠劵head
            MUFOrderCouponHeadCell *FOCouponHeadCell = [tableView dequeueReusableCellWithIdentifier:@"FOCouponHeadCell"];
            if (FOCouponHeadCell==nil) {
                FOCouponHeadCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderCouponHeadCell" owner:self options:nil]lastObject];
            }
            return FOCouponHeadCell;
        }else if(indexPath.row >(goodsCellNum+deliverNoteNum+couponHeadNum)&&indexPath.row<=(goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum))
        {
            //优惠劵cell
            MUFOrderCouponCell *FOCouponCell = [tableView dequeueReusableCellWithIdentifier:@"FOCouponCell"];
            if (FOCouponCell==nil) {
                FOCouponCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderCouponCell" owner:self options:nil]lastObject];
               
                
            }
            if (selectArray.count !=0) {
                if ([selectArray containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
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
        }else if(indexPath.row == goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum+couponNoteNum)
        {
            //满送提示
            MUFOrderCouponNoteCell *FOCouponNoteCell = [tableView dequeueReusableCellWithIdentifier:@"FOCouponNoteCell"];
            if (FOCouponNoteCell==nil) {
                FOCouponNoteCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderCouponNoteCell" owner:self options:nil]lastObject];
            }
            return FOCouponNoteCell;
        }else if(indexPath.row == goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum+couponNoteNum+deliverFeeNum)
        {
            //运费
            MUFOrderDeliverFeeCell *FODeliverFeeCell = [tableView dequeueReusableCellWithIdentifier:@"FODeliverFeeCell"];
            if (FODeliverFeeCell==nil) {
                FODeliverFeeCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderDeliverFeeCell" owner:self options:nil]lastObject];
            }
            return FODeliverFeeCell;
        }else
        {
            //结算和留言
            MUFOrderSumCell *FOSumCell = [tableView dequeueReusableCellWithIdentifier:@"FOSumCell"];
            if (FOSumCell==nil) {
                FOSumCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFOrderSumCell" owner:self options:nil]lastObject];
            }
            return FOSumCell;
        }
        
    }else
    {
        MUFOrderCommonCouponCell *commonCouponCell = [tableView dequeueReusableCellWithIdentifier:@"commonCouponCell"];
        commonCouponCell.note = @"满一百送货";
        [commonCouponCell setIntroductionFrame];
        return commonCouponCell;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        NSLog(@"index is --%ld",(long)indexPath.row);
        NSLog(@"reduce is---%d",goodsCellNum+deliverNoteNum+couponHeadNum);
        if(indexPath.row >(goodsCellNum+deliverNoteNum+couponHeadNum)&&indexPath.row<=(goodsCellNum+deliverNoteNum+couponHeadNum+couponCellNum))
        {
            
            if([selectArray containsObject:[NSNumber numberWithInteger:indexPath.row]])
            {
                [selectArray removeAllObjects];
            }else
            {
                [selectArray removeAllObjects];
                [selectArray addObject:[NSNumber numberWithInteger:indexPath.row]];
            }
           
        }
        
    }
         [_tableView reloadData];
}
@end
