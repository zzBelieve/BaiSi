//
//  ZZRecommendTagsViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/25.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZRecommendTagsViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "RecommedTagsModel.h"
#import "ZZRecommandTagCell.h"
@interface ZZRecommendTagsViewController ()


@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ZZRecommendTagsViewController


static NSString *const KcellID = @"tags";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐标签";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZZRecommandTagCell class]) bundle:nil] forCellReuseIdentifier:KcellID];
    self.tableView.rowHeight = 70;
    self.tableView.backgroundColor = ZZRGBColor(248, 248, 248);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self loadData];
}


- (void)loadData{


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";

    
    
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.dataArray = [NSArray array];
        
        self.dataArray = [RecommedTagsModel mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
        
    }];




}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
     return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    ZZRecommandTagCell *cell = [tableView dequeueReusableCellWithIdentifier:KcellID forIndexPath:indexPath];
    
    RecommedTagsModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
    
}



@end
