//
//  ZZEssenceViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZEssenceViewController.h"
#import "ZZRecommendTagsViewController.h"
#import "ZZAllTableViewController.h"
#import "ZZVideoTableViewController.h"
#import "ZZVoiceTableViewController.h"
#import "ZZPictureTableViewController.h"
#import "ZZWordTableViewController.h"

@interface ZZEssenceViewController ()<UIScrollViewDelegate>



@property(nonatomic,weak)UIView *indicatorView;

@property(nonatomic,weak)UIButton *selectButton;

@property(nonatomic,weak)UIView *titleView;

@property(nonatomic,weak)UIScrollView *contentViewSc;
@end

@implementation ZZEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self creatNav];
    
    
    
    [self setUpTitleView];
    
    
    //初始化 子控制器
    
    [self setUpChildController];
    
    [self setUpContentView];
    
   
    
    
}

- (void)setUpChildController{


    ZZAllTableViewController *allVc = [[ZZAllTableViewController alloc] init];
    
    [self addChildViewController:allVc];


    ZZVideoTableViewController *VideoVc = [[ZZVideoTableViewController alloc] init];
    [self addChildViewController:VideoVc];
    
    ZZVoiceTableViewController *VoiceVc = [[ZZVoiceTableViewController alloc] init];
    [self addChildViewController:VoiceVc];
    
    ZZPictureTableViewController *PictureVc = [[ZZPictureTableViewController alloc] init];
    [self addChildViewController:PictureVc];
    
    ZZWordTableViewController *WordVc = [[ZZWordTableViewController alloc] init];
    [self addChildViewController:WordVc];




}
- (void)setUpContentView{
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;


    UIScrollView *sc = [[UIScrollView alloc] init];
    sc.pagingEnabled = YES;
    sc.showsVerticalScrollIndicator = NO;
    self.contentViewSc = sc;
    sc.frame = self.view.frame;
    sc.delegate = self;
    
    
    
    
    [self.view insertSubview:sc atIndex:0];
    
    
    sc.contentSize = CGSizeMake(sc.zz_Width * self.childViewControllers.count,0);



    [self scrollViewDidEndScrollingAnimation:sc];

}

#pragma mark - 滑动view
- (void)setUpTitleView{


    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    titleView.zz_Width = self.view.zz_Width;
    titleView.zz_Height = 35;
    titleView.zz_Y = 64;
    self.titleView  = titleView;
    [self.view addSubview:titleView];
    
    
    
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.zz_Height = 2;
    indicatorView.zz_Y = titleView.zz_Height - indicatorView.zz_Height;
    
    
    
    self.indicatorView = indicatorView;
    
    
    
    NSArray *titleArray = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    
    CGFloat buttonW = titleView.zz_Width / titleArray.count;
    CGFloat buttonH = titleView.zz_Height;
    CGFloat buttonY = 0;
    for (int i = 0; i<titleArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.zz_Width = buttonW;
        button.zz_Height = buttonH;
        button.zz_X = i * buttonW;
        button.zz_Y = buttonY;
        
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitle:titleArray[i] forState:UIControlStateSelected];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        
        button.tag = 100 + i;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [titleView addSubview:button];
        
        if (i==0) {
            
            
//            [self buttonClick:button];
            
            
            button.enabled = NO;
            
            self.selectButton = button;
            
            [button.titleLabel sizeToFit];
            self.indicatorView.zz_Width = button.titleLabel.zz_Width;
            self.indicatorView.zz_CenterX = button.zz_CenterX;
            
        }
    }

    
    
    
    [titleView addSubview:indicatorView];
   
    
    

}


- (void)buttonClick:(UIButton *)button{

    
    self.selectButton.enabled = YES;
    button.enabled = NO;
    self.selectButton = button;

  
    
    [UIView animateWithDuration:0.25 animations:^{
        
        
        self.indicatorView.zz_Width = button.titleLabel.zz_Width;
        
        
        self.indicatorView.zz_CenterX = button.zz_CenterX;
    }];
    
    

    
    //滚动
    
    CGPoint offset = self.contentViewSc.contentOffset;
    
    offset.x = (button.tag - 100) * self.contentViewSc.zz_Width;
    
    [self.contentViewSc setContentOffset:offset animated:YES];

}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    
    //索引
     NSInteger index =  scrollView.contentOffset.x / scrollView.zz_Width;

    //
    
    UITableViewController *vc  =  self.childViewControllers[index];
    vc.view.zz_X = scrollView.contentOffset.x;
    vc.view.zz_Y = 0;
    
   
    
    [scrollView addSubview:vc.view];
    




}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{


    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    
    //按钮点击
    
    NSInteger index = scrollView.contentOffset.x / scrollView.zz_Width;
    
    [self buttonClick:(UIButton *)self.titleView.subviews[index]];





}
#pragma mark - 导航栏
- (void)creatNav{


    //导航栏
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];

    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" selectImage:@"MainTagSubIconClick" target:self action:@selector(leftButtonClick)];

}

- (void)leftButtonClick{


    ZZLog(@"leftButtonClick");
    
    
    ZZRecommendTagsViewController *vc = [[ZZRecommendTagsViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
