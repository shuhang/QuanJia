//
//  QuestionEntity.h
//  QuanJia
//
//  Created by shuhang on 15/7/1.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostEntity : NSObject

/*
  0 : question
  1 : share
  2 : act
  3 : system
 */
@property( nonatomic, assign ) int type;
@property( nonatomic, strong ) NSString * postId;
@property( nonatomic, strong ) NSString * postTitle;
@property( nonatomic, strong ) NSString * postInfo;
@property( nonatomic, strong ) NSString * userId;
@property( nonatomic, strong ) NSString * userName;
@property( nonatomic, strong ) NSString * userHeadUrl;
@property( nonatomic, strong ) NSString * userInfo;
@property( nonatomic, strong ) NSString * actStartTime;
@property( nonatomic, strong ) NSString * actEndTime;
@property( nonatomic, strong ) NSString * actPlace;
@property( nonatomic, assign ) int sex;
@property( nonatomic, assign ) BOOL hasSaved;
@property( nonatomic, strong ) NSString * createTime;
@property( nonatomic, strong ) NSMutableArray * arrayPicture;
@property( nonatomic, strong ) NSMutableArray * arrayLink;
@property( nonatomic, strong ) NSMutableArray * arrayVoice;
@property( nonatomic, strong ) NSMutableArray * arrayPraise;
@property( nonatomic, strong ) NSMutableArray * arrayComment;
@property( nonatomic, strong ) NSMutableArray * arrayAnswer;
@property( nonatomic, strong ) NSMutableArray * arrayActJoin;
@property( nonatomic, strong ) NSMutableArray * arrayActBack;

@end
