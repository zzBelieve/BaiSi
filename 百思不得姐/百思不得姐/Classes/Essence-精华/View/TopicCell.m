//
//  TopicCell.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "TopicCell.h"
#import "TopicModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSDate+ZZDateExtension.h"
@interface TopicCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImgaeView;

@property (weak, nonatomic) IBOutlet UILabel *nickName;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (weak, nonatomic) IBOutlet UIButton *DingButton;
@property (weak, nonatomic) IBOutlet UIButton *CaiButton;
@property (weak, nonatomic) IBOutlet UIButton *ShareButton;
@property (weak, nonatomic) IBOutlet UIButton *CommentButton;

@end

@implementation TopicCell

- (void)awakeFromNib {
    // Initialization code
    
    UIImageView *bg = [[UIImageView alloc] init];
    bg.image = [UIImage imageNamed:@"mainCellBackground"];
    
    self.backgroundView = bg;
    
    
}

- (void)setModel:(TopicModel *)model{

    _model = model;
    
    
    [self.headImgaeView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.profile_image]] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    

    self.nickName.text = model.name;
    
    self.timeLabel.text = model.create_time;
    
    
    
    //帖子创建时间
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    NSDate *creatDate = [formatter dateFromString:model.create_time];
////    NSDate *now = [NSDate date];
//    
//    if (creatDate.isThisYear) {
//        
//        if (creatDate.isToday) {
//            
//            NSDateComponents *componts =[[NSDate date] deltaFromDate:creatDate];
//            
//            if (componts.hour >=1) {
//                
//                self.timeLabel.text = [NSString stringWithFormat:@"%zd小时前",componts.hour];
//            }else if (componts.minute >= 1){
//            
//            
//                self.timeLabel.text = [NSString stringWithFormat:@"%zd分钟前",componts.minute];
//                
//            }else{
//            
//                 self.timeLabel.text = @"刚刚";
//            
//            }
//            
//            
//        }else if (creatDate.isYesterday){
//        
//          formatter.dateFormat = @"昨天 HH:mm:ss";
//            
//          self.timeLabel.text = [formatter stringFromDate:creatDate];
//        
//        }else{
//        
//        
//            formatter.dateFormat = @"MM-dd HH:mm:ss";
//            
//            self.timeLabel.text = [formatter stringFromDate:creatDate];
//            
//        }
//        
//        
//        
//    }else{
//    
//    
//    
//    
//       
//    
//    
//    
//    
//    
//    
//    
//    
//    }
    
    
    
    [self setButton:self.DingButton count:model.ding placeholder:@"顶"];
    
    [self setButton:self.CaiButton count:model.cai placeholder:@"踩"];
    
    [self setButton:self.ShareButton count:model.repost placeholder:@"分享"];
    
    [self setButton:self.CommentButton count:model.comment placeholder:@"评论"];

}

- (void)setButton:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder{


//    count = 999;
    
     if (count > 10000){
    
         placeholder = [NSString stringWithFormat:@"%.1f",count / 10000.0];
    
     }else if(count > 0 ){
     
     
         placeholder = [NSString stringWithFormat:@"%zd",count];
     }

    
    
    [button setTitle:placeholder forState:UIControlStateNormal];
    



}

- (void)setFrame:(CGRect)frame{
    
    static CGFloat margin = 10;

    frame.origin.x = margin;

    frame.size.width -= 2 * frame.origin.x;
    
    frame.size.height -= margin;
    
    frame.origin.y += margin;

    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
