//
//  RecommendLeftCell.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "RecommendLeftCell.h"
#import "RecommendModel.h"


@interface RecommendLeftCell()



@property (weak, nonatomic) IBOutlet UIView *lineView;



@end


@implementation RecommendLeftCell

- (void)awakeFromNib {
    // Initialization code
    
    self.backgroundColor = ZZRGBColor(244, 244, 244);
    
    self.textLabel.textColor = ZZRGBColor(78, 78, 78);
    
//    self.textLabel.highlightedTextColor = [UIColor redColor];
    
    
}



- (void)setModel:(RecommendModel *)model{

    _model = model;
    
    self.textLabel.text = model.name;

}

- (void)layoutSubviews{

   
    [super layoutSubviews];
    
    self.textLabel.zz_Y = 2;
    
    self.textLabel.zz_Height = self.contentView.zz_Height - 2 *self.textLabel.zz_Y;


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    self.lineView.hidden = !selected;
    
    self.textLabel.textColor = selected ? [UIColor redColor]:ZZRGBColor(78, 78, 78);
}

@end
