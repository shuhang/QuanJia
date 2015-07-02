//
//  QuanInfoViewController.h
//  QuanJia
//
//  Created by shuhang on 15/6/25.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "BaseViewController.h"
#import "QuanEntity.h"

@interface QuanInfoViewController : BaseViewController

@property( nonatomic, strong ) QuanEntity * entity;
@property( nonatomic, strong ) NSMutableArray * arrayData;

@end
