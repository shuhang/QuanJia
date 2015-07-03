//
//  QuestionInfoViewController.m
//  QuanJia
//
//  Created by shuhang on 15/7/3.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "QuestionInfoViewController.h"
#import "QuestionInfoView.h"

@interface QuestionInfoViewController ()
{
    QuestionInfoView * infoView;
}
@end

@implementation QuestionInfoViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTitle:[NSString stringWithFormat:@"%@的提问", self.entity.userName]];
    [self hideNextButton];
    
    infoView = [[QuestionInfoView alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width, Screen_Height + 50 ) entity:self.entity];
    [self.view addSubview:infoView];
    
    [infoView updateHeader];
}

@end
