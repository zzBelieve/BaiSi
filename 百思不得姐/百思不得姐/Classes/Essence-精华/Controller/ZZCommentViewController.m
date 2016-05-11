//
//  ZZCommentViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/5/3.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZCommentViewController.h"
#import "UIBarButtonItem+ZZExtension.h"
#import "TopicCell.h"
@interface ZZCommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpace;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZZCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self makeUI];
    
    
    [self makeHeader];
    
    
    
}

- (void)makeHeader{


    TopicCell *cell = [TopicCell cell];
    
    cell.model = self.model;
    
    cell.zz_Height = self.model.cellHeight;
    
    self.tableView.tableHeaderView = cell;



}
- (void)makeUI{

    
    self.title = @"评论";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"comment_nav_item_share_icon" selectImage:@"comment_nav_item_share_icon_click" target:self action:@selector(rightBarButtonClick)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];

}

- (void)keyBoardWillChangeFrame:(NSNotification *)notic{


   
   CGRect frame = [notic.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    self.bottomSpace.constant = ZZScreenHeight - frame.origin.y;
    
    CGFloat durtion = [notic.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    
   [UIView animateWithDuration:durtion animations:^{
    
       [self.view layoutIfNeeded];
       
       
    }];




}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *ID = @"comment";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
    
}






- (void)rightBarButtonClick{






}






- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    [self.view endEditing:YES];


}


- (void)dealloc{

     [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
