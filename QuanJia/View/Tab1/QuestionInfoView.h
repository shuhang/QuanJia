//
//  QuestionInfoView.h
//  QuanJia
//
//  Created by shuhang on 15/7/3.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostEntity.h"

@interface QuestionInfoView : UIView<UITableViewDataSource, UITableViewDelegate>
{
    UIView * userView;
    UIImageView * imageHead;
    UILabel * labelName;
    UILabel * labelSex;
    UILabel * labelTime;
    UILabel * labelUserInfo;
    UILabel * labelTitle;
    UILabel * labelInfo;
    
    UIView * commentView;
    UILabel * labelCommentCount;
    UIImageView * imageCommentHead1;
    UILabel * labelCommenName1;
    UILabel * labelCommenInfo1;
    UIImageView * imageCommentHead2;
    UILabel * labelCommenName2;
    UILabel * labelCommenInfo2;
    
    UIButton * buttonComment;
    UILabel * labelAnswerCount;
    
    UIView * lineComment1;
    UIView * lineComment2;
    UIView * lineComment3;
    
    UIView * lineAnswer1;
    UIView * lineAnswer2;
}

@property( nonatomic, strong ) PostEntity * entity;

- ( void ) updateHeader;
- ( void ) updateTable;
- ( id ) initWithFrame:(CGRect)frame entity:( PostEntity * ) entity;

@end
