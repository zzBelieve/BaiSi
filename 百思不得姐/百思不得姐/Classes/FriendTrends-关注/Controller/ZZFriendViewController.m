//
//  ZZFriendViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZFriendViewController.h"

@interface ZZFriendViewController ()

@end

@implementation ZZFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self creatNav];
    
}
- (void)creatNav{
    
    
    //导航栏
    
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" selectImage:@"friendsRecommentIcon-click" target:self action:@selector(leftButtonClick)];
 
}

- (void)leftButtonClick{
    
    
    ZZLog(@"leftButtonClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
