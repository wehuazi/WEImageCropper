//
//  VWEImageCropperViewController.h
//  WEImageCropper
//
//  Created by huazi on 15/10/13.
//  Copyright © 2015年 huazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WEImageCropperViewController : UIViewController

@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) CGRect cropFrame;
@property (nonatomic, assign) NSInteger skip;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;

@end
