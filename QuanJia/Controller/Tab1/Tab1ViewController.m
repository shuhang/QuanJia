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
#import "AddQuestionViewController.h"
#import "AddPostViewController.h"
#import "AddActViewController.h"
#import "AddQuanViewController.h"
#import "SearchQuanViewController.h"
#import "QuanTableViewCell.h"

@interface Tab1ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView * quanTableView;
}
@end

@implementation Tab1ViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    [self setupTitle:@"首页"];
    self.view.backgroundColor = Color_Light_Gray;
    [self hideBackButton];
    
    [self judgeLoginStatus];
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width, 230)];
    bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bottomView];
    
    UIButton * buttonJoinQuan = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonJoinQuan.frame = CGRectMake( 20, 20, Screen_Width - 40, 50 );
    buttonJoinQuan.backgroundColor = [UIColor whiteColor];
    [buttonJoinQuan setTitleColor:Color_Heavy_Gray forState:UIControlStateNormal];
    [buttonJoinQuan setTitleColor:Bg_Red forState:UIControlStateHighlighted];
    [buttonJoinQuan.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
    [buttonJoinQuan setTitle:@"\U0000F002  加入圈子" forState:UIControlStateNormal];
    buttonJoinQuan.layer.cornerRadius = 5.0f;
    buttonJoinQuan.layer.borderColor = Bg_Red.CGColor;
    buttonJoinQuan.layer.borderWidth = 1;
    [buttonJoinQuan addTarget:self action:@selector(showSearchQuan) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonJoinQuan];
    
    UIButton * buttonAddQuan = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonAddQuan.frame = CGRectMake( 20, 90, Screen_Width - 40, 50 );
    buttonAddQuan.backgroundColor = [UIColor whiteColor];
    [buttonAddQuan setTitleColor:Color_Heavy_Gray forState:UIControlStateNormal];
    [buttonAddQuan setTitleColor:Bg_Red forState:UIControlStateHighlighted];
    [buttonAddQuan.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
    [buttonAddQuan setTitle:@"\U0000F067  创建圈子" forState:UIControlStateNormal];
    buttonAddQuan.layer.cornerRadius = 5.0f;
    buttonAddQuan.layer.borderColor = Bg_Red.CGColor;
    buttonAddQuan.layer.borderWidth = 1;
    [buttonAddQuan addTarget:self action:@selector(showCreateQuan) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonAddQuan];
    
    UIButton * buttonNewUser = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonNewUser.frame = CGRectMake( 20, 160, Screen_Width - 40, 50 );
    buttonNewUser.backgroundColor = [UIColor whiteColor];
    [buttonNewUser setTitleColor:Color_Heavy_Gray forState:UIControlStateNormal];
    [buttonNewUser setTitleColor:Bg_Red forState:UIControlStateHighlighted];
    [buttonNewUser.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
    [buttonNewUser setTitle:@"\U0000F0EB  新手手册" forState:UIControlStateNormal];
    buttonNewUser.layer.cornerRadius = 5.0f;
    buttonNewUser.layer.borderColor = Bg_Green.CGColor;
    buttonNewUser.layer.borderWidth = 1;
    [buttonNewUser addTarget:self action:@selector(showNewUser) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buttonNewUser];
    
    self.arrayQuan = [NSMutableArray array];
    
    quanTableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 10, Screen_Width, Screen_Height )];
    quanTableView.backgroundColor = Color_Light_Gray;
    [quanTableView registerClass:[QuanTableViewCell class] forCellReuseIdentifier:QuanCell];
    quanTableView.delegate = self;
    quanTableView.dataSource = self;
    quanTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    quanTableView.tableFooterView = bottomView;
    [self.view addSubview:quanTableView];
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

- ( void ) doRefreshSelfView
{
    for( int i = 0; i < 3; i ++ )
    {
        QuanEntity * entity = [QuanEntity new];
        entity.name = @"纯洁帝联盟";
        entity.quanWord = @"快给我打钱，几百万都行";
        entity.arrayUser = [NSMutableArray array];
        [self.arrayQuan addObject:entity];
    }
    
    [quanTableView reloadData];
}

- ( void ) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- ( void ) showNewUser
{
    
}

- ( void ) showCreateQuan
{
    AddQuanViewController * controller = [AddQuanViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- ( void ) showSearchQuan
{
    SearchQuanViewController * controller = [SearchQuanViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayQuan.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuanTableViewCell * cell = [tableView1 dequeueReusableCellWithIdentifier:QuanCell];
    if( !cell )
    {
        cell = [[QuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:QuanCell];
    }
    cell.entity = [self.arrayQuan objectAtIndex:indexPath.row];
    [cell updateCell];
    return cell;
}

- ( CGFloat ) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}

- (void)tableView:(UITableView *)tableView_ didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView_ deselectRowAtIndexPath:indexPath animated:YES];
    
    QuanInfoViewController * controller = [QuanInfoViewController new];
    controller.entity = [self.arrayQuan objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
