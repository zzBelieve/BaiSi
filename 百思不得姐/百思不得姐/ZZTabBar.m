//
//  ZZTabBar.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZTabBar.h"

@interface ZZTabBar()


/**
 *  发布按钮
 */
@property(nonatomic,weak)UIButton *publishButton;

@end


@implementation ZZTabBar


//不要在这设置 frame`
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        
        
        self.publishButton = publishButton;
        
        [self addSubview:publishButton];
        
        
    }
    
    
    return self;



}

//在这设置frame
- (void)layoutSubviews{

    
    [super layoutSubviews];
    
    //发布按钮frame
    self.publishButton.zz_Width = self.publishButton.currentBackgroundImage.size.width;
    self.publishButton.zz_Height = self.publishButton.currentBackgroundImage.size.height;
    
    self.publishButton.center = CGPointMake(self.zz_Width * 0.5, self.zz_Height * 0.5);
    
    
    //其他UITabBarButton frame
    
    CGFloat buttonW = self.zz_Width / 5;
    CGFloat buttonH = self.zz_Height;
    
    CGFloat buttonY = 0;
    
    NSInteger index = 0;
    
    for (UIView *button in self.subviews) {
        
        
        
        if (! [button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
            
        CGFloat buttonX = buttonW * (index > 1 ? index + 1: index);
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
        index ++;
    }


}
@end
