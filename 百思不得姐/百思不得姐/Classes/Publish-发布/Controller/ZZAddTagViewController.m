//
//  ZZAddTagViewController.m
//  百思不得姐
//
//  Created by 王夏军 on 16/5/11.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZAddTagViewController.h"
#import "ZZTagButton.h"
@interface ZZAddTagViewController ()

/** 容器 */
@property (nonatomic, weak)UIView *containerView;

/** textField */
@property (nonatomic, weak)UITextField *textField;

/** addButton */
@property (nonatomic, weak)UIButton *addButton;


@property (nonatomic, strong)NSMutableArray *tagButtonArray;
@end

@implementation ZZAddTagViewController

- (NSMutableArray *)tagButtonArray{

    if (!_tagButtonArray) {
        
        
        _tagButtonArray = [NSMutableArray array];
        
    }

    return _tagButtonArray;
}

- (UIButton *)addButton{

   
    if (!_addButton) {
        
        
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.zz_Width = ZZScreenWidth-20;
        addButton.zz_Height = 35;
        addButton.zz_X = ZZTagMargin;
        [addButton setBackgroundColor:ZZRGBColor(74,139,209)];
        
        [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        addButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.containerView addSubview:addButton];
        
        _addButton = addButton;

    }

    return _addButton;

}

- (void)addButtonClick{

//    UIButton *tagButton = [[UIButton alloc] init];
     ZZTagButton *tagButton = [ZZTagButton buttonWithType:UIButtonTypeCustom];
    [tagButton setTitle:self.textField.text forState:UIControlStateNormal];
    
    [tagButton setImage:[UIImage imageNamed:@"chose_tag_close_icon"] forState:UIControlStateNormal];
    [tagButton setBackgroundColor:ZZRGBColor(74,139,209)];
    [tagButton addTarget:self action:@selector(tagButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [tagButton sizeToFit];
    [self.containerView addSubview:tagButton];
    
    
    [self.tagButtonArray addObject:tagButton];
    
    
    self.textField.text = nil;
    self.addButton.hidden = YES;
    
    
    
    [self updateFrame];

}
- (void)tagButtonClick:(UIButton *)button{

    [button removeFromSuperview];
    [self.tagButtonArray removeObject:button];
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        
         [self updateFrame];
    }];
   
   

}
- (void)updateFrame{


    for (int i = 0; i<self.tagButtonArray.count; i++) {
        
        
        ZZTagButton *tagButton = self.tagButtonArray[i];
        
        
        if (i==0) {
        
            tagButton.zz_X = 0;
            
             tagButton.zz_Y = 0;
            
        }else{
        
            ZZTagButton *lastTagButton = self.tagButtonArray[i-1];
            
            CGFloat leftWidth = CGRectGetMaxX(lastTagButton.frame) + ZZTagMargin;
            CGFloat rightWidth = self.containerView.zz_Width - leftWidth;
            
            if (rightWidth >= tagButton.zz_Width) {
                
                tagButton.zz_Y = lastTagButton.zz_Y;
                tagButton.zz_X = leftWidth;
                
                
            }else{
                
                
                tagButton.zz_X = 0;
                tagButton.zz_Y = CGRectGetMaxY(lastTagButton.frame) + ZZTagMargin;
            
            
            }
            
            
        
        
        }
        
        
        
        
    }
    
    
    ZZTagButton *lastButton = [self.tagButtonArray lastObject];
    
    CGFloat leftWidth = CGRectGetMaxX(lastButton.frame) + ZZTagMargin;
    
    if (self.containerView.zz_Width - leftWidth >= [self textFieldTextWidth]) {
        
        self.textField.zz_X = leftWidth;
        self.textField.zz_Y = lastButton.zz_Y;
        
    }else{
    
        self.textField.zz_X = 0;
        self.textField.zz_Y =CGRectGetMaxY(lastButton.frame)+ZZTagMargin;
    
    
    }
//
//    self.textField.zz_X  =0;
//    self.textField.zz_Y = CGRectGetMaxY([[self.tagButtonArray lastObject] frame]) + ZZTagMargin;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    
    [self creatNav];
    
    [self addContainerVew];
    [self addTextField];
    
    
}

- (void)addContainerVew{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(ZZTagMargin, 74, ZZScreenWidth - 2*ZZTagMargin, ZZScreenHeight)];
    view.backgroundColor = [UIColor redColor];
    self.containerView = view;
    [self.view addSubview:view];








}

- (void)addTextField{

    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, ZZScreenWidth, 25)];
    field.placeholder = @"多个标签用逗号或者换行添加";
    [field addTarget:self action:@selector(TextFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.containerView addSubview:field];
    
    self.textField = field;

}
- (void)TextFieldTextDidChange{
    
    
    
    if (self.textField.hasText) {
    
        self.addButton.hidden = NO;
        
        self.addButton.zz_Y = CGRectGetMaxY(self.textField.frame) + ZZTagMargin;
        
        NSString *str = [NSString stringWithFormat:@"添加标签%@",self.textField.text];
        [self.addButton setTitle:str forState:UIControlStateNormal];
        
    }else{
    
      self.addButton.hidden = YES;
    
    }
    
    
    [self updateFrame];
}
- (void)creatNav{

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"添加标签";
    
    

    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonClick)];

    self.navigationItem.rightBarButtonItem = rightButton;

}

- (CGFloat)textFieldTextWidth{


    CGFloat textW = [self.textField.text sizeWithAttributes:@{NSFontAttributeName : self.textField.font}].width;
    
    return MAX(100, textW);



}






- (void)rightButtonClick{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
