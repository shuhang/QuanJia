//
//  AddQuestionViewController.h
//  QuanJia
//
//  Created by shuhang on 15/6/29.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "BaseViewController.h"

@interface AddQuestionViewController : BaseViewController

@property( nonatomic, strong ) NSString * questionTitle;
@property( nonatomic, strong ) NSString * info;
@property( nonatomic, strong ) NSString * questionId;
@property( nonatomic, assign ) BOOL isEdit;

@end
