//
//  RecommendUserCell.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "RecommendUserCell.h"
#import "RecommendUserModel.h"

#import <SDWebImage/UIImageView+WebCache.h>
@interface RecommendUserCell()


@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *fansLable;

@end


@implementation RecommendUserCell

- (void)awakeFromNib {
    // Initialization code
}



- (void)setModel:(RecommendUserModel *)model{


    _model = model;
    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.screenNameLabel.text = model.screen_name;
    
    self.fansLable.text = [NSString stringWithFormat:@"%zd人关注", model.fans_count];
    
//    ZZLog(@"%d",(int)model.fans_count);


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
