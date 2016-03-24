//
//  UIView+ZZExtension.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "UIView+ZZExtension.h"

@implementation UIView (ZZExtension)


- (void)setZz_size:(CGSize)zz_size{


    CGRect frame = self.frame;
    
    frame.size = zz_size;
    
    self.frame = frame;


}

- (CGSize)zz_size{
    
    
    return self.frame.size;
    
}


- (void)setZz_Width:(CGFloat)zz_Width{

    CGRect frame = self.frame;
    
    frame.size.width = zz_Width;
    
    self.frame = frame;


}

- (CGFloat)zz_Width{


    return self.frame.size.width;

}



- (void)setZz_Height:(CGFloat)zz_Height{
    
    CGRect frame = self.frame;
    
    frame.size.height = zz_Height;
    
    self.frame = frame;
    
    
}

- (CGFloat)zz_Height{
    
    
    return self.frame.size.height;
    
}


- (void)setZz_X:(CGFloat)zz_X{
    
    CGRect frame = self.frame;
    
    frame.origin.x = zz_X;
    
    self.frame = frame;
    
    
}

- (CGFloat)zz_X{
    
    
    return self.frame.origin.x;
    
}


- (void)setZz_Y:(CGFloat)zz_Y{
    
    CGRect frame = self.frame;
    
    frame.origin.y = zz_Y;
    
    self.frame = frame;
    
    
}

- (CGFloat)zz_Y{
    
    
    return self.frame.origin.y;
    
}

@end
