//
//  SystemTableViewCell.m
//  QuanJia
//
//  Created by shuhang on 15/7/3.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "SystemTableViewCell.h"
#import "Tool.h"
#import "UIImageView+WebCache.h"

@implementation SystemTableViewCell

- ( id ) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] )
    {
        self.backgroundColor = [UIColor clearColor];
        
        backgroundView = [[UIView alloc] initWithFrame:CGRectMake( 10, 5, Screen_Width - 20, 0 )];
        backgroundView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backgroundView];
        
        UILabel * topLabel = [[UILabel alloc] initWithFrame:CGRectMake( 10, 10, 30, 30 )];
        topLabel.layer.masksToBounds = YES;
        topLabel.layer.cornerRadius = 15;
        topLabel.textAlignment = NSTextAlignmentCenter;
        topLabel.font = [UIFont fontWithName:@"FontAwesome" size:17];
        topLabel.textColor = [UIColor whiteColor];
        topLabel.text = @"\U0000F06C";
        topLabel.backgroundColor = Bg_Red;
        [backgroundView addSubview:topLabel];
        
        UILabel * topName = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:topLabel] + 15, 10, 100, 25)];
        topName.textColor = Text_Red;
        topName.font = [UIFont systemFontOfSize:Text_Size_Big];
        topName.text = @"圈加系统";
        [backgroundView addSubview:topName];
        
        labelTime = [[UILabel alloc] initWithFrame:CGRectMake( backgroundView.frame.size.width - 100, 12, 90, 15)];
        labelTime.textColor = Color_Gray;
        labelTime.textAlignment = NSTextAlignmentRight;
        labelTime.font = [UIFont systemFontOfSize:Text_Size_Micro];
        [backgroundView addSubview:labelTime];
        
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:topLabel] + 5, Screen_Width - 40, 0.5)];
        line.backgroundColor = Color_Light_Gray;
        [backgroundView addSubview:line];
        
        imageHead = [[UIImageView alloc] initWithFrame:CGRectMake( ( backgroundView.frame.size.width - 50 ) / 2, [Tool getBottom:line] + 10, 50, 50)];
        imageHead.layer.masksToBounds = YES;
        imageHead.layer.cornerRadius = 25;
        [backgroundView addSubview:imageHead];
        
        UILabel * tempLabel = [[UILabel alloc] initWithFrame:CGRectMake( imageHead.frame.origin.x + 42, [Tool getBottom:line] + 10, 16, 16 )];
        tempLabel.layer.masksToBounds = YES;
        tempLabel.layer.cornerRadius = 8;
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.font = [UIFont fontWithName:@"FontAwesome" size:8];
        tempLabel.textColor = [UIColor whiteColor];
        tempLabel.text = @"\U0000F004";
        tempLabel.backgroundColor = Bg_Red;
        [backgroundView addSubview:tempLabel];
        
        labelTitle = [[UILabel alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:imageHead] + 10, Screen_Width - 40, 0)];
        labelTitle.textColor = [UIColor blackColor];
        labelTitle.font = [UIFont systemFontOfSize:Text_Size_Big];
        labelTitle.lineBreakMode = NSLineBreakByTruncatingTail | NSLineBreakByWordWrapping;
        labelTitle.numberOfLines = 3;
        [backgroundView addSubview:labelTitle];
        
        CGFloat width = backgroundView.frame.size.width / 4;
        
        labelPraise = [[UILabel alloc] initWithFrame:CGRectMake( 0, [Tool getBottom:labelTitle] + 10, width, 15)];
        labelPraise.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelPraise.textColor = Color_Gray;
        [backgroundView addSubview:labelPraise];
        
        labelComment = [[UILabel alloc] initWithFrame:CGRectMake( width, [Tool getBottom:labelTitle] + 10, width, 15)];
        labelComment.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelComment.textColor = Color_Gray;
        [backgroundView addSubview:labelComment];
    }
    return self;
}

- ( void ) updateCell
{
    labelTime.text = self.entity.createTime;
    [imageHead sd_setImageWithURL:[NSURL URLWithString: self.entity.userHeadUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
    
    NSString * title = [NSString stringWithFormat:@"%@ %@", self.entity.userName, self.entity.info];
    [labelTitle setAttributedText:[Tool getModifyString:title]];
    [labelTitle sizeToFit];
    
    CGFloat width = backgroundView.frame.size.width / 4;
    
    labelPraise.text = [NSString stringWithFormat:@"     \U0000F18C  鲜花  %lu", (unsigned long)self.entity.arrayPraise.count];
    labelPraise.frame = CGRectMake( 0, [Tool getBottom:labelTitle] + 10, width, 15);
    labelComment.text = [NSString stringWithFormat:@"  \U0000F086  评论  %lu", (unsigned long)self.entity.arrayComment.count];
    labelComment.frame = CGRectMake( width, [Tool getBottom:labelTitle] + 10, width, 15);
    
    backgroundView.frame = CGRectMake( 10, 5, Screen_Width - 20, 148 + labelTitle.frame.size.height );
}

@end
