//
//  ZZMainTabBarViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZMainTabBarViewController.h"
#import "ZZEssenceViewController.h"
#import "ZZNewViewController.h"
#import "ZZFriendViewController.h"
#import "ZZMeViewController.h"
#import "ZZTabBar.h"
@interface ZZMainTabBarViewController ()

@end

@implementation ZZMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置外观
    
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    
    NSMutableDictionary *Selectattr = [NSMutableDictionary dictionary];
    Selectattr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    Selectattr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    [item setTitleTextAttributes:Selectattr forState:UIControlStateNormal];
    
    
    //添加子控制器
    
    [self addChildVc:[[ZZEssenceViewController alloc] init] title:@"精华" imageName:@"tabBar_essence_icon" SelectimageName:@"tabBar_essence_click_icon"];
    
    [self addChildVc:[[ZZNewViewController alloc] init] title:@"新帖" imageName:@"tabBar_new_icon" SelectimageName:@"tabBar_new_click_icon"];
    
    [self addChildVc:[[ZZFriendViewController alloc] init] title:@"关注" imageName:@"tabBar_friendTrends_icon" SelectimageName:@"tabBar_friendTrends_click_icon"];
    
    [self addChildVc:[[ZZMeViewController alloc] init] title:@"我" imageName:@"tabBar_me_icon" SelectimageName:@"tabBar_me_click_icon"];
    
    
    //更换tabbar
    
//    self.tabBar setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>
       [self setValue:[[ZZTabBar alloc] init] forKeyPath:@"tabBar"];
    
}

- (void)addChildVc:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName SelectimageName:(NSString *)SelectimageName{


    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:SelectimageName];
    [self addChildViewController:vc];


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
