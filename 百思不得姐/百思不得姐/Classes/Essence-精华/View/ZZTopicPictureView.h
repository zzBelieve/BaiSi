//
//  ZZTopicPictureView.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/29.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopicModel;
@interface ZZTopicPictureView : UIView


+ (instancetype)PictureView;


@property(nonatomic,strong)TopicModel *model;

@end
