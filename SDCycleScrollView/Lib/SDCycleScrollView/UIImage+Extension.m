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
    if (size.width > viewSize.width) {
        CGRect scaledFrame = [self calculateScaledRectWithTargetSize:CGSizeMake(viewSize.width, 0)];
        if (scaledFrame.size.height > viewSize.height) {
            CGFloat targetFactor = viewSize.height / viewSize.width;
            CGFloat modifiedHeight = targetFactor * size.width;
            CGFloat cutHeight = size.height - modifiedHeight;
            CGRect rect = CGRectZero;
            rect.size = CGSizeMake(size.width, size.height - cutHeight);
            UIGraphicsBeginImageContextWithOptions(rect.size, true, 0);
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
            [path addClip];
            if (mode & ImageDisplayModeTop) {
                [self drawAtPoint:CGPointZero];
            }
            if (mode & ImageDisplayModeBottom) {
                [self drawAtPoint:CGPointMake(0, -cutHeight)];
            }
            temp = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        temp = [temp scaleToSize:CGSizeMake(viewSize.width, 0)];
    }
    return temp;
}

- (CGRect)calculateScaledRectWithTargetSize:(CGSize)targetSize {
    CGSize imageSize = self.size;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    if (targetHeight == 0) {
        targetHeight = imageSize.height / (imageSize.width / targetWidth);
    }
    if (targetWidth == 0) {
        targetWidth = imageSize.width / (imageSize.height / targetHeight);
    }
    CGRect rect = CGRectZero;
    rect.size = CGSizeMake(targetWidth, targetHeight);
    return rect;
}

- (UIImage *)scaleToSize:(CGSize)size {
    CGRect rect = [self calculateScaledRectWithTargetSize:size];
    UIGraphicsBeginImageContextWithOptions(rect.size, true, 0);
    [self drawInRect:rect];
    UIImage *temp = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return temp;
    
}

@end

