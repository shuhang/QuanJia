//
//  Tool.m
//  QuanJia
//
//  Created by shuhang on 15/6/23.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ ( CGFloat ) getRight : ( UIView * ) view
{
    return view.frame.origin.x + view.frame.size.width;
}

+ ( CGFloat ) getBottom : ( UIView * ) view
{
    return view.frame.origin.y + view.frame.size.height;
}

@end
