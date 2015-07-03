//
//  QuestionInfoView.m
//  QuanJia
//
//  Created by shuhang on 15/7/3.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "QuestionInfoView.h"
#import "MJRefresh.h"
#import "Tool.h"
#import "AnswerTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "CommentEntity.h"

@interface QuestionInfoView()
{
    UITableView * answerTableView;
    
    UIView * headerView;
}
@end

@implementation QuestionInfoView

- ( id ) initWithFrame:(CGRect)frame entity:(PostEntity *)entity
{
    if( self = [super initWithFrame:frame] )
    {
        self.backgroundColor = [UIColor whiteColor];
        self.entity = entity;
        
        [self initHeaderView];
        
        answerTableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 0, frame.size.width, frame.size.height - 60)];
        [answerTableView registerClass:[AnswerTableViewCell class] forCellReuseIdentifier:AnswerTableCell];
        [answerTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
        answerTableView.tableHeaderView = headerView;
        answerTableView.delegate = self;
        answerTableView.dataSource = self;
        answerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:answerTableView];
        
        UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake( 0, frame.size.height - 60, Screen_Width, 60 )];
        bottomView.backgroundColor = Color_Light_Gray;
        [self addSubview:bottomView];
        
        CGFloat width = ( Screen_Width - 90 ) / 3;
        
        UIButton * buttonAddAnswer = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonAddAnswer.frame = CGRectMake( 10, 10, width, 40 );
        buttonAddAnswer.backgroundColor = Bg_Red;
        [buttonAddAnswer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonAddAnswer setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [buttonAddAnswer.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
        [buttonAddAnswer setTitle:@"\U0000F055  添加回答" forState:UIControlStateNormal];
        buttonAddAnswer.layer.cornerRadius = 3.0f;
        buttonAddAnswer.layer.masksToBounds = YES;
        [bottomView addSubview:buttonAddAnswer];
        
        UIButton * buttonInvite = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonInvite.frame = CGRectMake( 10 * 2 + width, 10, width, 40 );
        buttonInvite.backgroundColor = Bg_Red;
        [buttonInvite setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonInvite setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [buttonInvite.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
        [buttonInvite setTitle:@"\U0000F099  邀请回答" forState:UIControlStateNormal];
        buttonInvite.layer.cornerRadius = 3.0f;
        buttonInvite.layer.masksToBounds = YES;
        [bottomView addSubview:buttonInvite];
        
        UIButton * buttonMark = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonMark.frame = CGRectMake( 10 * 3 + width * 2, 10, width, 40 );
        buttonMark.backgroundColor = Bg_Red;
        [buttonMark setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonMark setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [buttonMark.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
        [buttonMark setTitle:@"\U0000F017  标记" forState:UIControlStateNormal];
        buttonMark.layer.cornerRadius = 3.0f;
        buttonMark.layer.masksToBounds = YES;
        [bottomView addSubview:buttonMark];
        
        UIButton * buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonMore.frame = CGRectMake( 10 * 4 + width * 3, 10, 40, 40 );
        buttonMore.backgroundColor = Bg_Red;
        [buttonMore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonMore setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [buttonMore.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
        [buttonMore setTitle:@"\U0000F141" forState:UIControlStateNormal];
        buttonMore.layer.cornerRadius = 20;
        buttonMore.layer.masksToBounds = YES;
        [bottomView addSubview:buttonMore];
        
        [self judgeFooter];
    }
    return self;
}

- ( void ) initHeaderView
{
    headerView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width, 0 )];
    
    userView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width, 60 )];
    [headerView addSubview:userView];
    
    imageHead = [[UIImageView alloc] initWithFrame:CGRectMake( 10, 10, 50, 50)];
    imageHead.layer.masksToBounds = YES;
    imageHead.layer.cornerRadius = 25;
    [userView addSubview:imageHead];
    
    labelName = [[UILabel alloc] initWithFrame:CGRectZero];
    labelName.font = [UIFont systemFontOfSize:Text_Size_Small];
    labelName.textColor = [UIColor blackColor];
    [userView addSubview:labelName];
    
    labelSex = [[UILabel alloc] initWithFrame:CGRectZero];
    labelSex.textColor = Bg_Red;
    labelSex.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Small];
    labelSex.text = @"\U0000F182";
    [userView addSubview:labelSex];
    
    labelTime = [[UILabel alloc] initWithFrame:CGRectMake( Screen_Width - 100, 12, 90, 15)];
    labelTime.textAlignment = NSTextAlignmentRight;
    labelTime.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelTime.textColor = Color_Gray;
    [userView addSubview:labelTime];
    
    labelUserInfo = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:imageHead] + 10, 30, 200, 15)];
    labelUserInfo.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelUserInfo.textColor = Color_Gray;
    [userView addSubview:labelUserInfo];
    
    labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    labelTitle.font = [UIFont systemFontOfSize:Text_Size_Big];
    labelTitle.textColor = [UIColor blackColor];
    labelTitle.numberOfLines = 3;
    labelTitle.lineBreakMode = NSLineBreakByWordWrapping;
    [headerView addSubview:labelTitle];
    
    labelInfo = [[UILabel alloc] initWithFrame:CGRectZero];
    labelInfo.font = [UIFont systemFontOfSize:Text_Size_Small];
    labelInfo.textColor = [UIColor blackColor];
    labelInfo.numberOfLines = 0;
    labelInfo.lineBreakMode = NSLineBreakByWordWrapping;
    [headerView addSubview:labelInfo];
    
    commentView = [[UIView alloc] initWithFrame:CGRectZero];
    [headerView addSubview:commentView];
    
    labelCommentCount = [[UILabel alloc] initWithFrame:CGRectMake( 10, 10, Screen_Width - 20, 15)];
    labelCommentCount.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelCommentCount.textColor = Color_Gray;
    [commentView addSubview:labelCommentCount];
    
    lineComment1 = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:labelCommentCount] + 5, Screen_Width - 20, 0.5)];
    lineComment1.backgroundColor = Color_Light_Gray;
    [commentView addSubview:lineComment1];
    
    imageCommentHead1 = [[UIImageView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:lineComment1] + 10, 20, 20)];
    imageCommentHead1.layer.masksToBounds = YES;
    imageCommentHead1.layer.cornerRadius = 10;
    [commentView addSubview:imageCommentHead1];
    
    labelCommenName1 = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:imageCommentHead1] + 15, [Tool getBottom:lineComment1], 200, 15)];
    labelCommenName1.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelCommenName1.textColor = Color_Gray;
    [commentView addSubview:labelCommenName1];
    
    labelCommenInfo1 = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:imageCommentHead1] + 15, [Tool getBottom:labelCommenName1], Screen_Width - [Tool getRight:imageCommentHead1] - 25, 15)];
    labelCommenInfo1.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelCommenInfo1.textColor = Color_Gray;
    labelCommenInfo1.lineBreakMode = NSLineBreakByTruncatingTail;
    [commentView addSubview:labelCommenInfo1];
    
    lineComment2 = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:labelCommenInfo1] + 5, Screen_Width - 20, 0.5)];
    lineComment2.backgroundColor = Color_Light_Gray;
    [commentView addSubview:lineComment2];
    
    imageCommentHead2 = [[UIImageView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:lineComment2] + 10, 20, 20)];
    imageCommentHead2.layer.masksToBounds = YES;
    imageCommentHead2.layer.cornerRadius = 10;
    [commentView addSubview:imageCommentHead2];
    
    labelCommenName2 = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:imageCommentHead2] + 15, [Tool getBottom:lineComment2], 200, 15)];
    labelCommenName2.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelCommenName2.textColor = Color_Gray;
    [commentView addSubview:labelCommenName2];
    
    labelCommenInfo2 = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:imageCommentHead2] + 15, [Tool getBottom:labelCommenName2], Screen_Width - [Tool getRight:imageCommentHead2] - 25, 15)];
    labelCommenInfo2.font = [UIFont systemFontOfSize:Text_Size_Micro];
    labelCommenInfo2.textColor = Color_Gray;
    labelCommenInfo2.lineBreakMode = NSLineBreakByTruncatingTail;
    [commentView addSubview:labelCommenInfo2];
    
    lineComment3 = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:labelCommenInfo2] + 5, Screen_Width - 20, 0.5)];
    lineComment3.backgroundColor = Color_Light_Gray;
    [commentView addSubview:lineComment3];
    
    buttonComment = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonComment.frame = CGRectZero;
    buttonComment.layer.masksToBounds = YES;
    buttonComment.layer.cornerRadius = 5;
    buttonComment.backgroundColor = Deep_Yellow;
    buttonComment.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Small];
    [buttonComment setTitle:@"\U0000F086  追问/灌水" forState:UIControlStateNormal];
    [buttonComment setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonComment setTitleColor:Bg_Red forState:UIControlStateHighlighted];
    [commentView addSubview:buttonComment];
    
    lineAnswer1 = [[UIView alloc] initWithFrame:CGRectZero];
    lineAnswer1.backgroundColor = Color_Light_Gray;
    [headerView addSubview:lineAnswer1];
    
    labelAnswerCount = [[UILabel alloc] initWithFrame:CGRectZero];
    labelAnswerCount.font = [UIFont systemFontOfSize:Text_Size_Small];
    labelAnswerCount.textColor = [UIColor blackColor];
    [headerView addSubview:labelAnswerCount];
    
    lineAnswer2 = [[UIView alloc] initWithFrame:CGRectZero];
    lineAnswer2.backgroundColor = Color_Light_Gray;
    [headerView addSubview:lineAnswer2];
}

