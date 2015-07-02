//
//  AddActViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/29.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "AddActViewController.h"
#import "GCPlaceholderTextView.h"
#import "Tool.h"
#import "CNPPopupController.h"
#import "SVProgressHUD.h"

@interface AddActViewController ()
{
    GCPlaceholderTextView * inputTitle;
    GCPlaceholderTextView * inputInfo;
    
    UIButton * buttonLink;
    UIButton * buttonPicture;
    UIButton * buttonVoice;
    
    CNPPopupController * popController;
    UIDatePicker * picker;
    
    UITextField * fieldPlace;
    
    int chooseState;
    
    NSString * startTime;
    NSString * endTime;
    
    UILabel * labelStartDate;
    UILabel * labelEndDate;
    UILabel * labelStartTime;
    UILabel * labelEndTime;
}
@end

@implementation AddActViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNextButtonTitle:@"提交"];
    [self setupTitle:@"发布活动"];
    
    startTime = [Tool getNowTime:[NSDate date]];
    endTime = [NSString stringWithString:startTime];

    GCPlaceholderTextView * temp = [[GCPlaceholderTextView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:temp];
    
    inputTitle = [[GCPlaceholderTextView alloc] initWithFrame:CGRectMake( 10, 74, Screen_Width - 20, 60 )];
    inputTitle.font = [UIFont systemFontOfSize:Text_Size_Small];
    inputTitle.placeholder = @"请输入活动标题";
    [self.view addSubview:inputTitle];
    //////////////
    UIView * middleView = [[UIView alloc] initWithFrame:CGRectMake( 0, 144, Screen_Width, 120 )];
    middleView.backgroundColor = Color_Light_Gray;
    [self.view addSubview:middleView];
    
    UILabel * labelImageTime = [[UILabel alloc] initWithFrame:CGRectMake( 20, 15, 15, 15 )];
    labelImageTime.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Small];
    labelImageTime.textColor = Color_Heavy_Gray;
    labelImageTime.text = @"\U0000F017";
    [middleView addSubview:labelImageTime];
    
    UILabel * labelStart = [[UILabel alloc] initWithFrame:CGRectMake( 50, 15, 30, 15 )];
    labelStart.textColor = Color_Heavy_Gray;
    labelStart.text = @"开始";
    labelStart.font = [UIFont systemFontOfSize:Text_Size_Small];
    [middleView addSubview:labelStart];
    
    labelStartDate = [[UILabel alloc] initWithFrame:CGRectMake( 90, 15, ( Screen_Width - 80 ) / 3 * 2, 15 )];
    labelStartDate.textColor = Color_Heavy_Gray;
    labelStartDate.text = [NSString stringWithFormat:@"%@ %@", [startTime substringToIndex:10], [Tool getWeekFromDate:startTime]];
    labelStartDate.font = [UIFont systemFontOfSize:Text_Size_Small];
    [middleView addSubview:labelStartDate];
    labelStartDate.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showChooseStartDate)];
    [labelStartDate addGestureRecognizer:tap1];
    
    labelStartTime = [[UILabel alloc] initWithFrame:CGRectMake( 90 + ( Screen_Width - 80 ) / 3 * 2, 15, ( Screen_Width - 80 ) / 3, 15 )];
    labelStartTime.textColor = Color_Heavy_Gray;
    labelStartTime.text = [startTime substringFromIndex:11];
    labelStartTime.font = [UIFont systemFontOfSize:Text_Size_Small];
    [middleView addSubview:labelStartTime];
    labelStartTime.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showChooseStartTime)];
    [labelStartTime addGestureRecognizer:tap2];
    
    UILabel * labelEnd = [[UILabel alloc] initWithFrame:CGRectMake( 50, 40, 30, 15 )];
    labelEnd.textColor = Color_Heavy_Gray;
    labelEnd.text = @"结束";
    labelEnd.font = [UIFont systemFontOfSize:Text_Size_Small];
    [middleView addSubview:labelEnd];
    
    labelEndDate = [[UILabel alloc] initWithFrame:CGRectMake( 90, 40, ( Screen_Width - 80 ) / 3 * 2, 15 )];
    labelEndDate.textColor = Color_Heavy_Gray;
    labelEndDate.text = labelStartDate.text;
    labelEndDate.font = [UIFont systemFontOfSize:Text_Size_Small];
    [middleView addSubview:labelEndDate];
    labelEndDate.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showChooseEndDate)];
    [labelEndDate addGestureRecognizer:tap3];
    
    labelEndTime = [[UILabel alloc] initWithFrame:CGRectMake( 90 + ( Screen_Width - 80 ) / 3 * 2, 40, ( Screen_Width - 80 ) / 3, 15 )];
    labelEndTime.textColor = Color_Heavy_Gray;
    labelEndTime.text = labelStartTime.text;
    labelEndTime.font = [UIFont systemFontOfSize:Text_Size_Small];
    [middleView addSubview:labelEndTime];
    labelEndTime.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showChooseEndTime)];
    [labelEndTime addGestureRecognizer:tap4];
    ////
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:labelEndTime] + 15, Screen_Width - 20, 0.5 )];
    line.backgroundColor = Color_Gray;
    [middleView addSubview:line];
    
    UILabel * labelImageLocation = [[UILabel alloc] initWithFrame:CGRectMake( 20, [Tool getBottom:line] + 17, 15, 15 )];
    labelImageLocation.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Small];
    labelImageLocation.textColor = Color_Heavy_Gray;
    labelImageLocation.text = @"\U0000F041";
    [middleView addSubview:labelImageLocation];
    
    fieldPlace = [[UITextField alloc] initWithFrame:CGRectMake( 50, [Tool getBottom:line] + 15, Screen_Width - 60, 20 )];
    fieldPlace.font = [UIFont systemFontOfSize:Text_Size_Small];
    fieldPlace.placeholder = @"输入活动地址";
    fieldPlace.clearButtonMode = UITextFieldViewModeWhileEditing;
    fieldPlace.backgroundColor = [UIColor clearColor];
    [middleView addSubview:fieldPlace];
    /////////////
    inputInfo = [[GCPlaceholderTextView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:middleView] + 10, Screen_Width - 20, Screen_Height - 90 - [Tool getBottom:middleView] )];
    inputInfo.font = [UIFont systemFontOfSize:Text_Size_Small];
    inputInfo.placeholder = @"请输入活动的详细内容、活动流程、活动费用、注意事项等";
    [self.view addSubview:inputInfo];
    /////////////
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake( 0, Screen_Height - 80, Screen_Width, 80 )];
    bottomView.backgroundColor = Color_Light_Gray;
    [self.view addSubview:bottomView];
    
    CGFloat width = ( Screen_Width - 180 - 20 ) / 4;
    
    buttonLink = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLink.frame = CGRectMake( width, 10, 60, 60 );
    buttonLink.layer.masksToBounds = YES;
    buttonLink.layer.cornerRadius = 30;
    [buttonLink setBackgroundColor:Color_Gray];
    [buttonLink.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
    [buttonLink setTitle:@"\U0000F0C1 链接" forState:UIControlStateNormal];
    [buttonLink setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonLink setTitleColor:Bg_Red forState:UIControlStateHighlighted];
    [bottomView addSubview:buttonLink];
    
    buttonPicture = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPicture.frame = CGRectMake( width * 2 + 10 + 60, 10, 60, 60 );
    buttonPicture.layer.masksToBounds = YES;
    buttonPicture.layer.cornerRadius = 30;
    [buttonPicture setBackgroundColor:Color_Gray];
    [buttonPicture.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
    [buttonPicture setTitle:@"\U0000F03E 照片" forState:UIControlStateNormal];
    [buttonPicture setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonPicture setTitleColor:Bg_Red forState:UIControlStateHighlighted];
    [bottomView addSubview:buttonPicture];
    
    buttonVoice = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonVoice.frame = CGRectMake( width * 3 + 20 + 60 * 2, 10, 60, 60 );
    buttonVoice.layer.masksToBounds = YES;
    buttonVoice.layer.cornerRadius = 30;
    [buttonVoice setBackgroundColor:Color_Gray];
    [buttonVoice setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonVoice setTitleColor:Bg_Red forState:UIControlStateHighlighted];
    [buttonVoice.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
    [buttonVoice setTitle:@"\U0000F028 录音" forState:UIControlStateNormal];
    [bottomView addSubview:buttonVoice];
}

- ( void ) showChoose
{
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSString * titleText = @"";
    switch( chooseState )
    {
        case 0 :
        {
            titleText = @"选择开始日期";
            break;
        }
        case 1 :
        {
            titleText = @"选择结束日期";
            break;
        }
        case 2 :
        {
            titleText = @"选择开始时间";
            break;
        }
        case 3 :
        {
            titleText = @"选择结束时间";
            break;
        }
    }
    
    NSAttributedString * title = [[NSAttributedString alloc] initWithString:titleText attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:Text_Size_Big], NSParagraphStyleAttributeName : paragraphStyle}];
    
    UILabel * labelTitle = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width - 50, 30)];
    labelTitle.numberOfLines = 0;
    labelTitle.attributedText = title;
    
    UIView * pickerView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, 240, 216)];
    pickerView.backgroundColor = [UIColor clearColor];
    
    picker = [[UIDatePicker alloc] init];
    picker.frame = CGRectMake( 0, 0, 240, 216 );
    NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
    picker.locale = locale;
    
    if( chooseState < 2 )
    {
        picker.datePickerMode = UIDatePickerModeDate;
        
        //当前时间创建NSDate
        NSDate * localDate = [NSDate date];
        //在当前时间加上的时间：格里高利历
        NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
        //设置时间
        [offsetComponents setYear:50];
        [offsetComponents setMonth:0];
        [offsetComponents setDay:0];
        [offsetComponents setHour:0];
        [offsetComponents setMinute:0];
        [offsetComponents setSecond:0];
        //设置最大值时间
        NSDate * maxDate = [gregorian dateByAddingComponents:offsetComponents toDate:localDate options:0];
        picker.minimumDate = localDate;
        picker.maximumDate = maxDate;
    }
    else
    {
        picker.datePickerMode = UIDatePickerModeTime;
    }
    [pickerView addSubview:picker];
    
    UIView * buttonView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, ( Screen_Width - 60 ), 40 )];
    buttonView.backgroundColor = [UIColor clearColor];
    
    UIButton * buttonCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonCancel.frame = CGRectMake( 0, 0, ( Screen_Width - 80 ) / 2, 40 );
    buttonCancel.backgroundColor = Bg_Red;
    [buttonCancel setTitle:@"取消" forState:UIControlStateNormal];
    [buttonCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonCancel setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonCancel.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonCancel.layer.cornerRadius = 5.0f;
    [buttonCancel addTarget:self action:@selector(closePop) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:buttonCancel];
    
    UIButton * buttonConfirm = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonConfirm.frame = CGRectMake( ( Screen_Width - 80 ) / 2 + 20, 0, ( Screen_Width - 80 ) / 2, 40 );
    buttonConfirm.backgroundColor = Bg_Green;
    [buttonConfirm setTitle:@"确定" forState:UIControlStateNormal];
    [buttonConfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonConfirm setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonConfirm.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonConfirm.layer.cornerRadius = 5.0f;
    [buttonConfirm addTarget:self action:@selector(judgeChoose) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:buttonConfirm];
    
    popController = [[CNPPopupController alloc] initWithContents:@[labelTitle, pickerView, buttonView]];
    popController.theme = [CNPPopupTheme defaultTheme];
    popController.theme.popupStyle = CNPPopupStyleCentered;
    [popController presentPopupControllerAnimated:YES];
}

- ( void ) closePop
{
    [popController dismissPopupControllerAnimated:YES];
}

- ( void ) judgeChoose
{
    NSString * result = [Tool getNowTime:[picker date]];
    switch( chooseState )
    {
        case 0 :
        {
            startTime = [NSString stringWithFormat:@"%@%@", [result substringToIndex:11], [startTime substringFromIndex:11]];
            labelStartDate.text = [NSString stringWithFormat:@"%@ %@", [startTime substringToIndex:10], [Tool getWeekFromDate:startTime]];
            [self closePop];
            break;
        }
        case 1 :
        {
            endTime = [NSString stringWithFormat:@"%@%@", [result substringToIndex:11], [endTime substringFromIndex:11]];
            labelEndDate.text = [NSString stringWithFormat:@"%@ %@", [endTime substringToIndex:10], [Tool getWeekFromDate:endTime]];
            [self closePop];
            break;
        }
        case 2 :
        {
            startTime = [NSString stringWithFormat:@"%@%@", [startTime substringToIndex:11], [result substringFromIndex:11]];
            labelStartTime.text = [startTime substringFromIndex:11];
            [self closePop];
            break;
        }
        case 3 :
        {
            endTime = [NSString stringWithFormat:@"%@%@", [endTime substringToIndex:11], [result substringFromIndex:11]];
            labelEndTime.text = [endTime substringFromIndex:11];
            [self closePop];
            break;
        }
    }
}

- ( void ) doNext
{
    if( [startTime compare:endTime] == NSOrderedDescending )
    {
        [SVProgressHUD showErrorWithStatus:@"开始时间不能晚于结束时间"];
        return;
    }
}

- ( void ) showChooseStartDate
{
    chooseState = 0;
    [self showChoose];
}

- ( void ) showChooseEndDate
{
    chooseState = 1;
    [self showChoose];
}

- ( void ) showChooseStartTime
{
    chooseState = 2;
    [self showChoose];
}

- ( void ) showChooseEndTime
{
    chooseState = 3;
    [self showChoose];
}

- ( void ) clickButtonLink
{
    
}

- ( void ) clickButtonPicture
{
    
}

- ( void ) clickButtonVoice
{
    
}

@end
