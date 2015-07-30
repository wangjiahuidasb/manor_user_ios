//
//  MUPublicCommentsViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/30.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUPublicCommentsViewController.h"
#import "MUMyCommentsGoodsCell.h"
#import "MUMyCommentsNotesCell.h"

@interface MUPublicCommentsViewController ()
{
    int goodsCount;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation MUPublicCommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"发表评价";
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    goodsCount = 2;

}

#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1+goodsCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<goodsCount)
    {
        return 120;
    }else
    {
        return 216;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<goodsCount) {
        MUMyCommentsGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:@"commentGoods"];
        if (goodsCell == nil) {
            goodsCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMyCommentsGoodsCell" owner:self options:nil]lastObject];
        }
        return goodsCell;
    }else
    {
        MUMyCommentsNotesCell *notesCell = [tableView dequeueReusableCellWithIdentifier:@"commentNotes"];
        if (notesCell == nil) {
            notesCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMyCommentsNotesCell" owner:self options:nil]lastObject];
        }
        [notesCell setSelectedStar:4];
        return notesCell;
    }

}

@end
