//
//  ZZPostWordViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZPostWordViewController.h"
#import "ZZPlaceHolderTextview.h"
#import "ZZaddTagToolView.h"
@interface ZZPostWordViewController ()<UITextViewDelegate>


@property (nonatomic, weak)ZZaddTagToolView *tooBar;
@end

@implementation ZZPostWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setNav];
    [self setTextView];
    [self setToolBar];
    
    [ZZNotificationCenter addObserver:self selector:@selector(KeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)KeyboardWillChangeFrame:(NSNotification *)notic{

    CGRect keyBoardFrame = [notic.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat duration = [notic.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        
        self.tooBar.transform = CGAffineTransformMakeTranslation(0, keyBoardFrame.origin.y - ZZScreenHeight);
    }];
    
    




}
- (void)setToolBar{

    
    
    ZZaddTagToolView *toolBar = [ZZaddTagToolView viewFromXib];
    
    self.tooBar = toolBar;
    
    toolBar.zz_Y = ZZScreenHeight - toolBar.zz_Height;
    
    [self.view addSubview:toolBar];
   


}

- (void)setTextView{

    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZZPlaceHolderTextview *textView = [[ZZPlaceHolderTextview alloc] init];
    textView.frame = self.view.bounds;
    textView.delegate = self;
    textView.placeHodler = @"把好玩的图片，好笑的段子或糗事发到这里，接受千万网友膜拜吧！发布违反国家法律内容的，我们将依法提交给有关部门处理.";
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
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




- (void)textViewDidChange:(UITextView *)textView{

    
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;

}

- (void)dealloc{

    [ZZNotificationCenter removeObserver:self];
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
