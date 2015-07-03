//
//  SystemTableViewCell.h
//  QuanJia
//
//  Created by shuhang on 15/7/3.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemEntity.h"

@interface SystemTableViewCell : UITableViewCell
{
    UIView * backgroundView;
    UILabel * labelTime;
    UIImageView * imageHead;
    UILabel * labelTitle;
    UILabel * labelPraise;
    UILabel * labelComment;
}

@property( nonatomic, strong ) SystemEntity * entity;

- ( void ) updateCell;

@end
