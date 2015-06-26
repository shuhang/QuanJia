//
//  Tab3ViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/24.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "Tab3ViewController.h"

@interface Tab3ViewController ()

@end

@implementation Tab3ViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    [self setupTitle:@"设置"];
    [self hideBackButton];
}

- ( void ) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

@end
