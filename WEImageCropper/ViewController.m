//
//  ViewController.m
//  WEImageCropper
//
//  Created by huazi on 15/10/13.
//  Copyright © 2015年 huazi. All rights reserved.
//

#import "ViewController.h"
#import "WEClipImageViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,WEClipImageViewControllerDelegate>{
    //图片2进制路径
    NSString* filePath;
}
@property (nonatomic,strong)UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"图片裁剪";
}

- (IBAction)openMenu:(id)sender {
    __weak typeof(self) weakSelf = self;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [weakSelf presentViewController:self.imagePicker animated:YES completion:nil];
    }]];
     [alertController addAction:[UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
         [weakSelf presentViewController:self.imagePicker animated:YES completion:nil];
    }]];
       
    [alertController addAction: [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

- (UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        [_imagePicker.navigationBar setTintColor:[UIColor blackColor]];
        
    }
    return _imagePicker;
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage * userImage = picker.allowsEditing ? info[UIImagePickerControllerEditedImage] : info[UIImagePickerControllerOriginalImage];
    WEClipImageViewController* clipController = [[WEClipImageViewController alloc] init];
    clipController.delegate = self;
    clipController.hidesBottomBarWhenPushed = true;
    clipController.originalImage = userImage;
    clipController.ratio = 0.56;
    clipController.clipType = WEClipImageMoveBox;
    [self.navigationController pushViewController:clipController animated:false];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - WEClipImageViewControllerDelegate

- (void)finishClipImage:(UIImage*)image{
    self.imageView.image = image;
}

- (void)clipImageClean{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
