//
//  ZZMeViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZMeViewController.h"
#import "ZZMeCell.h"
#import "ZZMeFooterView.h"
@interface ZZMeViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZZMeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self creatNav];
    
    [self setUpTableView];
    
}

static NSString * const kCellId = @"me";
- (void)setUpTableView{



    self.tableView.backgroundColor = ZZRGBColor(223, 223, 223);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 调整header和footer
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    
    
    [self.tableView registerClass:[ZZMeCell class] forCellReuseIdentifier:kCellId];

    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    self.tableView.tableFooterView = [[ZZMeFooterView alloc] init];
}
- (void)creatNav{
    
    
    //导航栏
    
    // 设置导航栏标题
    self.navigationItem.title = @"我的";
    
    // 设置导航栏右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" selectImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" selectImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    
    


}
- (void)settingClick
{
    ZZLogFunc;
}

- (void)moonClick
{
    ZZLogFunc;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ZZMeCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"mine_icon_nearby"];
        cell.textLabel.text = @"登录/注册";
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"离线下载";
    }
    
    return cell;
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//
//  if (section == 1) {
//    return 500;
//      
//  }
//    
//    return 10;
//}
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
