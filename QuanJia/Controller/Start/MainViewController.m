//
//  MainViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/24.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- ( void ) setupTabbarItem
{
    NSArray * array = self.controller.viewControllers;
    NSMutableArray * arrayNew = [NSMutableArray new];
    [array enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop)
     {
         UITabBarItem * item = nil;
         switch( idx )
         {
             case 0:
             {
                 item = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tab1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab1_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                 break;
             }
             case 1:
             {
                 item = [[UITabBarItem alloc] initWithTitle:@"消息" image:[[UIImage imageNamed:@"tab2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab2_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                 break;
             }
             case 2:
             {
                 item = [[UITabBarItem alloc] initWithTitle:@"设置" image:[[UIImage imageNamed:@"tab3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab3_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                 break;
             }
             case 3:
             {
                 item = [[UITabBarItem alloc] initWithTitle:@"我" image:[[UIImage imageNamed:@"tab4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab4_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                 break;
             }
         }
         viewController.tabBarItem = item;
         [arrayNew addObject:viewController];
     }];
    self.controller.viewControllers = arrayNew;

    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:Color_With_Rgb( 96, 164, 222, 1 ), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18], NSFontAttributeName, [UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
//    
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

@end
