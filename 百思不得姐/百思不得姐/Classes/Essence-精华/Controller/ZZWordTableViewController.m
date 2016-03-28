//
//  ZZWordTableViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/28.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZWordTableViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import "TopicModel.h"
#import "TopicCell.h"
@interface ZZWordTableViewController ()


@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,assign)int page;

@property(nonatomic,copy)NSString *maxtime;


/** 上一次的请求参数 */
@property (nonatomic, strong) NSDictionary *params;

@end

@implementation ZZWordTableViewController


static NSString *const kcellid = @"topic";


- (NSMutableArray *)dataArray{


    if (_dataArray == nil) {
    
        _dataArray = [NSMutableArray arrayWithCapacity:0];
        
        
    }

    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.view.backgroundColor = ZZRGBColor(224, 224, 224);
    
    [self setUpTableView];
    
    
    [self setUpFefresh];
}

- (void)setUpTableView{

    
    CGFloat top = ZZTitilesViewH + ZZTitilesViewY;
    CGFloat bottom = self.tabBarController.tabBar.zz_Height;
    
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom-20, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
//    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.rowHeight = 190;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TopicCell class]) bundle:nil] forCellReuseIdentifier:kcellid];


}
- (void)setUpFefresh{



    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    

    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer.hidden = YES;



}

- (void)loadMoreData{

    // 结束刷新
    [self.tableView.mj_header endRefreshing];
    
//    self.page++;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    NSInteger page = self.page + 1;
    params[@"page"] = @(page);
    params[@"maxtime"] = self.maxtime;
    
    self.params = params;
    // 发送请求
    
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        if (self.params != params) return;
        
        //maxTime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        NSArray *Array = [TopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.dataArray addObjectsFromArray:Array];
        
//        ZZLog(@"%@",self.dataArray);
        
        
        [self.tableView reloadData];
        
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        
        
        // 设置页码
        _page = (int)page;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        
        
        if (self.params != params) return;
        
    }];



}

- (void)loadNewData{

    // 结束刷新
    [self.tableView.mj_footer endRefreshing];
    

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    
    self.params = params;
    
    // 发送请求
    
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (self.params != params) return;
        
        //maxTime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        
        
        self.dataArray = [TopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        ZZLog(@"%@",self.dataArray);
        
        
        [self.tableView reloadData];
        
      // 结束刷新
        [self.tableView.mj_header endRefreshing];
        
        
        self.page = 0;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        
    }];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    self.tableView.mj_footer.hidden = (self.dataArray.count == 0);
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:kcellid forIndexPath:indexPath];
    
    TopicModel *model = self.dataArray[indexPath.row];
    
//    cell.textLabel.text = model.name;
    cell.model = model;
    
    return cell;
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
