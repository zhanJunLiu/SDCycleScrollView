//
//  UIImage+Extension.h
//  SDCycleScrollView
//
//  Created by 劉戰軍 on 2019/1/23.
//  Copyright © 2019年 GSD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, ImageDisplayMode) {
    ImageDisplayModeTop = 1 << 0,
    ImageDisplayModeBottom = 1 << 1,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

- (UIImage *)cutWithViewSize:(CGSize)viewSize mode:(ImageDisplayMode)mode;

- (UIImage *)scaleBaseWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
