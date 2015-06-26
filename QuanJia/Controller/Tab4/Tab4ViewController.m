//
//  Tab4ViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/24.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "Tab4ViewController.h"

@interface Tab4ViewController ()

@end

@implementation Tab4ViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    [self setupTitle:@"我"];
    [self hideBackButton];
}

- ( void ) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

@end
