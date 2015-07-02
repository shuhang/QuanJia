//
//  QuanTableViewCell.h
//  QuanJia
//
//  Created by shuhang on 15/7/2.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuanEntity.h"

@interface QuanTableViewCell : UITableViewCell
{
    UIView * backgroundView;
    UILabel * labelName;
    UIImageView * imageHead;
    UIView * viewMessage;
    UIView * line;
}

@property( nonatomic, strong ) QuanEntity * entity;

- ( void ) updateCell;

@end
