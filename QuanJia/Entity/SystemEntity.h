//
//  SystemEntity.h
//  QuanJia
//
//  Created by shuhang on 15/7/3.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemEntity : NSObject

@property( nonatomic, strong ) NSString * systemId;
@property( nonatomic, assign ) int type;
@property( nonatomic, strong ) NSString * createTime;
@property( nonatomic, strong ) NSString * info;
@property( nonatomic, strong ) NSString * userHeadUrl;
@property( nonatomic, strong ) NSString * userName;
@property( nonatomic, strong ) NSString * userId;
@property( nonatomic, strong ) NSMutableArray * arrayPraise;
@property( nonatomic, strong ) NSMutableArray * arrayComment;

@end
