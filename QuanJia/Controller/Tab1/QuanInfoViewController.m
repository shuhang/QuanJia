//
//  QuanInfoViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/25.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "QuanInfoViewController.h"
#import "AddQuestionViewController.h"
#import "AddPostViewController.h"
#import "AddActViewController.h"

@interface QuanInfoViewController ()
{
    
}
@end

@implementation QuanInfoViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake( 0, Screen_Height - 40, Screen_Width, 40 )];
    bottomView.backgroundColor = Color_Heavy_Gray;
    [self.view addSubview:bottomView];
    
    CGFloat width = Screen_Width / 5;
    
    UIButton * buttonQuestion = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonQuestion.frame = CGRectMake( 0, 0, width, 40 );
    buttonQuestion.backgroundColor = [UIColor clearColor];
    [buttonQuestion setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonQuestion setTitleColor:Text_Red forState:UIControlStateHighlighted];
    [buttonQuestion.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro]];
    [buttonQuestion setTitle:@"\U0000F055  提问" forState:UIControlStateNormal];
    [buttonQuestion addTarget:self action:@selector(showAddQuestion) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonQuestion];
    
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake( width - 0.5, 10, 0.5, 20 )];
    line1.backgroundColor = [UIColor blackColor];
    [bottomView addSubview:line1];
    
    UIButton * buttonPost = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPost.frame = CGRectMake( width, 0, width, 40 );
    buttonPost.backgroundColor = [UIColor clearColor];
    [buttonPost setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonPost setTitleColor:Text_Red forState:UIControlStateHighlighted];
    [buttonPost.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro]];
    [buttonPost setTitle:@"\U0000F040  发帖" forState:UIControlStateNormal];
    [buttonPost addTarget:self action:@selector(showAddPost) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonPost];
    
    UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake( width * 2 - 0.5, 10, 0.5, 20 )];
    line2.backgroundColor = [UIColor blackColor];
    [bottomView addSubview:line2];
    
    UIButton * buttonPicture = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPicture.frame = CGRectMake( width * 2, 0, width, 40 );
    buttonPicture.backgroundColor = [UIColor clearColor];
    [buttonPicture setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonPicture setTitleColor:Text_Red forState:UIControlStateHighlighted];
    [buttonPicture.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro]];
    [buttonPicture setTitle:@"\U0000F03E  照片" forState:UIControlStateNormal];
    [buttonPicture addTarget:self action:@selector(showAddPicture) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonPicture];
    
    UIView * line3 = [[UIView alloc] initWithFrame:CGRectMake( width * 3 - 0.5, 10, 0.5, 20 )];
    line3.backgroundColor = [UIColor blackColor];
    [bottomView addSubview:line3];
    
    UIButton * buttonLink = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLink.frame = CGRectMake( width * 3, 0, width, 40 );
    buttonLink.backgroundColor = [UIColor clearColor];
    [buttonLink setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonLink setTitleColor:Text_Red forState:UIControlStateHighlighted];
    [buttonLink.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro]];
    [buttonLink setTitle:@"\U0000F0C1  链接" forState:UIControlStateNormal];
    [buttonLink addTarget:self action:@selector(showAddLink) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonLink];
    
    UIView * line4 = [[UIView alloc] initWithFrame:CGRectMake( width * 4 - 0.5, 10, 0.5, 20 )];
    line4.backgroundColor = [UIColor blackColor];
    [bottomView addSubview:line4];
    
    UIButton * buttonAct = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonAct.frame = CGRectMake( width * 4, 0, width, 40 );
    buttonAct.backgroundColor = [UIColor clearColor];
    [buttonAct setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonAct setTitleColor:Text_Red forState:UIControlStateHighlighted];
    [buttonAct.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro]];
    [buttonAct setTitle:@"\U0000F0F5  活动" forState:UIControlStateNormal];
    [buttonAct addTarget:self action:@selector(showAddAct) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonAct];
}

- ( void ) showAddQuestion
{
    AddQuestionViewController * controller = [AddQuestionViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- ( void ) showAddPost
{
    AddPostViewController * controller = [AddPostViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- ( void ) showAddPicture
{
    AddPostViewController * controller = [AddPostViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- ( void ) showAddLink
{
    AddPostViewController * controller = [AddPostViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- ( void ) showAddAct
{
    AddActViewController * controller = [AddActViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
