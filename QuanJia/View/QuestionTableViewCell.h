//
//  QuestionTableViewCell.h
//  QuanJia
//
//  Created by shuhang on 15/6/25.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionEntity.h"

@interface QuestionTableViewCell : UITableViewCell
{
    UIView * backgroundView;
    UIImageView * headImageView;
    UILabel * labelName;
    UILabel * labelTime;
    UIView * line;
    UILabel * labelTitle;
    UILabel * labelAnswer;
    UILabel * labelPraise;
    UILabel * labelComment;
    
    UIView * viewLink;
    UIView * viewPicture;
    UIView * viewVoice;
}

@property( nonatomic, strong ) QuestionEntity * entity;

- ( void ) updateCell;

@end
