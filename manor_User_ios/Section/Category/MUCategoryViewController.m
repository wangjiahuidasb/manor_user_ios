//
//  MUCategoryViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/5/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUCategoryViewController.h"
#import "MUMemberViewController.h"
#import "MUTabBarViewController.h"

#define VIEWWIDTH SCREENWIDTH-75
#define BTNWIDTH (SCREENWIDTH >320 ? 65 : 50)


@interface MUCategoryViewController ()
{
    MUTabBarViewController *tabBarView;
    NSArray *btn1Array;
    NSArray *btn2Array;
    NSArray *btn3Array;
 
}
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UIView *zchouView;
@property (weak, nonatomic) IBOutlet UIView *farmView;
@property (weak, nonatomic) IBOutlet UIView *travelView;
@property (weak, nonatomic) IBOutlet UIView *memberView;


@end

@implementation MUCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"分类";
    
    
    NSLog(@"btnWidth---%d",BTNWIDTH);
    
    btn1Array = @[@"蔬菜水果",@"肉蛋禽类",@"粮油副食",@"鱼虾水产",@"酒水茶饮",@"其他"];
    btn2Array = @[@"特卖活动",@"招募活动",@"进行中"];
    btn3Array = @[@"旅游攻略",@"周边"];
    
    
    
    [self typeFunction:3 view:_searchView array:btn2Array selectView:1];
    [self typeFunction:6 view:_zchouView array:btn1Array selectView:2];
    [self typeFunction:6 view:_farmView array:btn1Array selectView:3];
    [self typeFunction:6 view:_travelView array:btn1Array selectView:4];
    [self typeFunction:2 view:_memberView array:btn3Array selectView:5];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"2");
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewShow];
}


#pragma mark 分类点击
- (void)typeFunction:(int) num view:(UIView *)view array:(NSArray *)array selectView:(int) selectedNum
{
    int BTNHEIGHT;
    int slide_y;
    if (num<4) {
        BTNHEIGHT = 30;
        slide_y = 23;
    }else
    {
        BTNHEIGHT = 20;
        slide_y = 12;
    }
    for (int i=0; i<num; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        if ( i <4) {
            button.frame = CGRectMake(12+i*(BTNWIDTH+8), slide_y, BTNWIDTH, BTNHEIGHT);
            
        }else
        {
            button.frame = CGRectMake(12+(i-4)*(BTNWIDTH+8), slide_y+28, BTNWIDTH, BTNHEIGHT);
        
        }

        switch (selectedNum) {
            case 1:
                button.tag = 100+i;
                break;
            case 2:
                button.tag = 200+i;
                break;
            case 3:
                button.tag = 300+i;
                break;
            case 4:
                button.tag = 400+i;
                break;
            case 5:
                button.tag = 500+i;
                break;
                
            default:
                break;
        }
        
        
        [button setTitle:array[i] forState:UIControlStateNormal];
       
        button.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [button setTitleColor:[UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(categoryBtnFunction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
    }
}

- (void)categoryBtnFunction:(UIButton *)button
{
    
    NSLog(@"点击的标签是---%ld",(long)button.tag);
    
    switch (button.tag /100) {
        case 1:
            NSLog(@"搜获季");
            break;
        case 2:
            NSLog(@"庄园众筹");
            break;
        case 3:
            NSLog(@"农场直供");
            break;
        case 4:
            NSLog(@"旅游路线");
            break;
        case 5:
        {
            NSLog(@"会员社区");
            MUMemberViewController  *memberVC = [[MUMemberViewController alloc]init];
            [self.navigationController pushViewController:memberVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
