//
//  ZZTopicVideoView.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/4/27.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZTopicVideoView.h"

#import "TopicModel.h"
#import <UIImageView+WebCache.h>
#import "ZZShowPictureController.h"
@interface ZZTopicVideoView()


@property (weak, nonatomic) IBOutlet UIImageView *imgaeView;


@property (weak, nonatomic) IBOutlet UILabel *playCount;


@property (weak, nonatomic) IBOutlet UILabel *timeCount;

@end


@implementation ZZTopicVideoView


- (void)awakeFromNib{
    
    self.imgaeView.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImage)];
    
    [self.imgaeView addGestureRecognizer:tap];
    
    
    
}


- (void)showImage{
    
    ZZLogFunc;
    
    ZZShowPictureController *vc = [[ZZShowPictureController alloc] init];
    vc.model = self.model;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    
    
}
- (void)setModel:(TopicModel *)model{
    
    
    _model = model;
    
    
    //图片
    
    [self.imgaeView sd_setImageWithURL:[NSURL URLWithString:model.large_image]];
    
    
    //播放次数
    
    self.playCount.text = [NSString stringWithFormat:@"%zd次播放",model.playcount];
    
    //播放时长
    NSInteger minute = model.videotime / 60;
    NSInteger second = model.videotime % 60;
    
    self.timeCount.text = [NSString stringWithFormat:@"%02zd : %02zd",minute,second];
//
    
}

@end
