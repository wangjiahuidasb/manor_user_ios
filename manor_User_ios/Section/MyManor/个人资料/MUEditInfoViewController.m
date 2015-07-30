//
//  MUEditInfoViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/6/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUEditInfoViewController.h"
#import "MUTabBarViewController.h"

#define EDITCOLOR [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0]
@interface MUEditInfoViewController ()
{
    MUTabBarViewController *tabBarView;
    UIButton *editButton;
    NSArray *educationArray;
    NSArray *professionArray;
    NSArray *proArray;
    NSArray *cityArray;
    NSArray *areaArray;
    
    NSString *typeString;
    NSString *pickerString;
    UIDatePicker *birthDateView;//日期控件
    UIPickerView *professionPickerView;//学历picker
    UIPickerView *locationPickerView;//所在地picker
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *educationView;
@property (weak, nonatomic) IBOutlet UIView *professionView;

@end

@implementation MUEditInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的资料";
    
    self.navigationItem.leftBarButtonItem = [Tools getNavBarItem:self clickAction:@selector(back)];
    
    editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setBackgroundImage:[UIImage imageNamed:@"infoEdit"] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(infoEdit) forControlEvents:UIControlEventTouchUpInside];
    [editButton setFrame:CGRectMake(255, 0, 25, 25)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:editButton];
    self.navigationItem.rightBarButtonItem = right;
    [self drawRect];
    
    tabBarView = (MUTabBarViewController *)self.navigationController.parentViewController;
    [tabBarView tabBarViewHidden];
    
    //假数据
    educationArray = @[@"博士",@"硕士",@"大学",@"大专",@"高中"];
    professionArray = @[@"医生",@"护士",@"女仆",@"教师",@"空姐"];
    proArray = @[@"北京",@"湖南",@"湖北",@"贵州",@"河南",@"广州"];
    cityArray = @[@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6",@"测试7",@"测试8"];
    areaArray = @[@"area测试1",@"area测试2",@"area测试3",@"area测试4",@"area测试5",@"area测试6"];
    
    //学历picker
    _blurView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:0.5];
    [_blurView setFrame:CGRectMake(0, 0, SCREENWIDTH,SCREENHEIGHT)];
    _pickView.dataSource = self;
    _pickView.delegate = self;
    _pickView.hidden = YES;

    
    //职业picker
    professionPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREENWIDTH, 162)];
    professionPickerView.dataSource = self;
    professionPickerView.delegate = self;
    professionPickerView.hidden = YES;
    [_containView addSubview:professionPickerView];
    //所在地picker
    locationPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREENWIDTH, 162)];
    locationPickerView.dataSource = self;
    locationPickerView.delegate = self;
    locationPickerView.hidden = YES;
    [_containView addSubview:locationPickerView];
    
    //生日picker
    birthDateView = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 40, SCREENWIDTH, 162)];
    birthDateView.hidden = YES;

}

- (void)viewDidAppear:(BOOL)animated
{
    
}
#pragma mark 常用方法
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)infoEdit
{
    NSLog(@"屏幕高度--%f",SCREENHEIGHT);
    
    
    
    editButton.hidden = YES;
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-50-64, SCREENWIDTH, 50)];
    bottomView.backgroundColor = [UIColor colorWithRed:51/255.0f green:57/255.0f blue:71/255.0f alpha:1.0];
    
    UIButton *saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, SCREENWIDTH-200, 30)];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    saveBtn.titleLabel.textColor = [UIColor whiteColor];
    [saveBtn setTitle:@"确定更改" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(savebtnFunction) forControlEvents:UIControlEventTouchUpInside];
    
    [bottomView addSubview:saveBtn];
    [self.view addSubview:bottomView];
    
    
    //属性
    _nameTextField.enabled = YES;
    _emailLabel.enabled = YES;
    _phoneLabel.enabled = YES;
    _maleBtn.enabled = YES;
    _femaleBtn.enabled = YES;
    _nameTextField.textColor = EDITCOLOR;
    _emailLabel.textColor = EDITCOLOR;
    _phoneLabel.textColor = EDITCOLOR;
    _bornLabel.textColor = EDITCOLOR;
    _educationLabel.textColor = EDITCOLOR;
    _locationLabel.textColor = EDITCOLOR;
    _professionLabel.textColor = EDITCOLOR;
    [_maleBtn setTitleColor:EDITCOLOR forState:UIControlStateSelected];
    [_femaleBtn setTitleColor:EDITCOLOR forState:UIControlStateSelected];
    
}
- (void)drawRect
{
    
    _educationView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _educationView.layer.borderWidth = 1.0f;
   
    _professionView.layer.borderColor = [UIColor colorWithRed:233/255.0f green:233/255.0f blue:233/255.0f alpha:1.0].CGColor;
    _professionView.layer.borderWidth = 1.0;
    
    _nameTextField.enabled = NO;
    _emailLabel.enabled = NO;
    _phoneLabel.enabled = NO;
    _maleBtn.enabled = NO;
    _femaleBtn.enabled = NO;
    
    
}

#pragma mark 按钮
//性别

- (IBAction)maleBtnFunction:(id)sender {
    [_maleBtn setSelected:YES];
    [_femaleBtn setSelected:NO];
}

- (IBAction)femaleBtnFuction:(id)sender {
    [_maleBtn setSelected:NO];
    [_femaleBtn setSelected:YES];
}

