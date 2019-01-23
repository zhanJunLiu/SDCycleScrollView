//
//  UIImage+Extension.m
//  SDCycleScrollView
//
//  Created by 劉戰軍 on 2019/1/23.
//  Copyright © 2019年 GSD. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (UIImage *)cutWithViewSize:(CGSize)viewSize mode:(ImageDisplayMode)mode {
    CGSize size = self.size;
    UIImage *temp = self;
    
    //若原图尺寸大于屏幕宽度，就先以屏幕宽度为基准对原图进行缩放
    if (size.width > [UIScreen mainScreen].bounds.size.width) {
        temp = [self scaleBaseWidth:[UIScreen mainScreen].bounds.size.width];
    }
    size = temp.size;
    // 首先确定按照给定尺寸进行缩放后的缩放系数
    CGFloat imageScale = MIN(size.width / viewSize.width, size.height / viewSize.height);
    // 新图片的宽度等于给定宽度除以缩放系数
    CGFloat width = viewSize.width / imageScale;
    // 新图片的高度等于给定高度除以缩放系数
    CGFloat height = viewSize.height / imageScale;
    // 由显示模式确定裁剪的纵轴位置
    CGFloat x = 0;
    CGFloat y = 0;
    if (mode & ImageDisplayModeCenter) {
        x = (size.width - width) / 2;
        y = (size.height - height) / 2;
    }
    if (mode & ImageDisplayModeLeft) {
        x = 0;
    }
    if (mode & ImageDisplayModeRight) {
        x = size.width - width;
    }
    if (mode & ImageDisplayModeTop) {
        y = 0;
    }
    if (mode & ImageDisplayModeBottom) {
        y = size.height - height;
    }
    
    CGRect rect = CGRectMake(x, y, width, height);
    
    CGImageRef sourceImageRef = [temp CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}

- (UIImage *)scaleBaseWidth:(CGFloat)width {
    CGSize imageSize = self.size;
    CGFloat targetHeight = imageSize.height / (imageSize.width / width);
    CGSize size = CGSizeMake(width, targetHeight);
    CGFloat factor = 0;
    CGFloat scaledWidth = width;
    CGFloat scaledHeight = targetHeight;
    CGPoint point = CGPointZero;
    if (!CGSizeEqualToSize(imageSize, size)) {
        CGFloat widthFactor = width / imageSize.width;
        CGFloat heightFactor = targetHeight / imageSize.height;
        factor = fmax(widthFactor, heightFactor);
        scaledWidth = imageSize.width * factor;
        scaledHeight = imageSize.height * factor;
        if (widthFactor > heightFactor) {
            point.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor < heightFactor) {
            point.x = (width - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectZero;
    rect.origin = point;
    rect.size.width = scaledWidth;
    rect.size.height = scaledHeight;
    [self drawInRect:rect];
    UIImage *temp = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return temp;
}

@end

