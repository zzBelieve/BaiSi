//
//  ZZVerticalButton.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/25.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZVerticalButton.h"

@implementation ZZVerticalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}


- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


//间距跳整
- (void)layoutSubviews{


    
    [super layoutSubviews];
    
    
    self.imageView.zz_X = 0;
    self.imageView.zz_Y = 0;
    
    self.imageView.zz_Width = self.zz_Width;
    self.imageView.zz_Height = self.imageView.zz_Width ;
    
    
    
    self.titleLabel.zz_X = 0;
    self.titleLabel.zz_Y = self.imageView.zz_Height+5;
    self.titleLabel.zz_Width = self.zz_Width;
    self.titleLabel.zz_Height = self.zz_Height - self.titleLabel.zz_Y;



}

@end
