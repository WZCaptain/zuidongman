//
//  SelectionTableViewController.m
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SelectionTableViewController.h"
#import "RecommendTableViewCell.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "RecommendCartoonModel.h"
#import "KFHeaderView.h"
#import "KFComicDetailController.h"

@interface SelectionTableViewController ()


@property (strong, nonatomic) NSMutableArray *comicListMArray;
@property (weak, nonatomic) KFHeaderView *headerView;

@end

@implementation SelectionTableViewController
static NSString *cellID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册cell
    UINib *nib = [UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellID];
   
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:1.000 green:1.000 blue:0.400 alpha:1.000]];
//  self.navigationController.navigationBar.translucent = NO;

    [self setupHeaderView];
    
    // 添加下拉刷新控件
    [self.tableView addHeaderWithTarget:self action:@selector(setupNewData)];
    
    // 自动下拉刷新
    [self.tableView headerBeginRefreshing];

}

// 设置headerView
- (void)setupHeaderView
{
    self.headerView = [KFHeaderView instancetypeView];
    self.tableView.tableHeaderView = self.headerView;
}

#pragma mark - 懒加载
- (NSMutableArray *)comicListMArray
{
    if (!_comicListMArray) {
        _comicListMArray = [NSMutableArray array];
    }
    return _comicListMArray;
}

#pragma mark - 请求数据
- (void)setupNewData
{
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 发送请求
    [manager GET:kHomeURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 结束上拉刷新
        [self.tableView headerEndRefreshing];
        
        NSArray *comicsArray = [responseObject[@"data"] objectForKey:@"comics"];
        for (NSDictionary *dic in comicsArray) {
            RecommendCartoonModel *cartoonModel = [[RecommendCartoonModel alloc]init];
            [cartoonModel setValuesForKeysWithDictionary:dic];
            [self.comicListMArray addObject:cartoonModel];
        }
        
       dispatch_async(dispatch_get_main_queue(), ^{
           
           [self.tableView reloadData];
       });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"function == %s  line == %d  error == %@",__FUNCTION__,__LINE__,error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.comicListMArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecommendTableViewCell *recommendCell = [RecommendTableViewCell recommendTableViewCellWithTableView:tableView andIdentifier:cellID];
    recommendCell.recommendModel = self.comicListMArray[indexPath.row];
    return recommendCell;
}

// cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}

// 点击某个cell进入详情
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KFComicDetailController *comicDetailVC = [[KFComicDetailController alloc]init];
    [self.navigationController pushViewController:comicDetailVC animated:YES];
}



@end
