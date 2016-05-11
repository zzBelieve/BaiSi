//
//  ZZPostWordViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZPostWordViewController.h"
#import "ZZPlaceHolderTextview.h"
@interface ZZPostWordViewController ()

@end

@implementation ZZPostWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setNav];
    [self setTextView];
}

- (void)setTextView{

    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZZPlaceHolderTextview *textView = [[ZZPlaceHolderTextview alloc] init];
    textView.frame = self.view.bounds;
    textView.placeHodler = @"把好玩的图片，好笑的段子或糗事发到这里，接受千万网友膜拜吧！发布违反国家法律内容的，我们将依法提交给有关部门处理.";
    [self.view addSubview:textView];





}
- (void)setNav{


    self.navigationItem.title = @"发表文字";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO; // 默认不能点击


    //
    
    [self.navigationController.view layoutIfNeeded];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)post
{
    
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
