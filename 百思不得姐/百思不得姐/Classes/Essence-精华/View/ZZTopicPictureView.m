//
//  ZZTopicPictureView.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/29.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZTopicPictureView.h"
#import "TopicModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ZZShowPictureController.h"

#import "ZZProgressView.h"
@interface ZZTopicPictureView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;

@property (weak, nonatomic) IBOutlet UIButton *SeebigButton;

@property (weak, nonatomic) IBOutlet ZZProgressView *progressView;
@end

@implementation ZZTopicPictureView


- (void)awakeFromNib{

    self.imageView.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImage)];
    
    [self.imageView addGestureRecognizer:tap];



}


- (void)showImage{

    ZZLogFunc;
    
    ZZShowPictureController *vc = [[ZZShowPictureController alloc] init];
    vc.model = self.model;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    
    
}

- (void)setModel:(TopicModel *)model{

    _model = model;
    
    
     [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
         
         self.progressView.hidden = NO;
         
         CGFloat progess = 1.0 * receivedSize / expectedSize;
         
         [self.progressView setProgress:progess animated:YES];
         
     } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
         self.progressView.hidden = YES;
         
         
         if (self.model.isBigImage==NO) return;
         
         
         //开启图形上下文
         
         UIGraphicsBeginImageContextWithOptions(model.pictureViewFrame.size, YES, 0.0);
         
         
         CGFloat width = model.pictureViewFrame.size.width;
         CGFloat height = width * image.size.height / image.size.width;
         [image drawInRect:CGRectMake(0, 0, width, height)];
         
         self.imageView.image =  UIGraphicsGetImageFromCurrentImageContext();
        
         //结束上下文
         
         UIGraphicsEndImageContext();
         
         
         
     }];
    
    NSString *lastString = model.large_image.pathExtension;
    
    self.gifImageView.hidden = ![[lastString lowercaseString] isEqualToString:@"gif"];

    
    self.SeebigButton.hidden = !model.isBigImage;
    
    if (model.isBigImage) {//大图
        
        self.SeebigButton.hidden = NO;
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        
    }else{//小图
    
       self.SeebigButton.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
    }


}
@end
