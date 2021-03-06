//
//  TopicModel.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicModel : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 发帖时间 */
@property (nonatomic, copy) NSString *create_time;
/** 文字内容 */
@property (nonatomic, copy) NSString *text;
/** 顶的数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩的数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发的数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论的数量 */
@property (nonatomic, assign) NSInteger comment;
/** 播放次数 */
@property (nonatomic, assign) NSInteger playcount;
/** 音频播放时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 视频播放时长 */
@property (nonatomic, assign) NSInteger videotime;

@property(nonatomic,assign,getter=is_sinav)BOOL sina_v;


/** 最热评论 */
@property(nonatomic,strong)NSArray *top_cmt;


/** 图片的宽度 */
@property (nonatomic, assign)CGFloat width;
/** 图片的高度 */
@property (nonatomic, assign)CGFloat height;

/** 小图片的URL */
@property (nonatomic, copy) NSString *small_image;
/** 中图片的URL */
@property (nonatomic, copy) NSString *middle_image;
/** 大图片的URL */
@property (nonatomic, copy) NSString *large_image;

/** cell类型 */

@property (nonatomic, assign) ZZTopicType type;

/**辅助属性 cell高度*/
@property (nonatomic, assign) CGFloat cellHeight;

/**辅助属性 图片控制的frame*/
@property (nonatomic, assign)CGRect pictureViewFrame;

/**辅助属性 图片太大*/
@property (nonatomic, assign,getter=isBigImage)BOOL bigImage;



/**辅助属性 声音控件的frame*/
@property (nonatomic, assign)CGRect voiceViewFrame;

/**辅助属性 视频控件的frame*/
@property (nonatomic, assign)CGRect videoViewFrame;
@end
