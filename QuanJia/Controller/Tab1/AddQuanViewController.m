//
//  AddQuanViewController.m
//  QuanJia
//
//  Created by shuhang on 15/6/30.
//  Copyright (c) 2015年 shuhang.pku. All rights reserved.
//

#import "AddQuanViewController.h"
#import "Tool.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "SVProgressHUD.h"

@interface AddQuanViewController ()
<
UIAlertViewDelegate,
UIActionSheetDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
{
    UITextField * fieldName;
    UITextField * fieldWord;
    
    UIImageView * imageView;
    
    UIActionSheet * sheetPhoto;
    UIPickerView * pickerView;
}
@end

@implementation AddQuanViewController

- ( void ) viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = Color_Light_Gray;
    [self setupTitle:@"创建圈子"];
    
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake( 20, 84, Screen_Width - 40, 110 )];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    fieldName = [[UITextField alloc] initWithFrame:CGRectMake( 10, 10, Screen_Width - 110, 40 )];
    fieldName.font = [UIFont systemFontOfSize:Text_Size_Small];
    fieldName.placeholder = @"圈子名称";
    fieldName.clearButtonMode = UITextFieldViewModeWhileEditing;
    fieldName.backgroundColor = [UIColor clearColor];
    [topView addSubview:fieldName];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake( Screen_Width - 90, 10, 40, 40)];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 3.0f;
    [imageView setImage:[UIImage imageNamed:@"picture"]];
    [topView addSubview:imageView];
    
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake( 10, 55, Screen_Width - 60, 0.5 )];
    line1.backgroundColor = Color_Light_Gray;
    [topView addSubview:line1];
    
    fieldWord = [[UITextField alloc] initWithFrame:CGRectMake( 10, 60, Screen_Width - 110, 40 )];
    fieldWord.font = [UIFont systemFontOfSize:Text_Size_Small];
    fieldWord.placeholder = @"圈子口号";
    fieldWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    fieldWord.backgroundColor = [UIColor clearColor];
    [topView addSubview:fieldWord];
    
    UIButton * buttonFinish = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonFinish.frame = CGRectMake( 20, [Tool getBottom:topView] + 30, Screen_Width - 40, 50 );
    buttonFinish.backgroundColor = Bg_Red;
    [buttonFinish setTitle:@"创建" forState:UIControlStateNormal];
    [buttonFinish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonFinish setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    buttonFinish.titleLabel.font = [UIFont systemFontOfSize:Text_Size_Small];
    buttonFinish.layer.cornerRadius = 5.0f;
    [buttonFinish addTarget:self action:@selector(doCreateQuan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonFinish];
    
    CGFloat imageWidth = ( Screen_Width - 60 ) / 5;
    
    UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake( 0, Screen_Height - ( imageWidth + 31 ), Screen_Width, 1 )];
    line2.backgroundColor = Color_Gray;
    [self.view addSubview:line2];
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake( 0, Screen_Height - 30 - imageWidth, Screen_Width, imageWidth + 30 )];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    for( int i = 0; i < 5; i ++ )
    {
        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake( 10 * ( i + 1 ) + imageWidth * i, 15, imageWidth, imageWidth)];
        [image setImage:[UIImage imageNamed:@"picture"]];
        [bottomView addSubview:image];
        
        if( i == 0 )
        {
            image.userInteractionEnabled = YES;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAddPicture)];
            [image addGestureRecognizer:tap];
        }
    }
}

- ( void ) showAddPicture
{
    sheetPhoto = [[UIActionSheet alloc] initWithTitle:@"请选择照片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"从相册选择" otherButtonTitles:@"使用手机拍照", nil];
    [sheetPhoto showInView:self.view];
}

- ( void ) doCreateQuan
{
    
}

- (void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有摄像头
    if( ![UIImagePickerController isSourceTypeAvailable:sourceType] )
    {
        [SVProgressHUD showErrorWithStatus:@"设备没有摄像头"];
        return;
    }
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;   // 设置委托
    imagePickerController.sourceType = sourceType;
    imagePickerController.allowsEditing = YES;
    [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示
}

- ( void ) localPhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;   // 设置委托
    imagePickerController.sourceType = sourceType;
    imagePickerController.allowsEditing = YES;
    [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示
}

#pragma mark - UIActionSheetDelegate
- ( void ) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if( actionSheet == sheetPhoto )
    {
        if( buttonIndex == sheetPhoto.destructiveButtonIndex )
        {
            [self localPhoto];
        }
        else if( buttonIndex == sheetPhoto.firstOtherButtonIndex )
        {
            [self takePhoto];
        }
    }
}

#pragma mark UIImagePickerController delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

@end
