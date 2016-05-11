//
//  UIImage+ZZExtension.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "UIImage+ZZExtension.h"

@implementation UIImage (ZZExtension)


- (UIImage *)circleImage{
    
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    
    //拿到上下文
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    //添加一个圆
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(ref, rect);
    
    //裁剪
    
    CGContextClip(ref);
    
    //画
    
    [self drawInRect:rect];
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();

    return image;
}
@end
