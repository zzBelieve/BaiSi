//
//  ZZSqaureButton.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZSqaureButton.h"
#import <UIButton+WebCache.h>
#import "ZZMeModel.h"
@implementation ZZSqaureButton

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
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
}


- (void)layoutSubviews{

    [super layoutSubviews];
    
    
    self.imageView.zz_Y = self.zz_Height * 0.15;
    self.imageView.zz_Width = self.zz_Width * 0.5;
    self.imageView.zz_Height = self.imageView.zz_Width;
    self.imageView.zz_CenterX = self.zz_Width * 0.5;
    
    self.titleLabel.zz_X = 0;
    self.titleLabel.zz_CenterY = CGRectGetMaxY(self.imageView.frame) + 10;
    self.titleLabel.zz_Width = self.zz_Width;
    self.titleLabel.zz_Height = self.zz_Height - self.titleLabel.zz_Y;

}

- (void)setModel:(ZZMeModel *)model{



    _model = model;
    
    [self setTitle:model.name forState:UIControlStateNormal];
    
    [self sd_setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal];


}
@end
