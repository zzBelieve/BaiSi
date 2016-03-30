//
//  ZZPublishController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/29.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZPublishController.h"
#import "ZZVerticalButton.h"
#import <POP.h>


static CGFloat const KAnimatioonDelay = 0.1;
static CGFloat const kSpringFactory = 10;

@interface ZZPublishController ()

@end

@implementation ZZPublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.userInteractionEnabled = NO;
    
    
   
    
    
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    

    //最大列数
    int maxCols = 3;
    
    CGFloat buttonW = 72;
    CGFloat buttonH = buttonW + 30;
    
    
    CGFloat buttonStartX = 20;
    CGFloat buttonStartY = (ZZScreenHeight - 2 * buttonH) * 0.5;
    
    CGFloat marginX = (ZZScreenWidth - 2 * buttonStartX - maxCols * buttonW) / (maxCols - 1);

    for (int i = 0; i<images.count; i++) {
        
        
        ZZVerticalButton *button = [ZZVerticalButton buttonWithType:UIButtonTypeCustom];
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        button.tag = 100 +i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        int row = i / maxCols;
        int col = i % maxCols;
        
//        button.zz_X = buttonStartX + col * (marginX + buttonW);
//        
//        
//        button.zz_Y = buttonStartY + row * (buttonH + 10);
        
        
        CGFloat buttonX = buttonStartX + col * (marginX + buttonW);
        
        CGFloat buttonEndY = buttonStartY + row * (buttonH + 10);
        
        CGFloat buttonBeginY = buttonEndY - ZZScreenHeight;
        [self.view addSubview:button];
        
        
        
        //按钮动画
        
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        
        animation.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonBeginY, buttonW, buttonH)];
        
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonEndY, buttonW, buttonH)];
        
        animation.springBounciness = kSpringFactory;
        animation.springSpeed = kSpringFactory;
        
        animation.beginTime = CACurrentMediaTime() + KAnimatioonDelay * i;
        
        [button pop_addAnimation:animation forKey:nil];
    }
    
    
    CGFloat app_sloganImageViewX = ZZScreenWidth * 0.5;
    
    CGFloat app_sloganImageEndY = ZZScreenHeight * 0.2;
    CGFloat app_sloganImageBeginY = app_sloganImageEndY - ZZScreenHeight;
    
    
    
    UIImageView *app_sloganImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
//    app_sloganImageView.zz_Y = ZZScreenHeight * 0.2;
//    app_sloganImageView.zz_CenterX = ZZScreenWidth * 0.5 ;
    [self.view addSubview:app_sloganImageView];
    
    //slogan动画
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(app_sloganImageViewX, app_sloganImageBeginY)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(app_sloganImageViewX, app_sloganImageEndY)];
    animation.springBounciness = kSpringFactory;
    animation.springSpeed = kSpringFactory;
    [animation setCompletionBlock:^(POPAnimation *ani, BOOL finish) {
        self.view.userInteractionEnabled = YES;
    }];
    [app_sloganImageView pop_addAnimation:animation forKey:nil];
    
}




- (void)buttonClick:(UIButton *)button{

  
    
    [self cancleBlock:^{
        
        if (button.tag == 100) {
            
            ZZLogFunc
        }
        
        
    }];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self cancleBlock:nil];

}


- (void)cancleBlock:(void (^)())block{




    self.view.userInteractionEnabled = YES;
    
    //    [self cancleButtonClick:];
    
    int beginIndex = 2;
    for (int i = beginIndex; i<self.view.subviews.count; i++) {
        
        UIView *subView = self.view.subviews[i];
        
        // 基本动画
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        CGFloat centerY = subView.zz_CenterY + ZZScreenHeight;
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(subView.zz_CenterX, centerY)];
        anim.beginTime = CACurrentMediaTime() + (i - beginIndex) * KAnimatioonDelay;
        [subView pop_addAnimation:anim forKey:nil];
        
        // 监听最后一个动画
        if (i == self.view.subviews.count - 1) {
            
            [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
                [self dismissViewControllerAnimated:NO completion:nil];
                
                // 执行传进来的completionBlock参数
                //                if (completionBlock) {
                //                    completionBlock();
                //                }
                                !block ? : block();
            }];
        }
        
        
    }




}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancleButtonClick:(id)sender {
    
//    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
