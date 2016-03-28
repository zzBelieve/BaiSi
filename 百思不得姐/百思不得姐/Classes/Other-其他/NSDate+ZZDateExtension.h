//
//  NSDate+ZZDateExtension.h
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZZDateExtension)


- (NSDateComponents *)deltaFromDate:(NSDate *)date;


- (BOOL)isThisYear;

- (BOOL)isToday;

- (BOOL)isYesterday;

@end
