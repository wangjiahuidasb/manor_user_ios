//
//  MUManorTourDetailViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/16.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUManorTourDetailViewController.h"
#import "MUFDetailHeadImgCell.h"
#import "MUMDetailHeadCell.h"
#import "MUMDetailTourHeadCell.h"
#import "MUMDetailTourCell.h"
#import "MUTourDetailViewController.h"
#import "MUFarmDetailViewController.h"
#import "MUTabBarViewController.h"

@interface MUManorTourDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MUTabBarViewController *tabBarView;
    int manorNum;
    int farmNum;
    
    NSArray *manorArray;
    NSArray *farmArray;
    
    BOOL itemStatus;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *itemView;

@end

@implementation MUManorTourDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"庄园详情";
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
    
    manorNum =1;
    farmNum =1;
    
    manorArray =@[@"1",@"2"];
    farmArray = @[@"1",@"2",@"3"];
    
    _itemView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    _itemView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _itemView.hidden = YES;
    [self.view addSubview:_itemView];
    
    
    //tabBarView
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];

}

#pragma mark Custom
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)shareBtn
{
    
}
- (void)itemBtn
{
    if (itemStatus ==NO) {
        _itemView.hidden = NO;
        itemStatus = YES;
    }else
    {
        _itemView.hidden = YES;
        itemStatus = NO;
    }
    
}

#pragma mark 更多按钮View
- (IBAction)goHomePageVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:400];
}
- (IBAction)goCategyVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:401];
}
- (IBAction)goShopcartVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:402];
}
- (IBAction)goMymanorVC:(id)sender {
    _itemView.hidden = YES;
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    [tabBarView bringToTargetVC:403];
}

