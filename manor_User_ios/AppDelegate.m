//
//  AppDelegate.m
//  manor_User_ios
//
//  Created by MR.L on 15/5/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "AppDelegate.h"
#import "MUHomePageViewController.h"
#import "MUCategoryViewController.h"
#import "MUShopCartViewController.h"
#import "MUMyManorViewController.h"
#import "MUTabBarViewController.h"
#import "MULoginViewController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navColor"] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    
    
    MULoginViewController *loginVC = [[MULoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    //[nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"transparent_nav"] forBarMetrics:UIBarMetricsDefault];
    
    MUHomePageViewController *homePageVC = [[MUHomePageViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:homePageVC];
    

    
    MUCategoryViewController *categoryVC = [[MUCategoryViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:categoryVC];
   
    
    MUShopCartViewController *shopCartVC = [[MUShopCartViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:shopCartVC];

    
    MUMyManorViewController *myManorVC = [[MUMyManorViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:myManorVC];
    
    MUTabBarViewController *tabBarVC = [[MUTabBarViewController alloc] initWithViewController:@[nav1,nav2,nav3,nav4]];
    
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
