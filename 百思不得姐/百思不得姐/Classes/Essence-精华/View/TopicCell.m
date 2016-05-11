//
//  TopicCell.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "TopicCell.h"
#import "TopicModel.h"
#import "CommentModel.h"
#import "UserModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSDate+ZZDateExtension.h"
#import "ZZTopicPictureView.h"
#import "ZZTopicVoiceView.h"
#import "ZZTopicVideoView.h"
#import "UIImage+ZZExtension.h"
@interface TopicCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImgaeView;

@property (weak, nonatomic) IBOutlet UILabel *nickName;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (weak, nonatomic) IBOutlet UIButton *DingButton;
@property (weak, nonatomic) IBOutlet UIButton *CaiButton;
@property (weak, nonatomic) IBOutlet UIButton *ShareButton;
@property (weak, nonatomic) IBOutlet UIButton *CommentButton;
@property (weak, nonatomic) IBOutlet UIImageView *sinaView;

@property (weak, nonatomic) IBOutlet UILabel *myTextLabel;

@property(nonatomic,weak)ZZTopicPictureView *pictureView;

@property(nonatomic,weak)ZZTopicVoiceView *voiceView;

@property(nonatomic,weak)ZZTopicVideoView *videoView;
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
@property (weak, nonatomic) IBOutlet UILabel *top_cmtLable;
@end

@implementation TopicCell


+ (instancetype)cell{



  return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];


}

- (ZZTopicPictureView *)pictureView{

    if (!_pictureView) {
        
        
       ZZTopicPictureView *pictureView = [ZZTopicPictureView PictureView];
        
       [self.contentView addSubview:pictureView];
        
        _pictureView = pictureView;
        
    }
   
    return _pictureView;

}
- (ZZTopicVideoView *)videoView{


    if (!_videoView) {
        
        ZZTopicVideoView *videoView = [ZZTopicVideoView VideoView];
        
        [self.contentView addSubview:videoView];
        
        _videoView = videoView;
    }


    return _videoView;


}

- (ZZTopicVoiceView *)voiceView{
    
    if (!_voiceView) {
        
        
        ZZTopicVoiceView *voiceView = [ZZTopicVoiceView VoiceView];
        
        [self.contentView addSubview:voiceView];
        
        _voiceView = voiceView;
        
    }
    
    return _voiceView;
    
}


- (void)awakeFromNib {
    // Initialization code
    
    UIImageView *bg = [[UIImageView alloc] init];
    bg.image = [UIImage imageNamed:@"mainCellBackground"];
    
    self.backgroundView = bg;
    
    
    
    
    
}

- (void)setModel:(TopicModel *)model{

    _model = model;
    
    
    [self.headImgaeView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.profile_image]] placeholderImage:[[UIImage imageNamed:@"defaultUserIcon"] circleImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        self.headImgaeView.image = [image circleImage];
        
    }];
    

    self.nickName.text = model.name;
    
    self.timeLabel.text = model.create_time;
    
    self.sinaView.hidden = !model.is_sinav;
    
    self.myTextLabel.text = model.text;
    
    [self setButton:self.DingButton count:model.ding placeholder:@"顶"];
    
    [self setButton:self.CaiButton count:model.cai placeholder:@"踩"];
    
    [self setButton:self.ShareButton count:model.repost placeholder:@"分享"];
    
    [self setButton:self.CommentButton count:model.comment placeholder:@"评论"];
    
    
    //根据模型类型判断是否加载 pictureView
    
    if (model.type == ZZTopicTypePicture) {
        
        self.pictureView.hidden = NO;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
        
        
        self.pictureView.model = model;
        
        self.pictureView.frame = model.pictureViewFrame;
        
    }else if (model.type == ZZTopicTypeVoice) {
        
        self.voiceView.hidden = NO;
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        
        self.voiceView.model = model;
        
        self.voiceView.frame = model.voiceViewFrame;
        
    }else if (model.type == ZZTopicTypeVideo) {
        self.videoView.hidden = NO;
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
        
        self.videoView.model = model;
        
        self.videoView.frame = model.videoViewFrame;
        
    }else {
        
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
        
    }
    
    //处理最热评论
    
    CommentModel *commtnModel = [model.top_cmt firstObject];
    
    if (commtnModel) {
        
        self.topCmtView.hidden = NO;
        self.top_cmtLable.text = [NSString stringWithFormat:@"%@ : %@",commtnModel.user.username,commtnModel.content];
    }else{
    
      self.topCmtView.hidden = YES;
    
    }
    
    

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
    
//    frame.size.height = self.model.cellHeight - ZZTopicCellMargin;
    
    frame.origin.y += margin;

    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
