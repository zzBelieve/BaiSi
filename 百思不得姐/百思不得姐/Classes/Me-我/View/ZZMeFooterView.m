//
//  ZZMeFooterView.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZMeFooterView.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "ZZMeModel.h"
#import "ZZSqaureButton.h"
@implementation ZZMeFooterView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        
        
        // 参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        // 发送请求
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            NSArray *sqaury = [ZZMeModel mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            [self creatButtonWithArray:sqaury];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            
            
        }];
        
    }

    return self;


}

- (void)creatButtonWithArray:(NSArray *)array{


    //1行最多四列
    int maxCols = 4;
    
    CGFloat buttonW = ZZScreenWidth / maxCols;
    CGFloat buttonH = buttonW;
    
    
    for (int i = 0; i<array.count; i++) {
        
        
        
        ZZSqaureButton *button = [ZZSqaureButton buttonWithType:UIButtonTypeCustom];
        button.model = array[i];
        
        int col = i % maxCols;
        int row = i / maxCols;
        
        CGFloat buttonX = col * buttonW;
        CGFloat buttonY = row * buttonH;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        [self addSubview:button];
    }
    
//    self.zz_Height = 200;

    NSUInteger row = (array.count + maxCols - 1) / maxCols;
    
    self.zz_Height = row * buttonH;


    [self setNeedsDisplay];



}
- (void)drawRect:(CGRect)rect{
    
  
    [[UIImage imageNamed:@"comment-bar-bg"] drawInRect:rect];
    
    
}
@end
