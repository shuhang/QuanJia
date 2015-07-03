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
#import "MJRefresh.h"
#import "PostEntity.h"
#import "PostTableViewCell.h"
#import "Tool.h"
#import "LinkEntity.h"
#import "SystemTableViewCell.h"
#import "SystemEntity.h"
#import "QuestionInfoViewController.h"

@interface QuanInfoViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView * dataTableView;
}
@end

@implementation QuanInfoViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTitle:self.entity.name];
    
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake( 10, 0, Screen_Width - 10, 35)];
    topView.backgroundColor = Color_Light_Gray;
    UILabel * labelTitle = [[UILabel alloc] initWithFrame:CGRectMake( 10, 0, Screen_Width - 20, 30 )];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelTitle.text = self.entity.quanWord;
    labelTitle.backgroundColor = Color_Heavy_Gray;
    [topView addSubview:labelTitle];
    
    self.arrayData = [NSMutableArray array];
    
    dataTableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width, Screen_Height + 10 )];
    dataTableView.backgroundColor = Color_Light_Gray;
    dataTableView.delegate = self;
    dataTableView.dataSource = self;
    dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    dataTableView.tableHeaderView = topView;
    [dataTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [dataTableView headerBeginRefreshing];
    [self.view addSubview:dataTableView];
    
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

- ( void ) headerRereshing
{
    for( int i = 0; i < 5; i ++ )
    {
        PostEntity * entity = [PostEntity new];
        entity.type = i % 3;
        entity.postTitle = @"这是标题这是标题这是标题这是标题这是标题这是标题这是标题这是标题这是标题这是标题这是标题aa";
        entity.postInfo = @"这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容aa";
        entity.userName = @"纯洁帝完美";
        entity.userHeadUrl = @"http://118.186.214.42:5000/images/cc84b8f0-a30d-11e4-94bd-05c2c1bd021c.jpeg";
        entity.createTime = @"2015-07-02 11:11";
        entity.actPlace = @"银河王朝大酒店";
        entity.actStartTime = @"2015-07-03 11:11";
        entity.actEndTime = @"2015-07-03 11:11";
        entity.arrayAnswer = [NSMutableArray arrayWithObjects:@"", @"", @"", nil];
        entity.arrayComment = [NSMutableArray arrayWithObjects:@"", @"", @"", nil];
        entity.arrayPraise = [NSMutableArray arrayWithObjects:@"", @"", @"", nil];
        entity.arrayActBack = [NSMutableArray arrayWithObjects:@"", @"", @"", nil];
        entity.arrayActJoin = [NSMutableArray array];
        for( int i = 0; i < 8; i ++ )
        {
            [entity.arrayActJoin addObject:@"http://118.186.214.42:5000/images/cc84b8f0-a30d-11e4-94bd-05c2c1bd021c.jpeg"];
        }
        
        if( i % 3 == 1 || i == 5 )
        {
            LinkEntity * link = [LinkEntity new];
            link.title = @"这就是链接的标题，这就是链接的标题";
            link.imageUrl = @"http://118.186.214.42:5000/images/cc84b8f0-a30d-11e4-94bd-05c2c1bd021c.jpeg";
            entity.arrayLink = [NSMutableArray arrayWithObjects:link, nil];
        }
        else
        {
            entity.arrayLink = [NSMutableArray array];
        }
        
        entity.arrayPicture = [NSMutableArray array];
        if( i % 3 == 2 )
        {
            for( int i = 0; i < 5; i ++ )
            {
                [entity.arrayPicture addObject:@"http://118.186.214.42:5000/images/cc84b8f0-a30d-11e4-94bd-05c2c1bd021c.jpeg"];
            }
        }
        
        entity.arrayVoice = [NSMutableArray array];
        if( i == 5 || i == 4 || i == 0 )
        {
            [entity.arrayVoice addObject:@""];
        }
        
        [self.arrayData addObject:entity];
    }
    
    PostEntity * entity = [PostEntity new];
    entity.type = 3;
    SystemEntity * system = [SystemEntity new];
    system.createTime = @"2015-07-03 11:11";
    system.userHeadUrl = @"http://118.186.214.42:5000/images/cc84b8f0-a30d-11e4-94bd-05c2c1bd021c.jpeg";
    system.info = @"已累计发布10次活动，为本群做出了卓越贡献，特授予1级活动达人称号";
    system.userName = @"纯洁帝完美";
    system.arrayPraise = [NSMutableArray arrayWithObjects:@"", nil];
    system.arrayComment = [NSMutableArray arrayWithObjects:@"", @"", nil];
    entity.systemEntity = system;
    [self.arrayData addObject:entity];
    
    [dataTableView reloadData];
    [dataTableView headerEndRefreshing];
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

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostEntity * entity = [self.arrayData objectAtIndex:indexPath.row];
    if( entity.type < 3 )
    {
        PostTableViewCell * cell = [tableView1 dequeueReusableCellWithIdentifier:PostTableCell];
        if( !cell )
        {
            cell = [[PostTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PostTableCell];
        }
        cell.entity = entity;
        [cell updateCell];
        return cell;
    }
    else
    {
        SystemTableViewCell * cell = [tableView1 dequeueReusableCellWithIdentifier:SystemTableCell];
        if( !cell )
        {
            cell = [[SystemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SystemTableCell];
        }
        cell.entity = entity.systemEntity;
        [cell updateCell];
        return cell;
    }
}

- ( CGFloat ) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostEntity * entity = [self.arrayData objectAtIndex:indexPath.row];
    if( entity.type < 3 )
    {
        UILabel * tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tempLabel.font = [UIFont systemFontOfSize:Text_Size_Big];
        tempLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        tempLabel.numberOfLines = 2;
        tempLabel.frame = CGRectMake( 20, 0, Screen_Width - 40, 0 );
        if( entity.type == 1 )
        {
            [tempLabel setAttributedText:[Tool getModifyString:entity.postInfo]];
        }
        else
        {
            [tempLabel setAttributedText:[Tool getModifyString:entity.postTitle]];
        }
        [tempLabel sizeToFit];
        CGFloat height = 100 + tempLabel.frame.size.height;
        
        if( entity.arrayLink.count == 0 && entity.arrayPicture.count == 0 && entity.arrayVoice.count == 0 )
        {
            height += 3;
        }
        else
        {
            height += 18;
            if( entity.arrayLink.count > 0 )
            {
                height += 70;
            }
            if( entity.arrayPicture.count > 0 )
            {
                height += 50;
                if( entity.arrayLink.count > 0 ) height += 5;
            }
            if( entity.arrayVoice.count > 0 )
            {
                height += 40;
                if( entity.arrayLink > 0 ) height += 10;
                if( entity.arrayPicture.count > 0 ) height += 5;
                
                if( entity.arrayLink.count == 0 && entity.arrayPicture.count == 0 ) height -= 10;
            }
        }
        if( entity.type == 2 ) height += 80;
        return height;
    }
    else
    {
        UILabel * tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tempLabel.font = [UIFont systemFontOfSize:Text_Size_Big];
        tempLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        tempLabel.numberOfLines = 3;
        tempLabel.frame = CGRectMake( 20, 0, Screen_Width - 40, 0 );
        [tempLabel setAttributedText:[Tool getModifyString:[NSString stringWithFormat:@"%@ %@", entity.systemEntity.userName, entity.systemEntity.info]]];
        [tempLabel sizeToFit];
        return 158 + tempLabel.frame.size.height;
    }
}

- (void)tableView:(UITableView *)tableView_ didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView_ deselectRowAtIndexPath:indexPath animated:YES];
    
    PostEntity * entity = [self.arrayData objectAtIndex:indexPath.row];
    switch( entity.type )
    {
        case 0 :
        {
            
            break;
        }
        case 1 :
        {
            break;
        }
        case 2 :
        {
            break;
        }
        case 3 :
        {
            break;
        }
    }
}

@end
