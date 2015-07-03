//
//  CommentEntity.h
//  QuanJia
//
//  Created by shuhang on 15/7/3.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentEntity : NSObject

@property( nonatomic, strong ) NSString * commentId;
@property( nonatomic, strong ) NSString * userId;
@property( nonatomic, strong ) NSString * userName;
@property( nonatomic, strong ) NSString * userHeadUrl;
@property( nonatomic, strong ) NSString * info;
@property( nonatomic, strong ) NSString * createTime;

@end
