//
//  CommentModel.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/4/27.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;


@interface CommentModel : NSObject

/** 音频时长 */
@property(nonatomic,assign)NSInteger voicetime;

/** 评论内容 */
@property(nonatomic,copy)NSString *content;

/** 点赞数量 */
@property(nonatomic,assign)NSInteger like_count;


@property(nonatomic,strong)UserModel *user;
@end
