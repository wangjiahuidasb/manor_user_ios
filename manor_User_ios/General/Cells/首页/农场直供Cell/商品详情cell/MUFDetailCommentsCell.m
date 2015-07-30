//
//  MUFDetailCommentsCell.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/9.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUFDetailCommentsCell.h"

#define SLIDE_X 12
#define BORDER_COLOR [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0]
#define TEXT_COLOR [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0]

@implementation MUFDetailCommentsCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        _headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(12, 15, 40,40)];
        _headerImg.layer.cornerRadius = 40/2.0f;
        _headerImg.layer.masksToBounds = YES;
        _headerImg.image = [UIImage imageNamed:@"example_3"];
        [self.contentView addSubview:_headerImg];
        
        _phone = [[UILabel alloc]initWithFrame:CGRectMake(65, 17, 100, 15)];
        _phone.font = [UIFont systemFontOfSize:12.0];
        _phone.textColor = TEXT_COLOR;
        _phone.text = @"15318752123";
        [self.contentView addSubview:_phone];
        
        _date = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-112, 17, 100, 15)];
        _date.textAlignment = NSTextAlignmentRight;
        _date.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0];
        _date.font = [UIFont systemFontOfSize:11.0];
        _date.text = @"2010-10-20 19:23";
        [self.contentView addSubview:_date];
        
        _starBtnView = [[UIView alloc]initWithFrame:CGRectMake(65, 35, 82, 14)];
        _starBtnView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_starBtnView];
        
        for (int i=0; i<5; i++) {
            _starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _starBtn.frame = CGRectMake(17*i, 0, 14, 14);
            _starBtn.tag = 400+i;
            [_starBtn setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
            [_starBtn setImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateSelected];
            [_starBtnView addSubview:_starBtn];
        }
        
        
        _starScore = [[UILabel alloc]initWithFrame:CGRectMake(155, 37, 20, 15)];
        _starScore.font = [UIFont systemFontOfSize:12.0];
        _starScore.textColor = [UIColor colorWithRed:255/255.0f green:162/255.0f blue:0/255.0f alpha:1.0];
        _starScore.text = @"5.0";
        [self.contentView addSubview:_starScore];
        
        _content = [[UILabel alloc]initWithFrame:CGRectMake(12, 65, SCREENWIDTH-24, 40)];
        _content.font = [UIFont systemFontOfSize:12.0];
        _content.textColor = TEXT_COLOR;
        _content.text = @"哦i把家还不懂事卡号的阿訇多卡号店里啊剁辣椒阿拉丁就阿訇多卡号卡焦点科技哈坎的卡号的卡号的卡号的";
        [self.contentView addSubview:_content];
        
        
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 165, SCREENWIDTH, 1)];
        _lineView.backgroundColor = BORDER_COLOR;
//        _lineView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_lineView];
        
    }
    return self;
    
}


- (int)setIntroductionText:(NSString*)text
{
   
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    _content.text = text;
    //设置label的最大行数
    _content.numberOfLines = 0;
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:3];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    [_content setAttributedText:attributedString];
    
    
    CGSize size = CGSizeMake(SCREENWIDTH-24, 1000);
    
    CGSize labelSize = [_content.text sizeWithFont:_content.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    _content.frame = CGRectMake(_content.frame.origin.x, _content.frame.origin.y, labelSize.width, labelSize.height);
  
    [self.lineView setFrame:CGRectMake(0, 15+CGRectGetMaxY(_content.frame),SCREENWIDTH, 1)];
    
    //计算出自适应的高度
    frame.size.height = labelSize.height +81;
    self.frame = frame;
    
   

    return labelSize.height + 81;
    
}

- (void)setSelectedStar:(int) num
{
    
    for (int i=0; i<num; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:400 + i];
        [btn setSelected:YES];
    }
}
@end
