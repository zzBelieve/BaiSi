//
//  ZZTagTextField.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/12.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZTagTextField : UITextField

/** 按删除键的回调*/
@property(nonatomic,copy)void(^deleteBlock)();
@end
