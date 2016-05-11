//
//  ZZMeCell.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZMeCell.h"

@implementation ZZMeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *bg = [[UIImageView alloc] init];
        bg.image = [UIImage imageNamed:@"mainCellBackground"];
        
        self.backgroundView = bg;
        
        self.textLabel.font = [UIFont systemFontOfSize:15];
        
        self.textLabel.textColor = [UIColor darkGrayColor];
    }

    return self;
    

}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    if (self.imageView.image == nil) return;

    self.imageView.zz_Width = 30;
    self.imageView.zz_Height = self.imageView.zz_Width;
    self.imageView.zz_CenterY = self.contentView.zz_Height * 0.5 ;

    
    self.textLabel.zz_X = CGRectGetMaxX(self.imageView.frame) + ZZTopicCellMargin;


    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
