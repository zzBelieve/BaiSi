//
//  RecommendModel.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendModel : NSObject

/** id */
@property (nonatomic, assign) NSInteger id;
/** 总数 */
@property (nonatomic, assign) NSInteger count;
/** 名字 */
@property (nonatomic, copy) NSString *name;




//这个类别对应的用户数据(辅助)

@property(nonatomic,strong)NSMutableArray *usersArray;


/** 总数 */
@property (nonatomic, assign) NSInteger total;
/** 当前页码 */
@property (nonatomic, assign) NSInteger currentPage;
@end
