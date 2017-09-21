//
//  WEClipImageViewController.h
//  MeiX
//
//  Created by joyman04 on 2017/5/25.
//  Copyright © 2017年 MeiX. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef enum : NSInteger{
//    WEMoveImage,
//    WEMoveBox
//} WEClipImageType;

typedef NS_ENUM(NSInteger , WEClipImageType) {
    WEClipImageMoveImage,
    WEClipImageMoveBox
};

@protocol WEClipImageViewControllerDelegate <NSObject>

- (void)finishClipImage:(UIImage*)image;

- (void)clipImageClean;

@end

@interface WEClipImageViewController : UIViewController
/** 裁切宽高 */
@property (nonatomic,assign) CGSize clipSize;
/** 宽高比例 */
@property (nonatomic,assign) CGFloat ratio;
/** 原始图片 */
@property (nonatomic,strong) UIImage* originalImage;
/** 裁图类型 */
@property (nonatomic,assign) WEClipImageType clipType;

@property (nonatomic,assign) id <WEClipImageViewControllerDelegate> delegate;

@end
