//
//  UIView+ZZExtension.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZExtension)

@property(nonatomic,assign)CGFloat zz_Width;
@property(nonatomic,assign)CGFloat zz_Height;

@property(nonatomic,assign)CGFloat zz_X;
@property(nonatomic,assign)CGFloat zz_Y;


@property(nonatomic,assign)CGSize zz_size;



@property(nonatomic,assign)CGFloat zz_CenterX;
@property(nonatomic,assign)CGFloat zz_CenterY;



- (BOOL)isShowInKeyWindow;


+ (instancetype)viewFromXib;
@end
