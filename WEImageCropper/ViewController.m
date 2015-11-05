//
//  ViewController.m
//  WEImageCropper
//
//  Created by huazi on 15/10/13.
//  Copyright © 2015年 huazi. All rights reserved.
//

#import "ViewController.h"
#import "WEImageCropperViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    //图片2进制路径
    NSString* filePath;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)openMenu:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"这个是UIAlertController" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
         NSLog(@"%@",action);
    }];
    
    __typeof(self) weakSelf = self;
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"打开照相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf takePhoto];
    }];
    
    UIAlertAction *pictureAction = [UIAlertAction actionWithTitle:@"从手机相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf LocalPhoto];
    }];
    
    [alertController addAction:photoAction];
    [alertController addAction:pictureAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        WEImageCropperViewController *imageCropperViewController = [[WEImageCropperViewController alloc]initWithImage:portraitImg cropFrame:CGRectMake(0, (self.view.frame.size.height - 230)/2, 320, 230) limitScaleRatio:3.0];
        [self presentViewController:imageCropperViewController animated:YES completion:^{
            // TO DO
        }];
    }];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)sendInfo
{
    NSLog(@"图片的路径是：%@", filePath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