- (void)savebtnFunction
{
    
}

#pragma mark 手势响应
- (IBAction)birthTap:(id)sender {
    // 日期控件
    _pickView.hidden = YES;
    professionPickerView.hidden = YES;
    locationPickerView.hidden = YES;
    birthDateView.hidden = NO;
    
    
    birthDateView.datePickerMode = UIDatePickerModeDate;
    [birthDateView addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *formatter_minDate = [[NSDateFormatter alloc] init];
    [formatter_minDate setDateFormat:@"yyyy-MM-dd"];

    NSDate *minDate = [formatter_minDate dateFromString:@"1900-01-01"];
    
    birthDateView.minimumDate =minDate;
    birthDateView.maximumDate =[NSDate date];
    [_containView addSubview:birthDateView];
    
    [self pickViewShow];
    typeString = @"生日";
    
}

- (IBAction)educationTap:(id)sender {
    birthDateView.hidden = YES;
    locationPickerView.hidden = YES;
    professionPickerView.hidden = YES;
    _pickView.hidden = NO;
    [self pickViewShow];
    typeString = @"学历";
    
}

- (IBAction)professionTap:(id)sender {
    birthDateView.hidden = YES;
    _pickView.hidden = YES;
    locationPickerView.hidden = YES;
    professionPickerView.hidden = NO;
    [self pickViewShow];
    typeString = @"职业";
    
}

- (IBAction)locationTap:(id)sender {
    birthDateView.hidden = YES;
    _pickView.hidden = YES;
    professionPickerView.hidden = YES;
    locationPickerView.hidden = NO;
    [self pickViewShow];
    typeString = @"所在地";
    
}

#pragma mark 区域
- (IBAction)cancelFunction:(id)sender {
    _blurView.hidden = YES;
    
   
   
}
- (IBAction)sureFunction:(id)sender
{
   
    _blurView.hidden = YES;
    
    if ([typeString isEqualToString:@"学历"])
    {
        _educationLabel.text = pickerString;
    }else if ([typeString isEqualToString:@"职业"])
    {
        _professionLabel.text = pickerString;
    }else if ([typeString isEqualToString:@"所在地"])
    {
        _locationLabel.text = pickerString;
    }else if ([typeString isEqualToString:@"生日"])
    {
        _bornLabel.text = pickerString;
    }
    
    
    
    NSInteger pro_row = [locationPickerView selectedRowInComponent:0];
    NSInteger city_row = [locationPickerView selectedRowInComponent:1];
    NSInteger area_row = [locationPickerView selectedRowInComponent:2];
    
//    NSString * areaSelectedID = [NSString stringWithFormat:@"%d",selectedCityId];
//    if ([areaSelectedID isEqualToString:nil] ) {
//        _locationLabel.text = @"null";
//    }
    _locationLabel.text = [NSString stringWithFormat:@"%@%@%@",[proArray objectAtIndex:pro_row],[cityArray objectAtIndex:city_row],[areaArray objectAtIndex:area_row]];
    

    


    
}

#pragma mark pickerView 方法
-(void)dateChanged:(id)sender{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* _date = control.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    pickerString = [dateFormatter stringFromDate:_date];
}


- (void)pickViewShow
{
    _blurView.hidden = NO;
    [self.navigationController.view addSubview:_blurView];
}

#pragma mark 实现协议UIPickerViewDelegate方法

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if(pickerView == _pickView)
    {
        return 1;
    }else if(pickerView == professionPickerView)
    {
        return 1;
    }else
    {
        return 3;
    }
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if(pickerView == _pickView)
    {
        return educationArray.count;
    }else if(pickerView == professionPickerView)
    {
        return professionArray.count;
    }else
    {
        if (component ==0) {
            return proArray.count;
        }else if (component ==1)
        {
            return cityArray.count;
        }else
        {
            return areaArray.count;
        }
    }
    
   
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if(pickerView == _pickView)
    {
        return [educationArray objectAtIndex:row];
    }else if(pickerView == professionPickerView)
    {
        return [professionArray objectAtIndex:row];
    }else
    {
        if (component == 0) {
            
            return [proArray objectAtIndex:row];
        }else if (component ==1)
        {
            return [cityArray objectAtIndex:row];
        }else
        {
            return [areaArray objectAtIndex:row];
        }
    }
    
    
    
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if(pickerView == _pickView)
    {
        NSLog(@"areaID is%@",[educationArray objectAtIndex:row]);
        pickerString = [educationArray objectAtIndex:row];
    }else if(pickerView == professionPickerView)
    {
        NSLog(@"areaID is%@",[professionArray objectAtIndex:row]);
        pickerString = [professionArray objectAtIndex:row];
    }else
    {
        
       
        if (component == 0) {
            
            NSLog(@"proID is%@",[proArray objectAtIndex:row]);
        
            [locationPickerView selectRow:0 inComponent:1 animated:YES];
            [locationPickerView reloadComponent:1];
     
            [locationPickerView selectRow:0 inComponent:2 animated:YES];
            [locationPickerView reloadComponent:2];
     
        }else if (component ==1)
        {
            [locationPickerView selectRow:0 inComponent:2 animated:YES];
            [locationPickerView reloadComponent:2];
            NSLog(@"cityID is%@",[cityArray objectAtIndex:row]);
           
        }else
        {
            NSLog(@"areaID is%@",[areaArray objectAtIndex:row]);
           
        }

    }
    
}

@end
