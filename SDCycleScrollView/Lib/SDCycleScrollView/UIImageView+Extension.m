//
//  UIImageView+Extension.m
//  SDCycleScrollView
//
//  Created by 劉戰軍 on 2019/1/23.
//  Copyright © 2019年 GSD. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)

- (UIImage *)display:(ImageDisplayMode)mode {
    return [self.image cutWithViewSize:self.frame.size mode:mode];
}

@end
