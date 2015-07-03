//
//  SearchQuanTableViewCell.m
//  QuanJia
//
//  Created by shuhang on 15/6/30.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "SearchQuanTableViewCell.h"
#import "Tool.h"
#import "UIImageView+WebCache.h"

@implementation SearchQuanTableViewCell

- ( id ) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] )
    {
        self.backgroundColor = [UIColor clearColor];
        
        UIView * backgroundView = [[UIView alloc] initWithFrame:CGRectMake( 10, 10, Screen_Width - 20, 160 )];
        backgroundView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backgroundView];
        
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake( 15, 10, 50, 50 )];
        headImageView.layer.masksToBounds = YES;
        headImageView.layer.cornerRadius = 6.0f;
        [backgroundView addSubview:headImageView];
        
        labelName = [[UILabel alloc] initWithFrame:CGRectMake( [Tool getRight:headImageView] + 10, 10, 200, 20 )];
        labelName.textColor = [UIColor blackColor];
        labelName.font = [UIFont systemFontOfSize:Text_Size_Big];
        [backgroundView addSubview:labelName];
        
        labelWord = [[UILabel alloc] initWithFrame:CGRectMake( labelName.frame.origin.x, [Tool getBottom:labelName] + 10, Screen_Width - 30 - labelName.frame.origin.x, 20)];
        labelWord.textColor = Color_Gray;
        labelWord.font = [UIFont systemFontOfSize:Text_Size_Small];
        labelWord.lineBreakMode = NSLineBreakByTruncatingTail;
        labelWord.numberOfLines = 0;
        [backgroundView addSubview:labelWord];
        
        labelCount = [[UILabel alloc] initWithFrame:CGRectMake( backgroundView.frame.size.width - 50, 10, 40, 20)];
        labelCount.font = [UIFont fontWithName:@"FontAwesome" size:Text_Size_Micro];
        labelCount.textColor = Color_Gray;
        [backgroundView addSubview:labelCount];
        
        line = [[UIView alloc] initWithFrame:CGRectMake( 10, [Tool getBottom:headImageView] + 10, backgroundView.frame.size.width - 20, 0.5)];
        line.backgroundColor = Color_Gray;
        [backgroundView addSubview:line];
        
        labelUser = [[UILabel alloc] initWithFrame:CGRectMake( headImageView.frame.origin.x, [Tool getBottom:line] + 5, backgroundView.frame.size.width - 30, 20)];
        labelUser.textColor = Color_Gray;
        labelUser.font = [UIFont systemFontOfSize:Text_Size_Small];
        labelUser.lineBreakMode = NSLineBreakByTruncatingTail;
        labelUser.numberOfLines = 0;
        [backgroundView addSubview:labelUser];
        
        buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonAdd.frame = CGRectMake( backgroundView.frame.size.width - 100, [Tool getBottom:labelUser] + 15, 90, 40 );
        buttonAdd.backgroundColor = Bg_Red;
        [buttonAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonAdd setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [buttonAdd.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
        [buttonAdd setTitle:@"\U0000F067  申请加入" forState:UIControlStateNormal];
        buttonAdd.layer.cornerRadius = 3.0f;
        buttonAdd.layer.masksToBounds = YES;
        [backgroundView addSubview:buttonAdd];
        
        buttonWrite = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonWrite.frame = CGRectMake( backgroundView.frame.size.width - 210, [Tool getBottom:labelUser] + 15, 90, 40 );
        buttonWrite.backgroundColor = Bg_Red;
        [buttonWrite setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonWrite setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [buttonWrite.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:Text_Size_Small]];
        [buttonWrite setTitle:@"\U0000F0E0  发信咨询" forState:UIControlStateNormal];
        buttonWrite.layer.cornerRadius = 3.0f;
        buttonWrite.layer.masksToBounds = YES;
        [backgroundView addSubview:buttonWrite];
    }
    return self;
}

- ( void ) updateCell
{
    [headImageView sd_setImageWithURL:[NSURL URLWithString:@"http://118.186.214.42:5000/images/cc84b8f0-a30d-11e4-94bd-05c2c1bd021c.jpeg"] placeholderImage:[UIImage imageNamed:@"head_default"]];
    labelName.text = @"超级约炮联盟";
    labelCount.text = @"\U0000F007  1000";
    labelWord.text = @"给你至尊豪华的享受给你至尊豪华的享受给你至尊豪华的享受";
    labelUser.text = @"管理员：李嘉诚、比尔盖茨";
}

@end
