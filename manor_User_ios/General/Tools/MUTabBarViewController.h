//
//  MUTabBarViewController.h
//  manor_User_ios
//
//  Created by MR.L on 15/5/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUTabBarViewController : UIViewController
@property (nonatomic,strong) UIView *tabBarView;

- (id)initWithViewController:(NSArray *)viewControllers;
- (void)tabBarViewHidden;
- (void)tabBarViewShow;

- (void)bringToTargetVC:(int)num;
@end
