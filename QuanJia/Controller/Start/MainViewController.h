//
//  MainViewController.h
//  QuanJia
//
//  Created by shuhang on 15/6/24.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property( nonatomic, strong ) UITabBarController * controller;

- ( void ) setupTabbarItem;

@end
