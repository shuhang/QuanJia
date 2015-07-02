//
//  QuestionTableViewCell.h
//  QuanJia
//
//  Created by shuhang on 15/6/25.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostEntity.h"

@interface PostTableViewCell : UITableViewCell
{
    UIView * backgroundView;
    UIImageView * headImageView;
    UILabel * labelName;
    UILabel * labelTime;
    UIView * line;
    UILabel * labelTitle;
    
    UILabel * labelBottom1;
    UILabel * labelBottom2;
    UILabel * labelBottom3;
    UILabel * labelBottom4;
    
    UIView * viewLink;
    UIView * viewPicture;
    UIView * viewVoice;
    UIView * viewAct;
    
    UIImageView * imageView1;
    UIImageView * imageView2;
    UIImageView * imageView3;
    UIImageView * imageView4;
    
    UIImageView * linkImageView;
    UILabel * linkLabel;
    
    UIView * voiceLine;
    UILabel * labelVoice;
    UILabel * labelPlay;
}

@property( nonatomic, strong ) PostEntity * entity;

- ( void ) updateCell;

@end
