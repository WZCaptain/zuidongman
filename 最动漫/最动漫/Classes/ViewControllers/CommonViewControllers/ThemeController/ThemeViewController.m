//
//  ThemeViewController.m
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ThemeViewController.h"
#import "Linelayout.h"
#import "ThemeCollectionViewCell.h"
#import "AFNetworking.h"
#import "ThemeModel.h"
#import "ThemeDetailsTVC.h"

#define kThemeURL @"http://api.kuaikanmanhua.com/v1/tag/suggestion"

@interface ThemeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,retain)NSMutableArray * themeArray;
@property(nonatomic,retain)UICollectionView * cv;

@end

@implementation ThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    //self.tabBarController.tabBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    Linelayout * layout = [[Linelayout alloc]init];
    
    self.cv = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _cv.backgroundColor = [UIColor whiteColor];
    
    _cv.dataSource = self;
    _cv.delegate = self;
    
    // 设置footer区域大小
    layout.footerReferenceSize = CGSizeMake(self.view.bounds.size.width, 100);
    
    [self.view addSubview:_cv];
    UINib * nib = [UINib nibWithNibName:@"ThemeCollectionViewCell" bundle:nil];
    [_cv registerNib:nib forCellWithReuseIdentifier:@"themeCell"];
    
    [self analysisData];
}

- (NSMutableArray *)themeArray
{
    if (!_themeArray) {
        _themeArray = [NSMutableArray array];
    }
    return _themeArray;
}


- (void)analysisData{
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString * strUrl = [kThemeURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //创建请求操作评估使用的安全策略服务器信任安全连接
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    // 设置请求格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //GET请求
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        
        NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSMutableDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

//        NSMutableDictionary * dataDic = dic[@"data"];
        NSArray * array = [dic[@"data"] objectForKey:@"suggestion"];

        for (NSDictionary * dict in array) {
            ThemeModel * themeModel = [[ThemeModel alloc]init];
            [themeModel setValuesForKeysWithDictionary:dict];
            [self.themeArray addObject:themeModel];

//            NSLog(@"%@",_themeArray);
        }
        
        [self.cv reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
        NSLog(@"function == %s  line == %d error == %@",__FUNCTION__,__LINE__,error);
    }];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%s",__FUNCTION__);
    return _themeArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ThemeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"themeCell" forIndexPath:indexPath];
    
    cell.themeModel = _themeArray[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ThemeDetailsTVC * themeDetailsTVC = [[ThemeDetailsTVC alloc]init];
    [self.navigationController pushViewController:themeDetailsTVC animated:YES];
    themeDetailsTVC.themeModel = _themeArray[indexPath.row];
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
