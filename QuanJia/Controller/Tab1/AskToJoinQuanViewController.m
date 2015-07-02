//
//  AskToJoinQuanViewController.m
//  QuanJia
//
//  Created by shuhang on 15/7/1.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "AskToJoinQuanViewController.h"

@interface AskToJoinQuanViewController ()
{
    
}
@end

@implementation AskToJoinQuanViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTitle:@"申请加入"];
    self.view.backgroundColor = Color_Light_Gray;
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake( 20, 30, 200, 20)];
    label.text = @"请输入申请加入理由";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:Text_Size_Big];
    [self.view addSubview:label];
    
    UIButton * buttonFinish = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonFinish.frame = CGRectMake( 20, 200, Screen_Width - 40, 50 );
    buttonFinish.backgroundColor = Bg_Red;
    [buttonFinish setTitle:@"提交申请" forState:UIControlStateNormal];
    [buttonFinish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonFinish setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonFinish.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonFinish.layer.cornerRadius = 5.0f;
    [buttonFinish addTarget:self action:@selector(doFinish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonFinish];
}

- ( void ) doFinish
{
    
}

@end
