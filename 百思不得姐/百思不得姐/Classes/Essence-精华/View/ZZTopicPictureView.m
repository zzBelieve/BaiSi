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


@interface ZZTopicPictureView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;

@property (weak, nonatomic) IBOutlet UIButton *SeebigButton;

@end

@implementation ZZTopicPictureView


+ (instancetype)PictureView{



   return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];

}


- (void)setModel:(TopicModel *)model{

    _model = model;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.large_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    



}
@end
