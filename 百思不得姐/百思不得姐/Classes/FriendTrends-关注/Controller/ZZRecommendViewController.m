//
//  ZZRecommendViewController.m
//  百思不得姐
//
//  Created by ZZBelieve on 16/3/24.
//  Copyright © 2016年 ZZBelieve. All rights reserved.
//

#import "ZZRecommendViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import "RecommendLeftCell.h"
#import "RecommendUserCell.h"
#import "RecommendModel.h"
#import "RecommendUserModel.h"
@interface ZZRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>

//左边tableview
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;

//右边tableview
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

//左边数据
@property(nonatomic,strong)NSArray *categoryArray;

//右边数据
@property(nonatomic,strong)NSArray *userArray;

//请求参数
@property(nonatomic,strong)NSMutableDictionary *params;


@property(nonatomic,strong)AFHTTPSessionManager *manager;
@end

@implementation ZZRecommendViewController


static NSString *const KleftCellID = @"KleftCellID";

static NSString *const KrightCellID = @"KrightCellID";

#define SelectRow self.categoryArray[self.leftTableView.indexPathForSelectedRow.row];

#pragma mark - View lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"推荐关注";
    
    
    
    
    [self setUpTableView];
    
    [self setUpRefresh];
    
    [self loadleftData];
    
    
    
}

- (void)setUpRefresh{


    self.rightTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    self.rightTableView.mj_footer.hidden = YES;


    self.rightTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

}

#pragma mark - 加载最新

- (void)loadNewData{
    
   RecommendModel *model = SelectRow;
    
    //设置当前页码
    
    model.currentPage = 1;
    
    self.manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(model.id);
    params[@"page"] = @(model.currentPage);
    
    
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
//        ZZLog(@"responseObject----%@",responseObject);
        
        
        //                NSArray *users  = [NSArray array];
        
        
        
        
        
        NSArray *users= [RecommendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [model.usersArray removeAllObjects];
        
        [model.usersArray addObjectsFromArray:users];
        
        
        //保存总数
        
        model.total = [responseObject[@"total"] integerValue];
        
        
        if (self.params!=params) return;
        
        
        
        [self.rightTableView reloadData];
        
        [self.rightTableView.mj_header endRefreshing];
        
        
        [self checkFooter];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
         if (self.params!=params) return;
        
         [self.rightTableView.mj_header endRefreshing];
        
    }];


}
#pragma mark - 加载更多
- (void)loadMoreData{

    
    RecommendModel *model = SelectRow;
    

    self.manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(model.id);
    params[@"page"] = @(model.currentPage++);
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        ZZLog(@"responseObject----%@",responseObject);
        
        
        //                NSArray *users  = [NSArray array];
        
        
        NSArray *users= [RecommendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [model.usersArray addObjectsFromArray:users];
        
        
        [self.rightTableView reloadData];
        
        
      
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
   



}
- (void)setUpTableView{


    
    [self.leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendLeftCell class]) bundle:nil] forCellReuseIdentifier:KleftCellID];
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
//    self.leftTableView.tableFooterView = [[UIView alloc] init];


    [self.rightTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendUserCell class]) bundle:nil] forCellReuseIdentifier:KrightCellID];
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    self.rightTableView.tableFooterView = [[UIView alloc] init];
    self.rightTableView.rowHeight = 70;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.rightTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}

#pragma mark - 加载左边数据
- (void)loadleftData{



    [SVProgressHUD showWithStatus:@"加载中"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    parmas[@"a"] = @"category";
    parmas[@"c"] = @"subscribe";
    
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parmas progress:^(NSProgress * _Nonnull downloadProgress) {
    
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
//        ZZLog(@"responseObject----%@",responseObject);
        
        self.categoryArray = [NSArray array];
        
    
        self.categoryArray = [RecommendModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        
        
        
        
        [self.leftTableView reloadData];
        
        
        //默认选中首行
        
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD dismiss];
    }];
    







}
//检测footer
- (void)checkFooter{


    //结束刷新
    RecommendModel *model = self.categoryArray[self.leftTableView.indexPathForSelectedRow.row ];
    
    
    //控制footer显示或者隐藏
    
    self.rightTableView.mj_footer.hidden = (model.usersArray.count==0);
    
    
    
    if (model.usersArray.count == model.total) {
        
        
        [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
        
    }else{
        
        [self.rightTableView.mj_footer endRefreshing];
    }
    

}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    
    if (tableView==_leftTableView) {
        
          return self.categoryArray.count;
        
    }else{
    
//        return self.userArray.count;
        
        
        
        [self checkFooter];
        
        RecommendModel *model = self.categoryArray[self.leftTableView.indexPathForSelectedRow.row ];
        
        
        
        return model.usersArray.count;
    
    }

   

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (tableView==_leftTableView) {
        
        RecommendLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:KleftCellID forIndexPath:indexPath];
        
        cell.model = self.categoryArray[indexPath.row];
        
        
        return cell;
        
    }else{
    
        
        RecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:KrightCellID forIndexPath:indexPath];
        
        RecommendModel *model = self.categoryArray[self.leftTableView.indexPathForSelectedRow.row ];
        
        cell.model = model.usersArray[indexPath.row];
        
        
        return cell;
    
    
    }
    
   
    
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    RecommendModel *model =  self.categoryArray[indexPath.row];
    
    [self.leftTableView.mj_footer endRefreshing];
    [self.leftTableView.mj_header endRefreshing];
    
    
    if (tableView==_leftTableView) {
        
        
        
        
        
        if (model.usersArray.count) {
            
            //显示曾经的数据
            [self.rightTableView reloadData];
            
        }else{
        
            
            //赶紧刷新表格 马上显示
           [self.rightTableView reloadData];
            
            
            //header刷新
            
           [self.rightTableView.mj_header beginRefreshing];
            
           
        
        
        }
        
        
        
    }else{
    
      ZZLogFunc
    
      
    }
    
   
    

}


//销毁控制器 取消所有的请求
- (void)dealloc{

  
    [self.manager.operationQueue cancelAllOperations];

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
