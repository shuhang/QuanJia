//
//  ViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/23.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "StartViewController.h"
#import "Tool.h"
#import "LoginViewController.h"
#import "SignViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = Bg_Red;
    self.tabBarController.tabBar.hidden = YES;
    
    UILabel * labelUp = [[UILabel alloc] initWithFrame:CGRectMake( 0, 100, Screen_Width, 30 )];
    labelUp.font = [UIFont systemFontOfSize:Text_Size_Super_Big];
    labelUp.textColor = [UIColor whiteColor];
    labelUp.text = @"圈+";
    labelUp.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelUp];
    
    UILabel * labelDown = [[UILabel alloc] initWithFrame:CGRectMake( 0, 160, Screen_Width, 25 )];
    labelDown.font = [UIFont systemFontOfSize:Text_Size_Big];
    labelDown.textColor = [UIColor whiteColor];
    labelDown.text = @"圈子社交利器";
    labelDown.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelDown];
    
    UIButton * buttonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLogin.frame = CGRectMake( 30, [Tool getBottom:labelDown] + 90, Screen_Width - 60, 40 );
    buttonLogin.backgroundColor = [UIColor whiteColor];
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonLogin setTitleColor:Text_Red forState:UIControlStateHighlighted];
    buttonLogin.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonLogin.layer.cornerRadius = 4.0f;
    [buttonLogin addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonLogin];
    
    UIButton * buttonSign = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonSign.frame = CGRectMake( 30, [Tool getBottom:buttonLogin] + 30, Screen_Width - 60, 40 );
    buttonSign.backgroundColor = [UIColor whiteColor];
    [buttonSign setTitle:@"注册" forState:UIControlStateNormal];
    [buttonSign setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonSign setTitleColor:Text_Red forState:UIControlStateHighlighted];
    buttonSign.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonSign.layer.cornerRadius = 4.0f;
    [buttonSign addTarget:self action:@selector(doSign) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSign];
}

- ( void ) doLogin
{
    LoginViewController * controller = [LoginViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- ( void ) doSign
{
    SignViewController * controller = [SignViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- ( void ) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- ( void ) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

@end
