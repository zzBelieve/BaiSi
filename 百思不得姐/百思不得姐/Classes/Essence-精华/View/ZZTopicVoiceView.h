//
//  ZZTopicVoiceView.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/4/26.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopicModel;
@interface ZZTopicVoiceView : UIView


+ (instancetype)VoiceView;

@property(nonatomic,strong)TopicModel *model;



@end
