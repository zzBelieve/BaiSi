//
//  ZZTagButton.m
//  百思不得姐
//
//  Created by 王夏军 on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZTagButton.h"

@implementation ZZTagButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"chose_tag_close_icon"] forState:UIControlStateNormal];
//        self.backgroundColor = XMGTagBg;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
    
    self.zz_Width += 4 * ZZTagMargin;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.zz_X = ZZTagMargin;
    self.imageView.zz_X = CGRectGetMaxX(self.titleLabel.frame);
}

@end