#pragma mark tableView 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1+manorNum+farmNum;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (manorNum ==0) {
        if (section ==0) {
            return 2;
        }else
        {
            return 1+farmArray.count;
        }
    }else if(farmNum ==0)
    {
        if (section ==0) {
            return 2;
        }else
        {
            return 1+manorArray.count;
        }
    }else
    {
        if (section ==0) {
            return 2;
        }else if(section ==1)
        {
            return 1+manorArray.count;
        }else
        {
            return 1+farmArray.count;
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0)
    {
        if (indexPath.row==0) {
            return 165;
        }else
        {
            return 130;
        }
            
    }else
    {
        if (indexPath.row==0)
        {
            return 40;
        }else
        {
            return 120;
        }
           
    }

        
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (manorNum ==0)
    {
        //农场直供没有
        if (indexPath.section==0) {
            if (indexPath.row ==0) {
                MUFDetailHeadImgCell *headImgCell = [tableView dequeueReusableCellWithIdentifier:@"FDHeadCell"];
                if (headImgCell ==nil)
                {
                    headImgCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFDetailHeadImgCell" owner:self options:nil]lastObject];
                }
                [headImgCell setSelectedStar:3];
                return headImgCell;
            }else
            {
                MUMDetailHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"MDHeadCell"];
                if (headCell ==nil) {
                    headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailHeadCell" owner:self options:nil]lastObject];
                }
                return headCell;
            }
        }else
        {
            if (indexPath.row ==0) {
                MUMDetailTourHeadCell *tourHeadCell = [tableView dequeueReusableCellWithIdentifier:@"typeCell"];
                if (tourHeadCell ==nil) {
                    tourHeadCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourHeadCell" owner:self options:nil]lastObject];
                }
              
                tourHeadCell.type.text =@"庄园旅游";
               
                return tourHeadCell;
            }else
            {
                MUMDetailTourCell *tourCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
                if (tourCell ==nil) {
                    tourCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourCell" owner:self options:nil]lastObject];
                }
               
                return tourCell;
            }
            
        }

    }else if (farmNum ==0)
    {
        //庄园旅游没有
        if (indexPath.section==0) {
            if (indexPath.row ==0) {
                MUFDetailHeadImgCell *headImgCell = [tableView dequeueReusableCellWithIdentifier:@"FDHeadCell"];
                if (headImgCell ==nil)
                {
                    headImgCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFDetailHeadImgCell" owner:self options:nil]lastObject];
                }
                [headImgCell setSelectedStar:3];
                return headImgCell;
            }else
            {
                MUMDetailHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"MDHeadCell"];
                if (headCell ==nil) {
                    headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailHeadCell" owner:self options:nil]lastObject];
                }
                return headCell;
            }
        }else
        {
            if (indexPath.row ==0) {
                MUMDetailTourHeadCell *tourHeadCell = [tableView dequeueReusableCellWithIdentifier:@"typeCell"];
                if (tourHeadCell ==nil) {
                    tourHeadCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourHeadCell" owner:self options:nil]lastObject];
                }
                
               
                tourHeadCell.type.text =@"农场直供";
                
                return tourHeadCell;
            }else
            {
                MUMDetailTourCell *tourCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
                if (tourCell ==nil) {
                    tourCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourCell" owner:self options:nil]lastObject];
                }
               
                return tourCell;
            }
            
        }

    }else
    {
        //都有
        if (indexPath.section==0) {
            if (indexPath.row ==0) {
                MUFDetailHeadImgCell *headImgCell = [tableView dequeueReusableCellWithIdentifier:@"FDHeadCell"];
                if (headImgCell ==nil)
                {
                    headImgCell = [[[NSBundle mainBundle]loadNibNamed:@"MUFDetailHeadImgCell" owner:self options:nil]lastObject];
                }
                [headImgCell setSelectedStar:3];
                return headImgCell;
            }else
            {
                MUMDetailHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"MDHeadCell"];
                if (headCell ==nil) {
                    headCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailHeadCell" owner:self options:nil]lastObject];
                }
                return headCell;
            }
        }else if (indexPath.section ==1)
        {
            if (indexPath.row ==0) {
                MUMDetailTourHeadCell *tourHeadCell = [tableView dequeueReusableCellWithIdentifier:@"typeCell"];
                if (tourHeadCell ==nil) {
                    tourHeadCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourHeadCell" owner:self options:nil]lastObject];
                }
                
                tourHeadCell.type.text =@"庄园旅游";
               
                return tourHeadCell;
            }else
            {
                MUMDetailTourCell *tourCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
                if (tourCell ==nil) {
                    tourCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourCell" owner:self options:nil]lastObject];
                }
               
                return tourCell;
            }
            
        }else
        {
            if (indexPath.row ==0) {
                MUMDetailTourHeadCell *tourHeadCell = [tableView dequeueReusableCellWithIdentifier:@"typeCell"];
                if (tourHeadCell ==nil) {
                    tourHeadCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourHeadCell" owner:self options:nil]lastObject];
                }
              
                tourHeadCell.type.text =@"农场直供";
                
                return tourHeadCell;
            }else
            {
                MUMDetailTourCell *tourCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
                if (tourCell ==nil) {
                    tourCell = [[[NSBundle mainBundle]loadNibNamed:@"MUMDetailTourCell" owner:self options:nil]lastObject];
                }
              
                return tourCell;
            }

        }

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (manorNum ==0) {
        
        if (indexPath.section ==1) {
            MUFarmDetailViewController *farmDetailVC = [[MUFarmDetailViewController alloc]init];
            [self.navigationController pushViewController:farmDetailVC animated:YES];
        }
        
        
    }else if (farmNum ==0)
    {
        if (indexPath.section ==1) {
            MUTourDetailViewController *tourDetailVC = [[MUTourDetailViewController alloc]init];
            [self.navigationController pushViewController:tourDetailVC animated:YES];
        }
        
    }else
    {
        if (indexPath.section ==1) {
            MUTourDetailViewController *tourDetailVC = [[MUTourDetailViewController alloc]init];
            [self.navigationController pushViewController:tourDetailVC animated:YES];
            
        }else if(indexPath.section ==2)
        {
            MUFarmDetailViewController *farmDetailVC = [[MUFarmDetailViewController alloc]init];
            [self.navigationController pushViewController:farmDetailVC animated:YES];
        }
    }
}
@end
