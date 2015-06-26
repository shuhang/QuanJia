//
//  QuanInfoViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/25.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "QuanInfoViewController.h"

@interface QuanInfoViewController ()
{
    
}
@end

@implementation QuanInfoViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake( 0, Screen_Height - 50, Screen_Width, 50 )];
    bottomView.backgroundColor = Color_Light_Gray;
    [self.view addSubview:bottomView];
    
    UIButton * buttonQuestion = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonQuestion.frame = CGRectMake( 0, 0, Screen_Width / 5, 50 );
    buttonQuestion.backgroundColor = [UIColor clearColor];
    [buttonQuestion setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonQuestion setTitleColor:Text_Red forState:UIControlStateHighlighted];
    [buttonQuestion setTitle:@"提问" forState:UIControlStateNormal];
    buttonQuestion.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    [buttonQuestion setImage:[UIImage imageNamed:@"yuan"] forState:UIControlStateNormal];
    [buttonQuestion setImageEdgeInsets:UIEdgeInsetsMake( 20, 20, 20, 30 )];
    [bottomView addSubview:buttonQuestion];
}

@end
