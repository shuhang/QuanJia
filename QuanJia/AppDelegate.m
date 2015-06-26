//
//  AppDelegate.m
//  QuanJia
//
//  Created by shuhang on 15/6/23.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "AppDelegate.h"
#import "StartViewController.h"
#import "IQKeyboardManager.h"
#import "IQSegmentedNextPrevious.h"
#import "MainViewController.h"
#import "Tab1ViewController.h"
#import "Tab2ViewController.h"
#import "Tab3ViewController.h"
#import "Tab4ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //// keyboard
    [[IQKeyboardManager sharedManager] setCanAdjustTextView:YES];
    ////
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    MainViewController * mainController = [MainViewController new];
    
    Tab1ViewController * tab1 = [Tab1ViewController new];
    Tab2ViewController * tab2 = [Tab2ViewController new];
    Tab3ViewController * tab3 = [Tab3ViewController new];
    Tab4ViewController * tab4 = [Tab4ViewController new];
    
    UINavigationController * navigation1 = [[UINavigationController alloc] initWithRootViewController:tab1];
    UINavigationController * navigation2 = [[UINavigationController alloc] initWithRootViewController:tab2];
    UINavigationController * navigation3 = [[UINavigationController alloc] initWithRootViewController:tab3];
    UINavigationController * navigation4 = [[UINavigationController alloc] initWithRootViewController:tab4];
    
    mainController.controller = [UITabBarController new];
    [mainController.controller.tabBar setBackgroundColor:[UIColor clearColor]];
    [mainController.controller.view setFrame:mainController.view.frame];
    [mainController.view addSubview:mainController.controller.view];
    
    [mainController.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]];
    
    mainController.controller.viewControllers = @[ navigation1, navigation2, navigation3, navigation4 ];
    [mainController setupTabbarItem];
    [mainController.controller setSelectedIndex:0];
    
    self.window.rootViewController = mainController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
