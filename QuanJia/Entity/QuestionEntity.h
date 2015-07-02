//
//  QuestionEntity.h
//  QuanJia
//
//  Created by shuhang on 15/7/1.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionEntity : NSObject

@property( nonatomic, strong ) NSString * questionId;
@property( nonatomic, strong ) NSString * questionTitle;
@property( nonatomic, strong ) NSString * questionInfo;
@property( nonatomic, strong ) NSString * userId;
@property( nonatomic, strong ) NSString * userName;
@property( nonatomic, strong ) NSString * userHeadUrl;
@property( nonatomic, strong ) NSString * userInfo;
@property( nonatomic, assign ) int sex;
@property( nonatomic, assign ) BOOL hasSaved;
@property( nonatomic, strong ) NSString * createTime;
@property( nonatomic, strong ) NSMutableArray * arrayPicture;
@property( nonatomic, strong ) NSMutableArray * arrayLink;
@property( nonatomic, strong ) NSMutableArray * arrayPraiseUser;
@property( nonatomic, strong ) NSMutableArray * arrayComment;
@property( nonatomic, strong ) NSMutableArray * arrayAnswer;

@end
