//
//  ZZaddTagToolView.m
//  百思不得姐
//
//  Created by 王夏军 on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZaddTagToolView.h"
#import "ZZAddTagViewController.h"
@interface ZZaddTagToolView()


@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property(nonatomic,strong)NSMutableArray *tagsArray;
@end





@implementation ZZaddTagToolView


- (NSMutableArray *)tagsArray{


    if (!_tagsArray) {
        
        
        _tagsArray = [NSMutableArray array];
    }


    return _tagsArray;
}

- (void)awakeFromNib{

    //加号按钮
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [addButton setImage:[UIImage imageNamed:@"tag_add_icon"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    addButton.zz_size = addButton.currentImage.size;
    addButton.zz_X = 10;
    
    self.addButton = addButton;
    
    [self.topView addSubview:addButton];



}


- (void)addButtonClick{
 __weak typeof(self)weakSelf = self;
    
    ZZAddTagViewController *vc = [[ZZAddTagViewController alloc] init];
    [vc setTagsBlock:^(NSArray *tags) {
      
        
        [weakSelf addTags:tags];
        
        
    }];
    
    vc.tagsArray = [self.tagsArray valueForKey:@"text"];
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nac = (UINavigationController *)root.presentedViewController;
    
    [nac pushViewController:vc animated:YES];
}



- (void)layoutSubviews{

    [super layoutSubviews];

    for (int i = 0; i<_tagsArray.count; i++) {
        
        
        UILabel *tagLabel =_tagsArray[i];
        if (i==0) {
            
            tagLabel.zz_X = 0;
            
            tagLabel.zz_Y = 0;
            
        }else{
            
            UILabel *lasttagLabel = self.tagsArray[i-1];
            
            CGFloat leftWidth = CGRectGetMaxX(lasttagLabel.frame) + ZZTagMargin;
            CGFloat rightWidth = self.topView.zz_Width - leftWidth;
            
            if (rightWidth >= tagLabel.zz_Width) {
                
                tagLabel.zz_Y = lasttagLabel.zz_Y;
                tagLabel.zz_X = leftWidth;
                
                
            }else{
                
                
                tagLabel.zz_X = 0;
                tagLabel.zz_Y = CGRectGetMaxY(lasttagLabel.frame) + ZZTagMargin;
                
                
            }
            
            
            
            
        }
        
        
    }

    UILabel *lastLabel = [self.tagsArray lastObject];
    
    CGFloat leftWidth = CGRectGetMaxX(lastLabel.frame) + ZZTagMargin;
    
    if (self.topView.zz_Width - leftWidth >= self.addButton.zz_Width) {
        
        self.addButton.zz_X = leftWidth;
        self.addButton.zz_Y = lastLabel.zz_Y;
        
    }else{
        
        self.addButton.zz_X = 0;
        self.addButton.zz_Y =CGRectGetMaxY(lastLabel.frame)+ZZTagMargin;
        
        
    }
    
    self.zz_Height = CGRectGetMaxY(self.addButton.frame)+45;
    
    
    

}
- (void)addTags:(NSArray *)tags{

    [self.tagsArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.tagsArray removeAllObjects];
    
    for (int i= 0; i< tags.count; i++) {
        
        UILabel *tagLabel = [[UILabel alloc] init];
        tagLabel.text = tags[i];
        tagLabel.font = [UIFont systemFontOfSize:14];
        tagLabel.textColor = [UIColor whiteColor];
        tagLabel.textAlignment = NSTextAlignmentCenter;
        [tagLabel sizeToFit];
        tagLabel.zz_Width += 2*ZZTagMargin;
        tagLabel.zz_Height = 25;
        tagLabel.backgroundColor =  ZZRGBColor(74,139,209);
        [self.tagsArray addObject:tagLabel];
        [self.topView addSubview:tagLabel];
        
    }

    
    //重新布局
    
    [self setNeedsLayout];
    
   
    
    
}
@end
