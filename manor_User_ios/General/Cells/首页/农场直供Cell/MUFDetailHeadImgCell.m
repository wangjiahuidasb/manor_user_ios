//
//  MUFDetailHeadImgCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/9.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFDetailHeadImgCell.h"

@implementation MUFDetailHeadImgCell

- (void)awakeFromNib {
    // Initialization code
    pageNum =0;
    [_starBtn1 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn2 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn3 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn4 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_starBtn5 setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
    [_blurView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [_careBtn setImage:[UIImage imageNamed:@"careSelected"] forState:UIControlStateSelected];
   
    //imgScrollView
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
- (void)setSelectedStar:(int)num
{
    switch (num) {
        case 0:
            [_starBtn1 setSelected:NO];
            [_starBtn2 setSelected:NO];
            [_starBtn3 setSelected:NO];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];
            
            break;
        case 1:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:NO];
            [_starBtn3 setSelected:NO];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];
            break;
        case 2:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:NO];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];
            break;
        case 3:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:YES];
            [_starBtn4 setSelected:NO];
            [_starBtn5 setSelected:NO];
            break;
        case 4:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:YES];
            [_starBtn4 setSelected:YES];
            [_starBtn5 setSelected:NO];
            break;
        case 5:
            [_starBtn1 setSelected:YES];
            [_starBtn2 setSelected:YES];
            [_starBtn3 setSelected:YES];
            [_starBtn4 setSelected:YES];
            [_starBtn5 setSelected:YES];
            break;
        default:
            break;
    }
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

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//
//{
//    CGFloat pagewidth = self.scrollView.frame.size.width;
//    int currentPage = floor((self.scrollView.contentOffset.x - pagewidth/ ([_imageArray count]+2)) / pagewidth) + 1;
////    selectPage = currentPage;
//    if (currentPage==0)
//    {
//        [self.scrollView scrollRectToVisible:CGRectMake(SCREENWIDTH * [_imageArray count],0,SCREENWIDTH,165) animated:NO]; // 序号0 最后1页
//    }
//    else if (currentPage==([_imageArray count]+1))
//    {
//        [self.scrollView scrollRectToVisible:CGRectMake(SCREENWIDTH,0,SCREENWIDTH,165) animated:NO]; // 最后+1,循环第1页
//    }
//}
//- (void)scrollViewDidScroll:(UIScrollView *)sender
//{
//    CGFloat pagewidth = self.scrollView.frame.size.width;
//    int page = floor((self.scrollView.contentOffset.x - pagewidth/([_imageArray count]+2))/pagewidth)+1;
//    pageNum =page;
//    page --;  // 默认从第二页开始
////    _pageControl.currentPage = page;
//}
@end
