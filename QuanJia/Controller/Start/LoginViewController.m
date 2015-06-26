//
//  LoginViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/23.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "LoginViewController.h"
#import "Tool.h"

@interface LoginViewController ()
{
    UITextField * fieldName;
    UITextField * fieldPassword;
}
@end

@implementation LoginViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = Color_Light_Gray;
    
    [self setupTitle:@"登录"];
    
    UIView * inputView = [[UIView alloc] initWithFrame:CGRectMake( 30, 50 + 64, Screen_Width - 60, 81.5 )];
    inputView.backgroundColor = [UIColor whiteColor];
    inputView.layer.cornerRadius = 4.0f;
    inputView.layer.masksToBounds = YES;
    inputView.layer.borderWidth = 1;
    inputView.layer.borderColor = Color_Gray.CGColor;
    [self.view addSubview:inputView];
    
    fieldName = [[UITextField alloc] initWithFrame:CGRectMake( 30, inputView.frame.origin.y + 0.5, Screen_Width - 60, 40 )];
    fieldName.placeholder = @"手机号/邮箱";
    fieldName.backgroundColor = [UIColor clearColor];
    fieldName.borderStyle = UITextBorderStyleNone;
    fieldName.layer.cornerRadius = 0;
    fieldName.font = [UIFont systemFontOfSize:Text_Size_Small];
    fieldName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [fieldName setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    [self adjustTextField:fieldName];
    [self.view addSubview:fieldName];
    
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake( 30, [Tool getBottom:fieldName], Screen_Width - 60, 0.5 )];
    line1.backgroundColor = Color_Gray;
    [self.view addSubview:line1];
    
    fieldPassword = [[UITextField alloc] initWithFrame:CGRectMake( 30, [Tool getBottom:fieldName] + 0.5, Screen_Width - 60, 40 )];
    fieldPassword.placeholder = @"密码";
    fieldPassword.secureTextEntry = YES;
    fieldPassword.backgroundColor = [UIColor clearColor];
    fieldPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    fieldPassword.font = [UIFont systemFontOfSize:Text_Size_Small];
    fieldPassword.layer.cornerRadius = 0;
    [fieldPassword setValue:Color_Gray forKeyPath:@"_placeholderLabel.textColor"];
    [self adjustTextField:fieldPassword];
    [self.view addSubview:fieldPassword];
    
    UIButton * buttonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLogin.frame = CGRectMake( 30, [Tool getBottom:inputView] + 30, Screen_Width - 60, 40 );
    buttonLogin.backgroundColor = Bg_Red;
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonLogin.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonLogin.layer.cornerRadius = 5.0f;
    [buttonLogin addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
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

- ( void ) doLogin
{
    BaseViewController * controller = [self.navigationController.viewControllers objectAtIndex:0];
    controller.hasRefreshed = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
