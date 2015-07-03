//
//  QuestionTableViewCell.m
//  QuanJia
//
//  Created by shuhang on 15/6/25.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "PostTableViewCell.h"
#import "Tool.h"
#import "UIImageView+WebCache.h"
#import "LinkEntity.h"

@implementation PostTableViewCell

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
        
        labelTime = [[UILabel alloc] initWithFrame:CGRectMake( backgroundView.frame.size.width - 100, 12, 90, 15)];
        labelTime.textColor = Color_Gray;
        labelTime.textAlignment = NSTextAlignmentRight;
        labelTime.font = [UIFont systemFontOfSize:Text_Size_Micro];
        [backgroundView addSubview:labelTime];
        
        line = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:headImageView] + 5, backgroundView.frame.size.width - 20, 0.5)];
        line.backgroundColor = Color_Gray;
        [backgroundView addSubview:line];
        
        viewLink = [[UIView alloc] initWithFrame:CGRectZero];
        viewLink.backgroundColor = Color_Light_Gray;
        linkImageView = [[UIImageView alloc] initWithFrame:CGRectMake( 10, 10, 50, 50 )];
        [viewLink addSubview:linkImageView];

        linkLabel = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:linkImageView] + 10, 10, viewLink.frame.size.width - 80, 50)];
        linkLabel.textColor = Blue_Stone;
        linkLabel.font = [UIFont systemFontOfSize:Text_Size_Big];
        linkLabel.numberOfLines = 2;
        linkLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [viewLink addSubview:linkLabel];
        [backgroundView addSubview:viewLink];
        
        viewPicture = [[UIView alloc] initWithFrame:CGRectZero];
        imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake( 0, 5, 50, 50 )];
        imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake( 60, 5, 50, 50 )];
        imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake( 120, 5, 50, 50 )];
        imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake( 180, 5, 50, 50 )];
        [viewPicture addSubview:imageView1];
        [viewPicture addSubview:imageView2];
        [viewPicture addSubview:imageView3];
        [viewPicture addSubview:imageView4];
        [backgroundView addSubview:viewPicture];
        
        viewVoice = [[UIView alloc] initWithFrame:CGRectZero];
        viewVoice.backgroundColor = Bg_Green;
        
        voiceLine = [[UIView alloc] initWithFrame:CGRectZero];
        voiceLine.backgroundColor = [UIColor whiteColor];
        
        labelVoice = [[UILabel alloc] initWithFrame:CGRectZero];
        labelVoice.textColor = [UIColor whiteColor];
        labelVoice.font = [UIFont systemFontOfSize:Text_Size_Small];
        
        labelPlay = [[UILabel alloc] initWithFrame:CGRectMake( 20, 5, 30, 30 )];
        labelPlay.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Super_Big];
        labelPlay.text = @"\U0000F144";
        labelPlay.textColor = [UIColor whiteColor];
        [viewVoice addSubview:voiceLine];
        [viewVoice addSubview:labelVoice];
        [viewVoice addSubview:labelPlay];
        [backgroundView addSubview:viewVoice];
        
        labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        labelTitle.textColor = [UIColor blackColor];
        labelTitle.font = [UIFont systemFontOfSize:Text_Size_Big];
        labelTitle.lineBreakMode = NSLineBreakByTruncatingTail | NSLineBreakByWordWrapping;
        labelTitle.numberOfLines = 2;
        [backgroundView addSubview:labelTitle];
        
        viewAct = [[UIView alloc] initWithFrame:CGRectZero];
        viewAct.backgroundColor = [UIColor clearColor];
        [backgroundView addSubview:viewAct];
        
        CGFloat width = backgroundView.frame.size.width / 4;
        
        labelBottom1 = [[UILabel alloc] initWithFrame:CGRectMake( 0, [Tool getBottom:labelTitle] + 10, width, 15)];
        labelBottom1.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelBottom1.textColor = Color_Gray;
        [backgroundView addSubview:labelBottom1];
        
        labelBottom2 = [[UILabel alloc] initWithFrame:CGRectMake( width, [Tool getBottom:labelTitle] + 10, width, 15)];
        labelBottom2.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelBottom2.textColor = Color_Gray;
        [backgroundView addSubview:labelBottom2];
        
        labelBottom3 = [[UILabel alloc] initWithFrame:CGRectMake( width * 2, [Tool getBottom:labelTitle] + 10, width, 15)];
        labelBottom3.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelBottom3.textColor = Color_Gray;
        [backgroundView addSubview:labelBottom3];
        
        labelBottom4 = [[UILabel alloc] initWithFrame:CGRectMake( width * 3, [Tool getBottom:labelTitle] + 10, width, 15)];
        labelBottom4.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelBottom4.textColor = Color_Gray;
        [backgroundView addSubview:labelBottom4];
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
        viewLink.frame = CGRectMake( 10, [Tool getBottom:line] + 10, backgroundView.frame.size.width - 20, 70 );
        viewLink.hidden = NO;
        
        LinkEntity * linkEntity = [self.entity.arrayLink objectAtIndex:0];
        [linkImageView sd_setImageWithURL:[NSURL URLWithString:linkEntity.imageUrl] placeholderImage:[UIImage imageNamed:@"picture"]];
        [linkLabel setAttributedText:[Tool getModifyString:linkEntity.title]];
        linkLabel.frame = CGRectMake( [Tool getRight:linkImageView] + 10, 10, viewLink.frame.size.width - 80, 50);
    }
    else
    {
        viewLink.hidden = YES;
    }
    
    if( self.entity.arrayPicture.count > 0 )
    {
        viewPicture.hidden = NO;
        if( self.entity.arrayLink.count > 0 )
        {
            viewPicture.frame = CGRectMake( 10, [Tool getBottom:viewLink] + 5, backgroundView.frame.size.width - 20, 50 );
        }
        else
        {
            viewPicture.frame = CGRectMake( 10, [Tool getBottom:line] + 10, backgroundView.frame.size.width - 20, 50 );
        }
        int count = self.entity.arrayPicture.count;
        if( count > 4 ) count = 4;
        
        imageView2.hidden = YES;
        imageView3.hidden = YES;
        imageView4.hidden = YES;
        
        [imageView1 sd_setImageWithURL:[NSURL URLWithString:[self.entity.arrayPicture objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"picture"]];
        if( count > 1 )
        {
            imageView2.hidden = NO;
            [imageView2 sd_setImageWithURL:[NSURL URLWithString:[self.entity.arrayPicture objectAtIndex:1]] placeholderImage:[UIImage imageNamed:@"picture"]];
            if( count > 2 )
            {
                imageView3.hidden = NO;
                [imageView3 sd_setImageWithURL:[NSURL URLWithString:[self.entity.arrayPicture objectAtIndex:2]] placeholderImage:[UIImage imageNamed:@"picture"]];
                if( count > 3 )
                {
                    imageView4.hidden = NO;
                    [imageView4 sd_setImageWithURL:[NSURL URLWithString:[self.entity.arrayPicture objectAtIndex:3]] placeholderImage:[UIImage imageNamed:@"picture"]];
                }
            }
        }
    }
    else
    {
        viewPicture.hidden = YES;
    }
    
    if( self.entity.arrayVoice.count > 0 )
    {
        viewVoice.hidden = NO;
        if( self.entity.arrayLink.count > 0 )
        {
            if( self.entity.arrayPicture.count > 0 )
            {
                viewVoice.frame = CGRectMake( 10, [Tool getBottom:viewPicture] + 15, backgroundView.frame.size.width - 20, 40 );
            }
            else
            {
                viewVoice.frame = CGRectMake( 10, [Tool getBottom:viewLink] + 10, backgroundView.frame.size.width - 20, 40 );
            }
        }
        else
        {
            if( self.entity.arrayPicture.count > 0 )
            {
                viewVoice.frame = CGRectMake( 10, [Tool getBottom:viewPicture] + 15, backgroundView.frame.size.width - 20, 40 );
            }
            else
            {
                viewVoice.frame = CGRectMake( 10, [Tool getBottom:line] + 10, backgroundView.frame.size.width - 20, 40 );
            }
        }
        
        voiceLine.frame = CGRectMake( [Tool getRight:labelPlay] + 10, 19.5, ( viewVoice.frame.size.width - 100 ) * ( 24.0f / 60.0f ), 1 );
        labelVoice.text = @"24\"";
        labelVoice.frame = CGRectMake( [Tool getRight:voiceLine] + 10, 0, 30, 40 );
    }
    else
    {
        viewVoice.hidden = YES;
    }
    
    if( self.entity.arrayVoice.count > 0 )
    {
        labelTitle.frame = CGRectMake( 10, [Tool getBottom:viewVoice] + 20, backgroundView.frame.size.width - 20, 0 );
    }
    else
    {
        if( self.entity.arrayPicture.count > 0 )
        {
            labelTitle.frame = CGRectMake( 10, [Tool getBottom:viewPicture] + 20, backgroundView.frame.size.width - 20, 0 );
        }
        else
        {
            if( self.entity.arrayLink.count > 0 )
            {
                labelTitle.frame = CGRectMake( 10, [Tool getBottom:viewLink] + 20, backgroundView.frame.size.width - 20, 0 );
            }
            else
            {
                labelTitle.frame = CGRectMake( 10, [Tool getBottom:line] + 15, backgroundView.frame.size.width - 20, 0 );
            }
        }
    }
    NSString * value = self.entity.postTitle;
    if( self.entity.type == 1 ) value = self.entity.postInfo;
    [labelTitle setAttributedText:[Tool getModifyString:value]];
    [labelTitle sizeToFit];
    
    CGFloat bottom = [Tool getBottom:labelTitle] + 10;
    if( self.entity.type == 2 )
    {
        [viewAct removeFromSuperview];
        viewAct = [[UIView alloc] initWithFrame:CGRectMake( 10, bottom, Screen_Width - 40, 70 )];
        viewAct.backgroundColor = [UIColor clearColor];
        [backgroundView addSubview:viewAct];
        
        UILabel * labelActTime = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, Screen_Width - 40, 20 )];
        labelActTime.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Small];
        labelActTime.textColor = Color_Heavy_Gray;
        labelActTime.text = [NSString stringWithFormat:@"\U0000F017    %@ - %@", self.entity.actStartTime, self.entity.actEndTime];
        [viewAct addSubview:labelActTime];
        
        UILabel * labelActPlace = [[UILabel alloc] initWithFrame:CGRectMake( 2, [Tool getBottom:labelActTime] + 5, Screen_Width - 40, 20 )];
        labelActPlace.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Small];
        labelActPlace.textColor = Color_Heavy_Gray;
        labelActPlace.text = [NSString stringWithFormat:@"\U0000F041    %@", self.entity.actPlace];
        [viewAct addSubview:labelActPlace];
        
        UILabel * labelActJoin = [[UILabel alloc] initWithFrame:CGRectMake( 1, [Tool getBottom:labelActPlace] + 5, 15, 20 )];
        labelActJoin.font = [UIFont fontWithName:@"FontAwesome" size:12];
        labelActJoin.textColor = Color_Heavy_Gray;
        labelActJoin.text = @"\U0000F058   ";
        [viewAct addSubview:labelActJoin];
        
        UIView * viewActImage = [[UIView alloc] initWithFrame:CGRectMake( [Tool getRight:labelActJoin] + 7, [Tool getBottom:labelActPlace] + 5, Screen_Width - 80, 20)];
        [viewAct addSubview:viewActImage];
        int count = self.entity.arrayActJoin.count;
        if( count > 7 ) count = 7;
        for( int i = 0; i < count; i ++ )
        {
            UIImageView * user = [[UIImageView alloc] initWithFrame:CGRectMake( i * 25, 0, 20, 20)];
            user.layer.masksToBounds = YES;
            user.layer.cornerRadius = 10;
            [user sd_setImageWithURL:[NSURL URLWithString:[self.entity.arrayActJoin objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"head_default"]];
            [viewActImage addSubview:user];
        }
        
        bottom = [Tool getBottom:viewAct] + 10;
    }
    else
    {
        viewAct.hidden = YES;
    }
    
    CGFloat width = backgroundView.frame.size.width / 4;
    labelBottom1.frame = CGRectMake( 0, bottom, width, 15);
    labelBottom2.frame = CGRectMake( width, bottom, width, 15);
    labelBottom3.frame = CGRectMake( width * 2, bottom, width, 15);
    labelBottom4.frame = CGRectMake( width * 3, bottom, width, 15);
    labelBottom1.hidden = NO;
    labelBottom2.hidden = NO;
    labelBottom3.hidden = NO;
    labelBottom4.hidden = NO;
    switch( self.entity.type )
    {
        case 0 :
        {
            labelBottom4.hidden = YES;
            labelBottom1.text = [NSString stringWithFormat:@"     \U0000F058  回答  %lu", (unsigned long)self.entity.arrayAnswer.count];
            labelBottom2.text = [NSString stringWithFormat:@"  \U0000F164  赞  %lu", (unsigned long)self.entity.arrayPraise.count];
            labelBottom3.text = [NSString stringWithFormat:@"  \U0000F086  评论  %lu", (unsigned long)self.entity.arrayComment.count];
            break;
        }
        case 1 :
        {
            labelBottom3.hidden = YES;
            labelBottom4.hidden = YES;
            labelBottom1.text = [NSString stringWithFormat:@"     \U0000F164  赞  %lu", (unsigned long)self.entity.arrayPraise.count];
            labelBottom2.text = [NSString stringWithFormat:@"  \U0000F086  评论  %lu", (unsigned long)self.entity.arrayComment.count];
            break;
        }
        case 2 :
        {
            labelBottom1.text = [NSString stringWithFormat:@"     \U0000F058  报名  %lu", (unsigned long)self.entity.arrayActJoin.count];
            labelBottom2.text = [NSString stringWithFormat:@"  \U0000F164  赞  %lu", (unsigned long)self.entity.arrayPraise.count];
            labelBottom3.text = [NSString stringWithFormat:@"  \U0000F086  评论  %lu", (unsigned long)self.entity.arrayComment.count];
            labelBottom4.text = [NSString stringWithFormat:@"  \U0000F1FC  回顾  %lu", (unsigned long)self.entity.arrayActBack.count];
            break;
        }
    }
    
    CGFloat height = 90 + labelTitle.frame.size.height;
    if( self.entity.arrayLink.count == 0 && self.entity.arrayPicture.count == 0 && self.entity.arrayVoice.count == 0 )
    {
        height += 3;
    }
    else
    {
        height += 18;
        if( self.entity.arrayLink.count > 0 ) height += 70;
        if( self.entity.arrayPicture.count > 0 )
        {
            height += 50;
            if( self.entity.arrayLink.count > 0 ) height += 5;
        }
        if( self.entity.arrayVoice.count > 0 )
        {
            height += 40;
            if( self.entity.arrayLink > 0 ) height += 10;
            if( self.entity.arrayPicture.count > 0 ) height += 5;
            if( self.entity.arrayLink.count == 0 && self.entity.arrayPicture.count == 0 ) height -= 10;
        }
    }
    if( self.entity.type == 2 ) height += 80;
    backgroundView.frame = CGRectMake( 10, 5, Screen_Width - 20, height );
}

@end
