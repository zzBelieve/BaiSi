//
//  ZZTagTextField.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/12.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZTagTextField.h"

@implementation ZZTagTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)deleteBackward{


    !self.deleteBlock? : self.deleteBlock();
    
    
    [super deleteBackward];

}
@end
