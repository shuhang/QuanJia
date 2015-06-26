//
//  SignInfoViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/24.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "SignInfoViewController.h"
#import "Tool.h"

@interface SignInfoViewController ()
{
    UIButton * buttonHead;
    UITextField * fieldName;
    UITextField * fieldSex;
    UITextField * fieldBirthday;
}
@end

@implementation SignInfoViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = Color_Light_Gray;
    
    [self setupTitle:@"个人信息"];
    
    buttonHead = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonHead.frame = CGRectMake( ( Screen_Width - 80 ) / 2, 95, 80, 80 );
    buttonHead.backgroundColor = [UIColor whiteColor];
    buttonHead.layer.masksToBounds = YES;
    buttonHead.layer.cornerRadius = 40.f;
    [buttonHead.layer setBorderWidth:0.5];
    [buttonHead.layer setBorderColor:Color_Gray.CGColor];
    [self.view addSubview:buttonHead];
    
    fieldName = [[UITextField alloc] initWithFrame:CGRectMake( 30, [Tool getBottom:buttonHead] + 30, Screen_Width - 60, 40 )];
    fieldName.placeholder = @"姓名";
    fieldName.backgroundColor = [UIColor whiteColor];
    fieldName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [fieldName setBorderStyle:UITextBorderStyleRoundedRect];
    [fieldName setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    [self adjustTextField:fieldName];
    [self.view addSubview:fieldName];
    
    fieldSex = [[UITextField alloc] initWithFrame:CGRectMake( 30, [Tool getBottom:fieldName] + 10, Screen_Width - 60, 40 )];
    fieldSex.placeholder = @"性别";
    fieldSex.backgroundColor = [UIColor whiteColor];
    fieldSex.clearButtonMode = UITextFieldViewModeWhileEditing;
    [fieldSex setBorderStyle:UITextBorderStyleRoundedRect];
    [fieldSex setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    [self adjustTextField:fieldSex];
    [self.view addSubview:fieldSex];
    
    fieldBirthday = [[UITextField alloc] initWithFrame:CGRectMake( 30, [Tool getBottom:fieldSex] + 10, Screen_Width - 60, 40 )];
    fieldBirthday.placeholder = @"生日";
    fieldBirthday.backgroundColor = [UIColor whiteColor];
    fieldBirthday.clearButtonMode = UITextFieldViewModeWhileEditing;
    [fieldBirthday setBorderStyle:UITextBorderStyleRoundedRect];
    [fieldBirthday setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    [self adjustTextField:fieldBirthday];
    [self.view addSubview:fieldBirthday];
    
    UIButton * buttonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLogin.frame = CGRectMake( 30, [Tool getBottom:fieldBirthday] + 30, Screen_Width - 60, 40 );
    buttonLogin.backgroundColor = Bg_Red;
    [buttonLogin setTitle:@"注册" forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonLogin.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonLogin.layer.cornerRadius = 5.0f;
    [self.view addSubview:buttonLogin];
}

@end
