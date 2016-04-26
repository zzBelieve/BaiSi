//
//  TopicModel.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "TopicModel.h"
#import "NSDate+ZZDateExtension.h"
#import <MJExtension.h>
@implementation TopicModel



+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2"
             };
}


- (NSString *)create_time
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 帖子的创建时间
    NSDate *create = [fmt dateFromString:_create_time];
    
    if (create.isThisYear) { // 今年
        if (create.isToday) { // 今天
            NSDateComponents *cmps = [[NSDate date] deltaFromDate:create];
            
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 时间差距
                return @"刚刚";
            }
        } else if (create.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        } else { // 其他
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    } else { // 非今年
        return _create_time;
    }
}


- (CGFloat)cellHeight{

    if (!_cellHeight) {
        
        ZZLogFunc
            CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 4 * ZZTopicCellMargin, MAXFLOAT);
        
            CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
        
        
        _cellHeight = ZZTopicTextY + textH + ZZTopicBottomHeight;
        
        
        //根据段子类型计算cell高度
        
        if (self.type == ZZTopicTypePicture) {
            
            CGFloat imageW = maxSize.width;
            
            CGFloat imageH = imageW * self.height / self.width;
            
            
            if (imageH > ZZTopicCellPictureViewMaxH) {
                
                imageH = ZZTopicCellPictureViewBreakH;
                
                self.bigImage = YES;
            }
            
            
            _pictureViewFrame = CGRectMake(ZZTopicCellMargin,ZZTopicTextY + textH + ZZTopicCellMargin,imageW , imageH);
            
            _cellHeight += imageH +  ZZTopicCellMargin;
            
            
            
        }else if (self.type == ZZTopicTypeVoice) {
            
           
            CGFloat voiceX = ZZTopicCellMargin;
            CGFloat voiceY = ZZTopicTextY + textH + ZZTopicCellMargin;
            CGFloat voiceW = maxSize.width;
            CGFloat voiceH = voiceW * self.height / self.width;
            
            self.voiceViewFrame = CGRectMake(voiceX, voiceY, voiceW, voiceH);
            
            
            _cellHeight += voiceH + ZZTopicCellMargin;
        }
        
        _cellHeight += ZZTopicCellMargin + ZZTopicBottomHeight;
        
    }


    return _cellHeight;
    



}
@end
