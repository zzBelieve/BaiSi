//
//  ZZTopWindow.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZTopWindow.h"

static UIWindow *_window;

@implementation ZZTopWindow


+ (void)initialize{

    
    _window  =[[UIWindow alloc] initWithFrame:CGRectMake(0, 0, ZZScreenWidth, 20)];
    _window.windowLevel = UIWindowLevelAlert;
//    _window.backgroundColor = [UIColor redColor];
//    _window.rootViewController = [[UIViewController alloc] init];

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(windowClick)];
    [_window addGestureRecognizer:tap];

}

+ (void)show{



    _window.hidden = NO;
    
    



}

+ (void)windowClick{


    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    

    [self searchScrollViewInView:keyWindow];




}

+ (void)searchScrollViewInView:(UIView *)superView{


    for (UIScrollView *view in superView.subviews) {
        
        if ([view isKindOfClass:[UIScrollView class]] && view.isShowInKeyWindow ) {
            
            
           CGPoint offset =  view.contentOffset;
            
           offset.y = - view.contentInset.top;
            
            [view setContentOffset:offset animated:YES];
            
        }
        
        [self searchScrollViewInView:view];
    }
    

}
@end
