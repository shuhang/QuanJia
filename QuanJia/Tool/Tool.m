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

+ ( NSString * ) getNowTime : ( NSDate * ) date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [formatter stringFromDate:date];
}

+ ( NSString * ) getWeekFromDate : ( NSString * ) selectDate
{
    NSInteger yearInt = [selectDate substringWithRange:NSMakeRange( 0, 4 )].integerValue;
    NSInteger monthInt = [selectDate substringWithRange:NSMakeRange( 5, 2 )].integerValue;
    NSInteger dayInt = [selectDate substringWithRange:NSMakeRange( 8, 2 )].integerValue;
    int c = 20;//世纪
    int y = yearInt -1;//年
    int d = dayInt;
    int m = monthInt;
    int w =( y + ( y / 4 ) + ( c / 4 ) - 2 * c + ( 26 * ( m + 1 ) / 10 ) + d - 1 ) % 7;
    NSString * weekDay = @"";
    switch( w )
    {
        case 0:
            weekDay = @"星期天";
            break;
        case 1:
            weekDay = @"星期一";
            break;
        case 2:
            weekDay = @"星期二";
            break;
        case 3:
            weekDay = @"星期三";
            break;
        case 4:
            weekDay = @"星期四";
            break;
        case 5:
            weekDay = @"星期五";
            break;
        case 6:
            weekDay = @"星期六";
            break;
        default:
            break;
    }
    return weekDay;
}

+ ( NSMutableAttributedString * ) getModifyString:(NSString *)value
{
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:value];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:5];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [value length])];
    return attributedString1;
}

@end
