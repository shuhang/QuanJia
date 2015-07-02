//
//  QuanEntity.h
//  QuanJia
//
//  Created by shuhang on 15/7/2.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuanEntity : NSObject

@property( nonatomic, strong ) NSString * quanId;
@property( nonatomic, strong ) NSString * name;
@property( nonatomic, strong ) NSString * imageUrl;
@property( nonatomic, strong ) NSString * quanWord;
@property( nonatomic, strong ) NSMutableArray * arrayUser;
@property( nonatomic, assign ) int messageCount;

@end
