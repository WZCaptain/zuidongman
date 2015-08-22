//
//  tableViewController.m
//  tableView转Collection
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ListTableViewController.h"
#import "HeadView.h"
#import "AFNetworking.h"
#import "ListModel.h"
#import "TitleModel.h"
#import "WZDetailsViewController.h"

#define ListURL @"http://api.kuaikanmanhua.com/v1/topic_lists/mixed"

@interface ListTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UIView * view1;

@property (nonatomic,strong)UICollectionViewFlowLayout * layout;

@property (nonatomic,strong) NSMutableArray * titleArray;

@property (nonatomic,strong) NSMutableArray * listArray;

@property (nonatomic,strong) NSMutableArray * headerArray;

@property (nonatomic,strong) UIImageView * imgView;

@property (nonatomic,strong) ListModel * listModel;

@property (nonatomic,strong) TitleModel * titleModel;

@end

static NSString * ID = @"cell";
@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 230)];
   
    //解析数据
    [self setupData];
    
    //网络图片
    
        NSArray *imageArray = @[@"http://7ktqfr.com2.z0.glb.qiniucdn.com/image/150819/7v3s0egr3.jpg",
                            @"http://7ktqfr.com2.z0.glb.qiniucdn.com/image/150818/h77o5ofvq.jpg",
                            @"http://7ktqfr.com2.z0.glb.qiniucdn.com/image/150813/yf4c0a8gl.jpg",
                            @"http://7ktqfr.com2.z0.glb.qiniucdn.com/image/150813/5vbe8h1c0.jpg",
                            @"http://7ktqfr.com2.z0.glb.qiniucdn.com/image/150814/ycixbjzfj.jpg"];
    DJPageView *pageView = [[DJPageView alloc] initPageViewFrame:CGRectMake(0, 0, _view1.bounds.size.width, _view1.bounds.size.height) webImageStr:imageArray didSelectPageViewAction:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
     pageView.backgroundColor = [UIColor purpleColor];
    //停留时间
    pageView.duration = 3.0;
    pageView.pageBackgroundColor = [UIColor clearColor];
    pageView.pageIndicatorTintColor = [UIColor lightTextColor];
    pageView.currentPageColor = [UIColor whiteColor];
    [_view1 addSubview:pageView];
        

        
    self.tableView.tableHeaderView = _view1;
    
    _layout = [[UICollectionViewFlowLayout alloc]init];
    
    _layout.itemSize = CGSizeMake(110, 130);
    
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _layout.minimumInteritemSpacing = 0;
    
    _layout.minimumLineSpacing = 3;
    
    _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    
       
}

//懒加载
- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

- (NSMutableArray *)listArray{
    if (!_listArray) {
        _titleArray = [NSMutableArray array];
    }
    return _listArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

//自定义区头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeadView * view = [HeadView instancetypeView];
    
    view.descLable.text = self.headerArray[section];
 
    return view;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 25;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 150) collectionViewLayout:_layout];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [cell addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

#pragma mark - 请求数据
- (void)setupData
{
   
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // GET
    [manager GET:ListURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSMutableDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray * array = [dic[@"data"] objectForKey:@"topics"];
        NSMutableDictionary * dic1;
//        NSLog(@"%@",array);
        self.headerArray = [NSMutableArray array];
        for ( dic1 in array) {
             self.titleModel = [[TitleModel alloc]init];
            [_titleModel setValuesForKeysWithDictionary:dic1];
//            NSLog(@"+++++++%@",_titleModel.title);
            [_headerArray addObject:_titleModel.title];
           [self.titleArray addObject:_titleModel];
        
    }
       
        NSLog(@"-------%@",_headerArray);
        
        
        for (NSDictionary *listDic in dic1[@"topics"]) {
            self.listModel = [[ListModel alloc]init];
            [_listModel setValuesForKeysWithDictionary:listDic];
            NSLog(@"name == %@", _listModel.title);
            [self.listArray addObject:_listModel];
        }
        
        
       
        
        
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    
    }];
 
}


//有几个分组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
    
//    cell.imgView.image = [UIImage imageNamed:@"XCV3R.jpg"];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    WZDetailsViewController * detailVC = [[WZDetailsViewController alloc]initWithNibName:@"WZDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:detailVC animated:nil];
}



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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
