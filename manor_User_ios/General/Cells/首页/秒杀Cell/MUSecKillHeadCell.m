//
//  MUSecKillHeadCell.m
//  manor_User_ios
//
//  Created by 刘斌 on 15/7/17.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUSecKillHeadCell.h"

@implementation MUSecKillHeadCell

- (void)awakeFromNib {
    // Initialization code
    //imgScrollView
    pageNum = 0;
    [_blurView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    _leftBtn.hidden = YES;
    
    
    _imageArray = @[@"example_2",@"example_3",@"example_4"];
    _scrollView.delegate = self;
    
    //首页展示
    //        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArray[(imgArr.count-1)]]];
    //    UIImageView *imageView = [[UIImageView alloc]init];
    //    [imageView sd_setImageWithURL:_imageArray[_imageArray.count -1] placeholderImage:[UIImage imageNamed:@"default"]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_imageArray[(_imageArray.count-1)]]];
    imageView.frame = CGRectMake(0, 0, SCREENWIDTH, 165);
    
    imageView.tag=_imageArray.count-1;
    UITapGestureRecognizer *Tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
    imageView.userInteractionEnabled=YES;
    [imageView addGestureRecognizer:Tap];
    
    
    [_scrollView addSubview:imageView];
    _scrollView.contentSize = CGSizeMake(SCREENWIDTH*_imageArray.count, 165);
    
    //全部放进去
    for (int i=0; i<_imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_imageArray[i]]];
        //        UIImageView *imageView = [[UIImageView alloc]init];
        //        [imageView sd_setImageWithURL:_imageArray[i] placeholderImage:[UIImage imageNamed:@"default"]];
        imageView.frame = CGRectMake(SCREENWIDTH*(i+1), 0, SCREENWIDTH, 165);
        imageView.tag=i;
        UITapGestureRecognizer *Tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
        imageView.userInteractionEnabled=YES;
        [imageView addGestureRecognizer:Tap];
        [_scrollView addSubview:imageView];
    }
    
    //尾页
    
    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_imageArray[0]]];
    //    [imageView sd_setImageWithURL:imageArray[0] placeholderImage:[UIImage imageNamed:@"default"]];
    imageView.frame = CGRectMake(SCREENWIDTH*(_imageArray.count+1), 0, SCREENWIDTH, 165);
    imageView.tag=0;
    Tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
    imageView.userInteractionEnabled=YES;
    [imageView addGestureRecognizer:Tap];
    [_scrollView addSubview:imageView];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)careButton:(id)sender {
    if (state == NO) {
        [_careBtn setSelected:YES];
        state = YES;
    }else
    {
        [_careBtn setSelected:NO];
        state = NO;
    }
    
}

- (IBAction)leftButton:(id)sender {
    pageNum--;
    _rightBtn.hidden = NO;
    [self.scrollView scrollRectToVisible:CGRectMake(SCREENWIDTH*pageNum,0,SCREENWIDTH,165) animated:NO];
    if (pageNum ==0) {
        _leftBtn.hidden = YES;
        
    }
    
    NSLog(@"left_x is---%.2f",_scrollView.contentOffset.x);
    
}
- (IBAction)rightBtn:(id)sender {
    
    pageNum++;
    _leftBtn.hidden = NO;
    [self.scrollView scrollRectToVisible:CGRectMake(SCREENWIDTH*pageNum,0,SCREENWIDTH,165) animated:NO];
    //    NSLog(@"right_x is---%.2f",_scrollView.contentOffset.x);
    if (pageNum ==_imageArray.count-1) {
        
        _rightBtn.hidden = YES;
    }
    
}

- (void)imagePressed:(UITapGestureRecognizer *)sender
{
    NSLog(@"1");
}

@end
