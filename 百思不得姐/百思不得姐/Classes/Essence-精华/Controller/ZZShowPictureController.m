//
//  ZZShowPictureController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/29.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZShowPictureController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "TopicModel.h"
#import <SVProgressHUD.h>
#import "ZZProgressView.h"
@interface ZZShowPictureController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scView;

@property (weak, nonatomic) IBOutlet ZZProgressView *ProgressView;


@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation ZZShowPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    
    self.imageView = imageView;
    [self.scView addSubview:imageView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backButtonClick:)];
    
    [imageView addGestureRecognizer:tap];
    
    CGFloat PictureW = [UIScreen mainScreen].bounds.size.width;
    CGFloat PictureH = PictureW * self.model.height / self.model.width;
    
    
    if (PictureH > [UIScreen mainScreen].bounds.size.height) {
        imageView.zz_size = CGSizeMake(PictureW, PictureH);
        
        self.scView.contentSize = CGSizeMake(0, PictureH);
        
        
    }else{
    
    
        imageView.zz_size = CGSizeMake(PictureW, PictureH);
        imageView.zz_CenterY = [UIScreen mainScreen].bounds.size.height * 0.5;
        
    }
    
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.model.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        self.ProgressView.hidden = NO;
        
        CGFloat progess = 1.0 * receivedSize / expectedSize;
        
        [self.ProgressView setProgress:progess animated:YES];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        self.ProgressView.hidden =YES;
        
    }];
}


- (IBAction)saveButtonClick:(id)sender {
    
    
    if (self.imageView.image == nil) {
        
        [SVProgressHUD showErrorWithStatus:@"图片并没下载完毕!"];
        
        return;
    }
    
    
    // 将图片写入相册
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        [SVProgressHUD showErrorWithStatus:@"保存失败!"];
    } else {
        [SVProgressHUD showSuccessWithStatus:@"保存成功!"];
    }
}
- (IBAction)backButtonClick:(id)sender {
    
    ZZLogFunc;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
