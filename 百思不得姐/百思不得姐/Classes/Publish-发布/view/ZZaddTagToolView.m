//
//  ZZaddTagToolView.m
//  百思不得姐
//
//  Created by 王夏军 on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZaddTagToolView.h"
#import "ZZAddTagViewController.h"
@interface ZZaddTagToolView()


@property (weak, nonatomic) IBOutlet UIView *topView;


@end

@implementation ZZaddTagToolView

- (void)awakeFromNib{

    //加号按钮
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [addButton setImage:[UIImage imageNamed:@"tag_add_icon"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    addButton.zz_size = addButton.currentImage.size;
    addButton.zz_X = 10;
    
    
    [self.topView addSubview:addButton];



}


- (void)addButtonClick{

    
    ZZAddTagViewController *vc = [[ZZAddTagViewController alloc] init];
    
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nac = (UINavigationController *)root.presentedViewController;
    
    [nac pushViewController:vc animated:YES];
}
@end
