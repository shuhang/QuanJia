//
//  Tab1ViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/24.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "Tab1ViewController.h"
#import "StartViewController.h"
#import "QuanInfoViewController.h"

@interface Tab1ViewController ()

@end

@implementation Tab1ViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    [self setupTitle:@"首页"];
    [self hideBackButton];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake( ( Screen_Width - 100 ) / 2, 200, 100, 40 );
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"show quan" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showQuanInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self judgeLoginStatus];
}

- ( void ) judgeLoginStatus
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * token = [userDefaults objectForKey:@"token"];
    if( token == nil || [token isEqualToString:@""] )
    {
        [self.navigationController pushViewController:[StartViewController new] animated:NO];
    }
    else
    {
        self.hasRefreshed = NO;
    }
}

- ( void ) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- ( void ) showQuanInfo
{
    QuanInfoViewController * controller = [QuanInfoViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
