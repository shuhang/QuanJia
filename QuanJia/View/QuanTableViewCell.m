//
//  QuanTableViewCell.m
//  QuanJia
//
//  Created by shuhang on 15/7/2.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "QuanTableViewCell.h"
#import "Tool.h"

@implementation QuanTableViewCell

- ( id ) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] )
    {
        self.backgroundColor = [UIColor clearColor];
        
        backgroundView = [[UIView alloc] initWithFrame:CGRectMake( 20, 8, Screen_Width - 40, 90 )];
        backgroundView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backgroundView];
        
        labelName = [[UILabel alloc] initWithFrame:CGRectMake( 10, 15, backgroundView.frame.size.width - 60, 25 )];
        labelName.textColor = Color_Gray;
        labelName.font = [UIFont systemFontOfSize:Text_Size_Big];
        [backgroundView addSubview:labelName];
        
        imageHead = [[UIImageView alloc] initWithFrame:CGRectMake( backgroundView.frame.size.width - 40, 10, 30, 30)];
        imageHead.layer.masksToBounds = YES;
        imageHead.layer.cornerRadius = 3.0f;
        [backgroundView addSubview:imageHead];
        
        line = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:imageHead] + 5, backgroundView.frame.size.width - 20, 0.5)];
        line.backgroundColor = Color_Light_Gray;
        [backgroundView addSubview:line];
        
        viewMessage = [[UIView alloc] initWithFrame:CGRectZero];
        [backgroundView addSubview:viewMessage];
    }
    return self;
}

- ( void ) updateCell
{
    labelName.text = self.entity.name;
    [imageHead setImage:[UIImage imageNamed:@"picture"]];
    
    [viewMessage removeFromSuperview];
    viewMessage = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:line] + 10, backgroundView.frame.size.width - 20, 40)];
    [backgroundView addSubview:viewMessage];
    if( self.entity.arrayUser.count > 0 )
    {
        
    }
    else
    {
        UILabel * labelWord = [[UILabel alloc] initWithFrame:CGRectMake( 0, 5, backgroundView.frame.size.width - 60, 20 )];
        labelWord.textColor = Color_Gray;
        labelWord.font = [UIFont systemFontOfSize:Text_Size_Small];
        labelWord.text = self.entity.quanWord;
        [viewMessage addSubview:labelWord];
        
        UIView * point = [[UIView alloc] initWithFrame:CGRectMake( backgroundView.frame.size.width - 37, 12, 4, 4)];
        point.backgroundColor = Bg_Green;
        point.layer.masksToBounds = YES;
        point.layer.cornerRadius = 2;
        [viewMessage addSubview:point];
    }
}

@end
