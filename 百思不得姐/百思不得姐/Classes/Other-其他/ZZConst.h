//
//  ZZConst.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZZTopicType) {
    
    
    ZZTopicTypeAll = 1,
    ZZTopicTypePicture = 10,
    ZZTopicTypeWord = 29,
    ZZTopicTypeVoice = 31,
    ZZTopicTypeVideo = 41
    
};


UIKIT_EXTERN CGFloat const ZZTitilesViewH;

UIKIT_EXTERN CGFloat const ZZTitilesViewY;


UIKIT_EXTERN CGFloat const ZZTopicCellMargin;
UIKIT_EXTERN CGFloat const ZZTopicTextY;
UIKIT_EXTERN CGFloat const ZZTopicBottomHeight;

UIKIT_EXTERN CGFloat const ZZTopicCellPictureViewMaxH;

UIKIT_EXTERN CGFloat const ZZTopicCellPictureViewBreakH;


/** 用户性别属性 */
UIKIT_EXTERN NSString *const ZZUserSexMale;
UIKIT_EXTERN NSString *const ZZUserSexFemale;


/** TabBar被选中的通知 */
UIKIT_EXTERN NSString *const ZZTabBarDidSelectNotication;