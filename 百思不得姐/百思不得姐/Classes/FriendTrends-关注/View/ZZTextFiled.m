//
//  ZZTextFiled.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/25.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZTextFiled.h"
#import <objc/runtime.h>

@implementation ZZTextFiled

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)awakeFromNib{


    
//    unsigned int count = 0;
//    
//    Ivar *ivars =  class_copyIvarList([UITextField class], &count);
//    
//    
//    for (int i = 0; i<count; i++) {
//        
//        
//        Ivar var = *(ivars + i);
//        
//        ZZLog(@"%s",ivar_getName(var));
//        
//    }
//    
//    
//    free(ivars);
    
//    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.tintColor = self.textColor;
    

    [self becomeFirstResponder];
}

- (BOOL)becomeFirstResponder{

   
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
    
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{

    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];

     return [super resignFirstResponder];
}

//- (void)drawPlaceholderInRect:(CGRect)rect{
//
//
////    [super drawPlaceholderInRect:rect];
//    
//    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
//    attr[NSFontAttributeName] = self.font;
//    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    
//    
//    [self.placeholder drawInRect:CGRectMake(10, 10, 100, 100) withAttributes:attr];
//
//
//}

@end
