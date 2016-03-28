//
//  NSDate+ZZDateExtension.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "NSDate+ZZDateExtension.h"

@implementation NSDate (ZZDateExtension)


- (NSDateComponents *)deltaFromDate:(NSDate *)date{



    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 比较时间
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:date toDate:self options:0];


}

- (BOOL)isThisYear{


    
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear =  [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    
    return nowYear == selfYear;
    

}


- (BOOL)isToday{

    
    // 日历
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    NSInteger nowToday =  [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
//    NSInteger selfToday = [calendar component:NSCalendarUnitYear fromDate:self];
//    
//    
//    return nowToday = selfToday;
    
    
    NSDateFormatter *forma = [[NSDateFormatter alloc] init];
    
    forma.dateFormat = @"yyyy-MM-dd";
    
    NSString *nowString = [forma stringFromDate:[NSDate date]];
    
    NSString *selfString = [forma stringFromDate:self];
    
    
    return [nowString isEqualToString:selfString];
    


}


- (BOOL)isYesterday{

    
    NSDateFormatter *forma = [[NSDateFormatter alloc] init];
    
    forma.dateFormat = @"yyyy-MM-dd";
    
    
    
    NSDate *nowDate = [forma dateFromString:[forma stringFromDate:[NSDate date]]];
   
    NSDate *selfDate = [forma dateFromString:[forma stringFromDate:self]];
   
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    NSDateComponents *components  =  [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:selfDate toDate:nowDate options:0];
    
    return components.year==0 &&components.month == 0 && components.day == 1;
    
}
@end
