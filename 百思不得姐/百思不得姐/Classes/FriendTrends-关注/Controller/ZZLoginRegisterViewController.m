//
//  ZZLoginRegisterViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/25.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZLoginRegisterViewController.h"

@interface ZZLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LeftMarginCon;
@end

@implementation ZZLoginRegisterViewController



- (IBAction)showAnimation:(id)sender {
    
    if (self.LeftMarginCon.constant==0) {
        
        self.LeftMarginCon.constant = - self.view.zz_Width;
        
        [self.rightButton setTitle:@"已有账号?" forState:UIControlStateNormal];
    }else{
      [self.rightButton setTitle:@"注册账号" forState:UIControlStateNormal];
    
        self.LeftMarginCon.constant=0;
    
    }
    
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.view layoutIfNeeded];
        
    }];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - 状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}




#pragma mark - 关闭
- (IBAction)CloseButtonClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
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
