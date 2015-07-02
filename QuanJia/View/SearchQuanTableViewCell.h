//
//  SearchQuanTableViewCell.h
//  QuanJia
//
//  Created by shuhang on 15/6/30.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchQuanTableViewCell : UITableViewCell
{
    UIImageView * headImageView;
    UILabel * labelName;
    UILabel * labelWord;
    UILabel * labelCount;
    UILabel * labelUser;
    UIButton * buttonWrite;
    UIButton * buttonAdd;
    UIView * line;
}

- ( void ) updateCell;

@end
