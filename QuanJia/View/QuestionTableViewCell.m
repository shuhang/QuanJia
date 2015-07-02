//
//  QuestionTableViewCell.m
//  QuanJia
//
//  Created by shuhang on 15/6/25.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "QuestionTableViewCell.h"
#import "Tool.h"
#import "UIImageView+WebCache.h"
#import "LinkEntity.h"

@implementation QuestionTableViewCell

-( id ) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] )
    {
        self.backgroundColor = [UIColor clearColor];
        
        backgroundView = [[UIView alloc] initWithFrame:CGRectMake( 10, 5, Screen_Width - 20, 0 )];
        backgroundView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backgroundView];
        
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake( 10, 10, 30, 30)];
        headImageView.layer.masksToBounds = YES;
        headImageView.layer.cornerRadius = 15;
        [backgroundView addSubview:headImageView];
        
        labelName = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:headImageView] + 10, 10, 100, 20)];
        labelName.textColor = [UIColor blackColor];
        labelName.font = [UIFont systemFontOfSize:Text_Size_Small];
        [backgroundView addSubview:labelName];
        
        labelTime = [[UILabel alloc] initWithFrame:CGRectMake( backgroundView.frame.size.width - 100, 10, 100, 15)];
        labelTime.textColor = Color_Gray;
        labelTime.font = [UIFont systemFontOfSize:Text_Size_Micro];
        [backgroundView addSubview:labelTime];
        
        line = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:headImageView] + 5, backgroundView.frame.size.width - 20, 0.5)];
        line.backgroundColor = Color_Gray;
        [backgroundView addSubview:line];
        
        viewLink = [[UIView alloc] initWithFrame:CGRectZero];
        viewLink.backgroundColor = Color_Light_Gray;
        [backgroundView addSubview:viewLink];
        
        viewPicture = [[UIView alloc] initWithFrame:CGRectZero];
        [backgroundView addSubview:viewPicture];
        
        viewVoice = [[UIView alloc] initWithFrame:CGRectZero];
        [backgroundView addSubview:viewVoice];
        
        labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        labelTitle.textColor = [UIColor blackColor];
        labelTitle.font = [UIFont systemFontOfSize:Text_Size_Big];
        labelTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        labelTitle.numberOfLines = 2;
        [backgroundView addSubview:labelTitle];
        
        labelAnswer = [[UILabel alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:labelTitle] + 10, 70, 15)];
        labelAnswer.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelAnswer.textColor = Color_Gray;
        [backgroundView addSubview:labelAnswer];
        
        labelPraise = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:labelAnswer] + 10, [Tool getBottom:labelTitle] + 10, 70, 15)];
        labelPraise.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelPraise.textColor = Color_Gray;
        [backgroundView addSubview:labelPraise];
        
        labelComment = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:labelPraise] + 10, [Tool getBottom:labelTitle] + 10, 70, 15)];
        labelComment.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelComment.textColor = Color_Gray;
        [backgroundView addSubview:labelComment];
    }
    return self;
}

- ( void ) updateCell
{
    [headImageView sd_setImageWithURL:[NSURL URLWithString: self.entity.userHeadUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
    labelName.text = self.entity.userName;
    labelTime.text = self.entity.createTime;
    
    if( self.entity.arrayLink.count > 0 )
    {
        [viewLink removeFromSuperview];
        viewLink = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:line] + 10, backgroundView.frame.size.width - 20, 70 )] ;
        [backgroundView addSubview:viewLink];
        
        UIImageView * linkImageView = [[UIImageView alloc] initWithFrame:CGRectMake( 10, 10, 50, 50 )];
        [viewLink addSubview:linkImageView];
        
        LinkEntity * linkEntity = [self.entity.arrayLink objectAtIndex:0];
        [linkImageView sd_setImageWithURL:[NSURL URLWithString:linkEntity.imageUrl] placeholderImage:[UIImage imageNamed:@"picture"]];
        
        UILabel * linkLabel = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:linkImageView] + 10, 10, viewLink.frame.size.width - 80, 50)];
        linkLabel.backgroundColor = [UIColor blueColor];
        linkLabel.font = [UIFont systemFontOfSize:Text_Size_Big];
        linkLabel.numberOfLines = 2;
        linkLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [linkLabel setAttributedText:[Tool getModifyString:linkEntity.title]];
        [viewLink addSubview:linkLabel];
    }
    else
    {
        viewLink.frame = CGRectZero;
    }
    
    if( self.entity.arrayPicture.count > 0 )
    {
        [viewPicture removeFromSuperview];
        if( self.entity.arrayLink.count > 0 )
        {
            viewPicture = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:viewLink] + 10, backgroundView.frame.size.width - 20, 70 )] ;
        }
        else
        {
            viewPicture = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:line] + 10, backgroundView.frame.size.width - 20, 70 )] ;
        }
    }
    else
    {
        viewPicture.frame = CGRectZero;
    }
    
    
}

@end
