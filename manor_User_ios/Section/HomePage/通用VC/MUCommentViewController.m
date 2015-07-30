//
//  MUCommentViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/18.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUCommentViewController.h"
#import "MUFDetailCommentsCell.h"

@interface MUCommentViewController ()
{
    NSArray *dataArray;
    NSArray *indexArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MUCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"商品评价";
    
    
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setBackgroundImage:[UIImage imageNamed:@"navShare"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareBtn) forControlEvents:UIControlEventTouchUpInside];
    [shareButton setFrame:CGRectMake(255, 0, 25, 25)];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc]initWithCustomView:shareButton];
    
    UIButton *itemBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBarButton setImage:[UIImage imageNamed:@"item"] forState:UIControlStateNormal];
    [itemBarButton addTarget:self action:@selector(itemBtn) forControlEvents:UIControlEventTouchUpInside];
    [itemBarButton setFrame:CGRectMake(285, 0, 25, 25)];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithCustomView:itemBarButton];
    
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.backgroundColor = [UIColor clearColor];
    [clearBtn setFrame:CGRectMake(0, 0, 5, 25)];
    UIBarButtonItem *clearBar = [[UIBarButtonItem alloc]initWithCustomView:clearBtn];
    
    [self.navigationItem setRightBarButtonItems:@[right2,clearBar,right1]];
    
    dataArray = @[@"可骄傲和SD卡就阿訇多好好看电话卡还得靠哈的哦八十多和卡号的卡号考得好卡号的卡号看等哈看电话卡和的卡号的",@"阿克苏建档立卡就倒垃圾啊时间段辣椒SD卡哈坎DHA考得好卡号的 阿卡华盛顿卡号考得好卡号的卡U盾拉拉的哈卡号的卡号的卡号的卡号考得好可活动求我饿uoqeuoqwu饿哦去我饿哦去和卡号吧出卡机店里啊ueohaasdasdasdjlajksd辣椒"];
    indexArray = @[@"M",@"N",@"O",@"P",@"Q",@"W"];
    
    [_tableView registerClass:[MUFDetailCommentsCell class] forCellReuseIdentifier:@"commentCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"headCell"];
    

}

#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)shareBtn
{
    
}
- (void)itemBtn
{
    
}


#pragma mark tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 40;
    }else
    {
        UITableViewCell *cell =[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        UITableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, 100, 14)];
        title.font = [UIFont systemFontOfSize:14.0];
        title.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0];
        title.text = @"会员评价(32)";
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 39, SCREENWIDTH, 1)];
        lineView.backgroundColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1];
        
        [headCell addSubview:lineView];
        [headCell addSubview:title];
        return headCell;
    }else
    {
        
        MUFDetailCommentsCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
        [commentCell setIntroductionText:dataArray[indexPath.row-1]];
        
        [commentCell setSelectedStar:2];
        return commentCell;

    }
   
}




/*
#pragma mark - UITableViewSource method
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return indexArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    //传入 section title 和index 返回其应该对应的session序号。
    //一般不需要写 默认section index 顺序与section对应。除非 你的section index数量或者序列与section不同才用修改
    NSLog(@"index %ld",(long)index);
    return index;
    
}*/
@end
