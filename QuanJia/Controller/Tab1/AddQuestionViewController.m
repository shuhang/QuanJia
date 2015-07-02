//
//  AddQuestionViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/29.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "AddQuestionViewController.h"
#import "GCPlaceholderTextView.h"

@interface AddQuestionViewController ()
{
    GCPlaceholderTextView * inputTitle;
    GCPlaceholderTextView * inputInfo;
    
    UIButton * buttonLink;
    UIButton * buttonPicture;
    UIButton * buttonVoice;
}
@end

@implementation AddQuestionViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTitle:@"添加提问"];
    [self setupNextButtonTitle:@"提交"];
    
    GCPlaceholderTextView * temp = [[GCPlaceholderTextView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:temp];
    
    inputTitle = [[GCPlaceholderTextView alloc] initWithFrame:CGRectMake( 10, 74, Screen_Width - 20, 60 )];
    inputTitle.font = [UIFont systemFontOfSize:Text_Size_Big];
    [self.view addSubview:inputTitle];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake( 0, 144, 40, 1 )];
    view.backgroundColor = Color_Gray;
    [self.view addSubview:view];
    
    inputInfo = [[GCPlaceholderTextView alloc] initWithFrame:CGRectMake( 10, 155, Screen_Width - 20, Screen_Height - 255 )];
    inputInfo.font = [UIFont systemFontOfSize:Text_Size_Small];
    [self.view addSubview:inputInfo];
    
    inputTitle.placeholder = @"请简要描述你的问题，至少包含一个问号";
    inputInfo.placeholder = @"请补充描述相关的背景、想法、要求等";
    
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
