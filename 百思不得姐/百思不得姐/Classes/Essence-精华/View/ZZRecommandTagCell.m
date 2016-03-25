//
//  ZZRecommandTagCell.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/25.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZRecommandTagCell.h"

#import "RecommedTagsModel.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface ZZRecommandTagCell()



@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *labe1;

@property (weak, nonatomic) IBOutlet UILabel *labe2;
@end


@implementation ZZRecommandTagCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModel:(RecommedTagsModel *)model{


    _model = model;
    
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    
    self.labe1.text = model.theme_name;
    
    NSString *subNumber = nil;
    if (model.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅", model.sub_number];
    } else { // 大于等于10000
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅", model.sub_number / 10000.0];
    }
    
    self.labe2.text = subNumber;

}


- (void)setFrame:(CGRect)frame{


    
    frame.origin.x = 10;
    frame.size.width -= 2*frame.origin.x;
    
    frame.size.height -= 1;

    [super setFrame:frame];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
