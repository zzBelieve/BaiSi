
//
//  ZZPlaceHolderTextview.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZPlaceHolderTextview.h"

@interface ZZPlaceHolderTextview ()



@property(nonatomic,weak)UILabel *placeHodlerLabel;
@end


@implementation ZZPlaceHolderTextview

- (UILabel *)placeHodlerLabel{



    if (!_placeHodlerLabel) {
        
        
        UILabel *placeHodlerLabel = [[UILabel alloc] init];
        placeHodlerLabel.numberOfLines = 0;
        placeHodlerLabel.zz_X = 4;
        placeHodlerLabel.zz_Y = 7;
        [self addSubview:placeHodlerLabel];
        self.placeHodlerLabel = placeHodlerLabel;
        
        
    }

    return _placeHodlerLabel;
}

- (instancetype)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        
        self.alwaysBounceVertical = YES;
        
        //默认颜色
        self.placeHodlerColor = [UIColor grayColor];
        
        
        //默认字体
        
        self.font = [UIFont systemFontOfSize:15];
        
        
        
        
        
        [ZZNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
    }

    return self;
}

//- (void)layoutSubviews{
//
//    [super layoutSubviews];
//    
//    
//    self.placeHodlerLabel.zz_Width = [UIScreen mainScreen].bounds.size.width - self.placeHodlerLabel.zz_X * 2;
//    
//
//
//
//
//}

- (void)textDidChange{

    
    self.placeHodlerLabel.hidden = self.hasText;
    
}




- (void)dealloc{

    [ZZNotificationCenter removeObserver:self];
    

}


- (void)setPlaceHodler:(NSString *)placeHodler{

    _placeHodler = [placeHodler copy];
    
    self.placeHodlerLabel.text = placeHodler;
    
    
    
    [self updatePlaceHolderSize];
    

}
- (void)updatePlaceHolderSize{


 self.placeHodlerLabel.zz_size = [self.placeHodler boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 2 * self.placeHodlerLabel.zz_X, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size;



}

- (void)setPlaceHodlerColor:(UIColor *)placeHodlerColor{

    _placeHodlerColor = placeHodlerColor;
    
   self.placeHodlerLabel.textColor = placeHodlerColor;
}

- (void)setFont:(UIFont *)font{

    [super setFont:font];
    
    self.placeHodlerLabel.font = font;
    
    [self updatePlaceHolderSize];
    
}

- (void)setText:(NSString *)text{
    
    [super setText:text];
    
    
    [self textDidChange];

}

- (void)setAttributedText:(NSAttributedString *)attributedText{

    [super setAttributedText:attributedText];
    [self textDidChange];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
