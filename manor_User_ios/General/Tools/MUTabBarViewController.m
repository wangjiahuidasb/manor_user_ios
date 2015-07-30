//
//  MUTabBarViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/5/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUTabBarViewController.h"

#define TAB_BAR_VIEW_HEIGHT ([UIScreen mainScreen].bounds.size.width >= 768 ? 50 : 50)


@interface MUTabBarViewController ()
{
    NSArray * viewControllerArray;
    UIView * contentView;
   
    int tag;
    int index;
}

@end

@implementation MUTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (id)initWithViewController:(NSArray *)viewControllers
{
    if (self = [super init]) {
        tag = 400;
        index = 0;
        
        // reverseObjectEnumerator 倒序获取数组
        viewControllerArray = [[viewControllers reverseObjectEnumerator]allObjects];
        
        
        _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.bounds)-TAB_BAR_VIEW_HEIGHT, SCREENWIDTH, TAB_BAR_VIEW_HEIGHT)];
        UIImageView *bgimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, TAB_BAR_VIEW_HEIGHT)];
        bgimageView.image = [UIImage imageNamed:@"tabBarbg"];
        [_tabBarView addSubview:bgimageView];
        
        NSLog(@"bounds:%f",CGRectGetMaxY(self.view.bounds));
        
        [_tabBarView setBackgroundColor:[UIColor colorWithRed:232.0/255.0f green:232.0/255.0f blue:232.0/255.0f alpha:1.000]];
        
        
        if ([UIDevice currentDevice].systemVersion.intValue >= 7)
        {
            contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, CGRectGetHeight(self.view.bounds)-TAB_BAR_VIEW_HEIGHT)];
        }else{
            contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREENWIDTH, CGRectGetHeight(self.view.bounds)-TAB_BAR_VIEW_HEIGHT)];
        }
        
        
        
        
        
        
        
//        float buttonWith = SCREENWIDTH/viewControllerArray.count;
        
        
        
        NSArray *arrayBtnImage = @[@"home",@"cate",@"shopCar",@"myManor"];
        NSArray *arrayBtnHighLight = @[@"homeSelect",@"cateSelect",@"shopCarSelect",@"myManorSelect"];
        
        UIImage *imageSize = [UIImage imageNamed:@"home"];
        int imgHeight = imageSize.size.height;
        int imgWidth = imageSize.size.width;

        int slide_X= (SCREENWIDTH-4*imgWidth)/8;
        int slide_Y = (TAB_BAR_VIEW_HEIGHT-imgHeight)/2;
        NSLog(@"imgSize H is ---%d",imgHeight);
        NSLog(@"imgSize W is ---%d",imgWidth);
        
        NSLog(@"slide_X X is ---%d",slide_X);
        NSLog(@"slide_Y Y is ---%d",slide_Y);
        
        for (int i=0; i<viewControllerArray.count; i++) {
            UIButton * tabBarButton = [[UIButton alloc]initWithFrame:CGRectMake(slide_X+(imgWidth+slide_X*2)*i, slide_Y, imgWidth, imgHeight)];
            tabBarButton.tag = 400+i;
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [tabBarButton setBackgroundImage:[UIImage imageNamed:[arrayBtnImage objectAtIndex:i]] forState:UIControlStateNormal];
            [tabBarButton setBackgroundImage:[UIImage imageNamed:[arrayBtnHighLight objectAtIndex:i]] forState:UIControlStateSelected];
            
            if (i==0) {
                [tabBarButton setSelected:YES];
            }
            [tabBarButton setExclusiveTouch:YES];
            [_tabBarView addSubview:tabBarButton];
           
            
        }
        
        // 首页显示
        UIViewController * destinationController = [viewControllerArray objectAtIndex:viewControllerArray.count-1];
        [self addChildViewController:destinationController];
        [destinationController didMoveToParentViewController:self];
        [contentView addSubview:destinationController.view];
        
        
 
        [self.view addSubview:contentView];
        [self.view addSubview:_tabBarView];
        
        
    }
    return self;
}

- (void)tabBarButtonClick:(UIButton *)button
{
    [button setSelected:YES];
        for (int i =400; i<viewControllerArray.count+400; i++) {
        UIButton * btn = (UIButton *)[_tabBarView viewWithTag:i];
        if (i!= button.tag) {
            [btn setSelected:NO];
        }
    }
    
    if (index != button.tag - 400) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SETabBarViewController" object:@"RefreshView" userInfo:@{}];
        
        
        UIViewController *sourceController = [viewControllerArray objectAtIndex:viewControllerArray.count-1-index];
        UIViewController *destinationController = [viewControllerArray objectAtIndex:viewControllerArray.count-1-(button.tag-400)];
        [self addChildViewController:destinationController];
        [destinationController didMoveToParentViewController:self];
        [self transitionFromViewController:sourceController toViewController:destinationController duration:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            
        } completion:^(BOOL finished) {
            index = (int)button.tag - 400;
            
            [sourceController willMoveToParentViewController:nil];
            [sourceController removeFromParentViewController];
            
        }];
    }
    
    tag = (int)button.tag;
    NSLog(@"tag:%d",tag);
    
    /*
    if (index != button.tag-400) {
        UIViewController *sourceController = [viewControllerArray objectAtIndex:viewControllerArray.count-1-index];
        UIViewController *destinationController = [viewControllerArray objectAtIndex:viewControllerArray.count-1-(button.tag-400)];
        [self addChildViewController:destinationController];
        [destinationController didMoveToParentViewController:self];
        [self transitionFromViewController:sourceController toViewController:destinationController duration:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
        } completion:^(BOOL finished) {
            index = (int)button.tag-400;
            [sourceController willMoveToParentViewController:nil];
            [sourceController removeFromParentViewController];
        }];
    }
     */
    
   
    

    
}


- (void)tabBarViewHidden
{
    [UIView animateWithDuration:0.2 animations:^{
        _tabBarView.frame = CGRectMake(0, CGRectGetMaxY(self.view.bounds), 320, TAB_BAR_VIEW_HEIGHT);
        contentView.frame = CGRectMake(0, 0, SCREENWIDTH, CGRectGetHeight(self.view.bounds));
    }];
}

- (void)tabBarViewShow
{
    [UIView animateWithDuration:0.2 animations:^{
        _tabBarView.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame)-TAB_BAR_VIEW_HEIGHT, SCREENWIDTH, TAB_BAR_VIEW_HEIGHT);
        contentView.frame = CGRectMake(0, 0, SCREENWIDTH, CGRectGetHeight(self.view.bounds)-TAB_BAR_VIEW_HEIGHT);
    }];
    
}


- (void)bringToTargetVC:(int)num
{
    UIButton *btn = (UIButton *)[self.tabBarView viewWithTag:num];
    [self tabBarButtonClick:btn];
    [self tabBarViewShow];
}
@end
