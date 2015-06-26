//
//  SignViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/23.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "SignViewController.h"
#import "Tool.h"
#import "SignInfoViewController.h"

@interface SignViewController ()
{
    UITextField * fieldPhone;
    UITextField * fieldPassword;
    UITextField * fieldCode;
    
    UIButton * buttonCode;
    
    int timerCount;
    NSTimer * codeTimer;
}
@end

@implementation SignViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = Color_Light_Gray;
    
    timerCount = 0;
    [self setupTitle:@"注册"];
    
    fieldPhone = [[UITextField alloc] initWithFrame:CGRectMake( 30, 95, Screen_Width - 60, 40 )];
    fieldPhone.placeholder = @"手机号";
    fieldPhone.keyboardType = UIKeyboardTypeNumberPad;
    fieldPhone.backgroundColor = [UIColor whiteColor];
    fieldPhone.clearButtonMode = UITextFieldViewModeWhileEditing;
    [fieldPhone setBorderStyle:UITextBorderStyleRoundedRect];
    [fieldPhone setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    fieldPhone.font = [UIFont systemFontOfSize:Text_Size_Small];
    [self adjustTextField:fieldPhone];
    [self.view addSubview:fieldPhone];
    
    fieldPassword = [[UITextField alloc] initWithFrame:CGRectMake( 30, 140, Screen_Width - 60, 40 )];
    fieldPassword.placeholder = @"密码";
    fieldPassword.secureTextEntry = YES;
    fieldPassword.backgroundColor = [UIColor whiteColor];
    fieldPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    [fieldPassword setBorderStyle:UITextBorderStyleRoundedRect];
    [fieldPassword setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    fieldPassword.font = [UIFont systemFontOfSize:Text_Size_Small];
    [self adjustTextField:fieldPassword];
    [self.view addSubview:fieldPassword];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake( 30, 185, Screen_Width - 60, 40 )];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5.0f;
    view.layer.masksToBounds = YES;
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = Color_Gray.CGColor;
    [self.view addSubview:view];
    
    fieldCode = [[UITextField alloc] initWithFrame:CGRectMake( 30, 185, 120, 40 )];
    fieldCode.placeholder = @"手机验证码";
    fieldCode.keyboardType = UIKeyboardTypeNumberPad;
    fieldCode.backgroundColor = [UIColor clearColor];
    fieldCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    [fieldCode setBorderStyle:UITextBorderStyleRoundedRect];
    [fieldCode setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    fieldCode.font = [UIFont systemFontOfSize:Text_Size_Small];
    fieldCode.borderStyle = UITextBorderStyleNone;
    fieldCode.layer.cornerRadius = 0;
    [self adjustTextField:fieldCode];
    [self.view addSubview:fieldCode];
    
    buttonCode = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonCode.frame = CGRectMake( Screen_Width - 120, 192, 80, 26 );
    buttonCode.backgroundColor = Bg_Orange;
    [buttonCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [buttonCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonCode setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonCode.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonCode.layer.cornerRadius = 8.0f;
    [buttonCode addTarget:self action:@selector(doSendCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonCode];
    
    UIButton * buttonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLogin.frame = CGRectMake( 30, [Tool getBottom:view] + 50, Screen_Width - 60, 40 );
    buttonLogin.backgroundColor = Bg_Red;
    [buttonLogin setTitle:@"注册" forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonLogin.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonLogin.layer.cornerRadius = 5.0f;
    [buttonLogin addTarget:self action:@selector(doSign) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonLogin];
    
    UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake( ( Screen_Width - 120 ) / 2, [Tool getBottom:buttonLogin] + 30, 120, 1 )];
    line2.backgroundColor = Color_Gray;
    [self.view addSubview:line2];
    
    UIButton * buttonWeixin = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonWeixin.frame = CGRectMake( 30, [Tool getBottom:line2] + 30, Screen_Width - 60, 40 );
    buttonWeixin.backgroundColor = Bg_Green;
    [buttonWeixin setTitle:@"微信登录" forState:UIControlStateNormal];
    [buttonWeixin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonWeixin setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonWeixin.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonWeixin.layer.cornerRadius = 5.0f;
    [self.view addSubview:buttonWeixin];
}

- ( void ) doSendCode
{
    if( timerCount == 0 )
    {
        [buttonCode setTitle:@"60秒后重发" forState:UIControlStateNormal];
        codeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    }
}

- ( void ) handleTimer : ( NSTimer * ) timer
{
    if( timerCount == 60 )
    {
        [codeTimer invalidate];
        timerCount = 0;
        [buttonCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    else
    {
        timerCount ++;
        [buttonCode setTitle:[NSString stringWithFormat:@"%d秒后重发", 60 - timerCount] forState:UIControlStateNormal];
    }
}

- ( void ) doBack
{
    [codeTimer invalidate];
    [super doBack];
}

- ( void ) doSign
{
    SignInfoViewController * controller = [SignInfoViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
