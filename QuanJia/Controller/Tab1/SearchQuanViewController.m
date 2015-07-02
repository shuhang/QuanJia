//
//  SearchQuanViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/30.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "SearchQuanViewController.h"
#import "Tool.h"
#import "SearchQuanTableViewCell.h"

@interface SearchQuanViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView * resultTableView;
    UITextField * field1;
    UITextField * field2;
    
    UILabel * labelResult;
}
@end

@implementation SearchQuanViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTitle:@"查找圈子"];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width, 220 )];
    headerView.backgroundColor = Color_Light_Gray;
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake( 10, 15, 100, 20)];
    label1.text = @"通过口令查找";
    label1.textColor = Color_Heavy_Gray;
    label1.font = [UIFont systemFontOfSize:Text_Size_Small];
    [headerView addSubview:label1];
    
    field1 = [[UITextField alloc] initWithFrame:CGRectMake( 20, 50, ( Screen_Width - 80 ) / 2, 40 )];
    field1.font = [UIFont systemFontOfSize:Text_Size_Small];
    field1.placeholder = @"中文";
    [field1 setValue:Color_Heavy_Gray forKeyPath:@"_placeholderLabel.textColor"];
    field1.clearButtonMode = UITextFieldViewModeWhileEditing;
    field1.backgroundColor = [UIColor whiteColor];
    field1.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:field1];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:field1], 50, 40, 40 )];
    label2.text = @"+";
    label2.textColor = Color_Heavy_Gray;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:Text_Size_Small];
    [headerView addSubview:label2];
    
    field2 = [[UITextField alloc] initWithFrame:CGRectMake( [Tool getRight:field1] + 40, 50, ( Screen_Width - 80 ) / 2, 40 )];
    field2.font = [UIFont systemFontOfSize:Text_Size_Small];
    field2.placeholder = @"数字";
    [field2 setValue:Color_Heavy_Gray forKeyPath:@"_placeholderLabel.textColor"];
    field2.keyboardType = UIKeyboardTypeNumberPad;
    field2.clearButtonMode = UITextFieldViewModeWhileEditing;
    field2.backgroundColor = [UIColor whiteColor];
    field2.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:field2];
    
    UIButton * buttonSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonSearch.frame = CGRectMake( 20, [Tool getBottom:field2] + 20, Screen_Width - 40, 50 );
    buttonSearch.backgroundColor = Bg_Red;
    [buttonSearch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonSearch setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [buttonSearch.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
    [buttonSearch setTitle:@"\U0000F002  精确查找" forState:UIControlStateNormal];
    buttonSearch.layer.cornerRadius = 5.0f;
    [buttonSearch addTarget:self action:@selector(doSearch) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:buttonSearch];
    
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake( 0, [Tool getBottom:buttonSearch] + 20, Screen_Width, 0.5)];
    line.backgroundColor = Color_Gray;
    [headerView addSubview:line];
    
    labelResult = [[UILabel alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:line] + 15, Screen_Width - 20, 20 )];
    labelResult.text = @"找到10个您的圈友组建的圈子";
    labelResult.textColor = Color_Heavy_Gray;
    labelResult.font = [UIFont systemFontOfSize:Text_Size_Small];
    [headerView addSubview:labelResult];
    
    [self.view addSubview:headerView];
    
    self.resultArray = [NSMutableArray array];
    for( int i = 0; i < 10; i ++ )
    {
        [self.resultArray addObject:@""];
    }
    
    resultTableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width, Screen_Height + 50 )];
    resultTableView.backgroundColor = Color_Light_Gray;
    [resultTableView registerClass:[SearchQuanTableViewCell class] forCellReuseIdentifier:SearchQuanCell];
    resultTableView.delegate = self;
    resultTableView.dataSource = self;
    resultTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    resultTableView.tableHeaderView = headerView;
    [self.view addSubview:resultTableView];
}

- ( void ) doSearch
{
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchQuanTableViewCell * cell = [tableView1 dequeueReusableCellWithIdentifier:SearchQuanCell];
    if( !cell )
    {
        cell = [[SearchQuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SearchQuanCell];
    }
    [cell updateCell];
    return cell;
}

- ( CGFloat ) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

- (void)tableView:(UITableView *)tableView_ didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView_ deselectRowAtIndexPath:indexPath animated:YES];
}

@end
