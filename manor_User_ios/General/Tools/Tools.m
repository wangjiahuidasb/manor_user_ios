//
//  Tools.m
//  manor_User_ios
//
//  Created by MR.L on 15/5/27.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+ (UIBarButtonItem *)getNavBarItem:(id)delegate
                       clickAction:(SEL)clickAction
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0,0,25,25);
    [btn setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [btn addTarget:delegate action:clickAction forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *navBarBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return navBarBtn;
}

+ (void)getNavBarColor:(UINavigationBar *)navBar
{
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, SCREENWIDTH, 20)];
    statusBarView.backgroundColor=[UIColor colorWithRed:43/255.0f green:164/255.0f blue:64/255.0f alpha:1];
    [navBar addSubview:statusBarView];
}

+ (void)setStar:(UIView *)view selectedNum:(int )num
{
    UIButton * starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    for (int i=0; i<5; i++) {
        
        starBtn.frame = CGRectMake(17*i, 0, 14, 14);
        starBtn.tag = 400+i;
        [starBtn setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
        [starBtn setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
        [view addSubview:starBtn];
    }
    for (int i=0; i<num; i++) {
        if (starBtn.tag-400<num) {
            [starBtn setSelected:YES];
        }
    }

}
@end