- ( void ) updateHeader
{
    [imageHead sd_setImageWithURL:[NSURL URLWithString: self.entity.userHeadUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
    
    labelName.frame = CGRectMake( [Tool getRight:imageHead] + 15, 10, self.entity.userName.length * 13, 20 );
    labelName.text = self.entity.userName;
    
    labelSex.frame = CGRectMake( [Tool getRight:labelName] + 15, 12, 15, 15 );
    labelTime.text = self.entity.createTime;
    labelUserInfo.text = self.entity.userInfo;
    
    labelTitle.frame = CGRectMake( 10, [Tool getBottom:userView] + 10, Screen_Width - 20, 0 );
    labelTitle.attributedText = [Tool getModifyString:self.entity.postTitle];
    [labelTitle sizeToFit];
    
    labelInfo.frame = CGRectMake( 20, [Tool getBottom:labelTitle] + 10, Screen_Width - 40, 0 );
    labelInfo.attributedText = [Tool getModifyString:self.entity.postInfo];
    [labelInfo sizeToFit];
    
    int commentCount = self.entity.arrayComment.count;
    labelCommentCount.text = [NSString stringWithFormat:@"问题的评论 %d （逆序）", commentCount];
    if( commentCount == 0 )
    {
        imageCommentHead1.hidden = YES;
        labelCommenName1.hidden = YES;
        labelCommenInfo1.hidden = YES;
        lineComment2.hidden = YES;
        imageCommentHead2.hidden = YES;
        labelCommenName2.hidden = YES;
        labelCommenInfo2.hidden = YES;
        lineComment3.hidden = YES;
        
        buttonComment.frame = CGRectMake( Screen_Width - 90, [Tool getBottom:lineComment1] + 50, 80, 30 );
        commentView.frame = CGRectMake( 0, [Tool getBottom:labelInfo] + 10, Screen_Width, 130 );
    }
    else
    {
        imageCommentHead1.hidden = NO;
        labelCommenName1.hidden = NO;
        labelCommenInfo1.hidden = NO;
        lineComment2.hidden = NO;
        CommentEntity * comment1 = [self.entity.arrayComment objectAtIndex:0];
        [imageCommentHead1 sd_setImageWithURL:[NSURL URLWithString:comment1.userHeadUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
        labelCommenName1.text = comment1.userName;
        labelCommenInfo1.text = comment1.info;
        
        if( commentCount == 1 )
        {
            imageCommentHead2.hidden = YES;
            labelCommenName2.hidden = YES;
            labelCommenInfo2.hidden = YES;
            lineComment3.hidden = YES;
            
            buttonComment.frame = CGRectMake( Screen_Width - 90, [Tool getBottom:lineComment2] + 15, 80, 30 );
            commentView.frame = CGRectMake( 0, [Tool getBottom:labelInfo] + 10, Screen_Width, 130 );
        }
        else
        {
            imageCommentHead2.hidden = NO;
            labelCommenName2.hidden = NO;
            labelCommenInfo2.hidden = NO;
            lineComment3.hidden = NO;
            
            CommentEntity * comment2 = [self.entity.arrayComment objectAtIndex:1];
            [imageCommentHead2 sd_setImageWithURL:[NSURL URLWithString:comment2.userHeadUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
            labelCommenName2.text = comment2.userName;
            labelCommenInfo2.text = comment2.info;
            
            buttonComment.frame = CGRectMake( Screen_Width - 90, [Tool getBottom:lineComment3] + 15, 80, 30 );
            commentView.frame = CGRectMake( 0, [Tool getBottom:labelInfo] + 10, Screen_Width, 180 );
        }
    }
    
    lineAnswer1.frame = CGRectMake( 0, [Tool getBottom:commentView], Screen_Width, 10 );
    labelAnswerCount.frame = CGRectMake( 10, [Tool getBottom:lineAnswer1] + 10, 200, 20 );
    labelAnswerCount.text = [NSString stringWithFormat:@"回答 %d （逆序）", self.entity.answerCount];
    
    lineAnswer2.frame = CGRectMake( 10, [Tool getBottom:labelAnswerCount] + 10, Screen_Width - 20, 0.5 );
    
    headerView.frame = CGRectMake( 0, 0, Screen_Width, [Tool getBottom:lineAnswer2] );
}

- ( void ) judgeFooter
{
    if( self.entity.arrayAnswer.count == self.entity.answerCount )
    {
        [answerTableView removeFooter];
    }
    else
    {
        [answerTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    }
}

- ( void ) headerRereshing
{
    
}

- ( void ) footerRereshing
{
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entity.arrayAnswer.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnswerTableViewCell * cell = [tableView1 dequeueReusableCellWithIdentifier:AnswerTableCell];
    if( !cell )
    {
        cell = [[AnswerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AnswerTableCell];
    }
    return cell;
}

- ( CGFloat ) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView_ didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView_ deselectRowAtIndexPath:indexPath animated:YES];
}

@end
