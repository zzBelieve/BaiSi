//
//  RecommendModel.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel
- (NSMutableArray *)usersArray{
    
    
    
    if (_usersArray==nil) {
        
        _usersArray = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _usersArray;
}
@end
