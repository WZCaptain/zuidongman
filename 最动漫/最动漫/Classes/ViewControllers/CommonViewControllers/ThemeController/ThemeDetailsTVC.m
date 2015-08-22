//
//  ThemeDetailsTVC.m
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ThemeDetailsTVC.h"
#import "ThemeDetailsCell.h"
#import "AFNetworking.h"

#define kThemeDetailURL @"http://api.kuaikanmanhua.com/v1/topics?limit=20&offset=0&tag="
#define KTableViewRowHeight 100

@interface ThemeDetailsTVC ()

@property(nonatomic,strong)NSMutableArray * themeDetailsArray;

@end

@implementation ThemeDetailsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib * nib = [UINib nibWithNibName:@"ThemeDetailsCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"themeDetailsCell"];
    
    [self analysisData];//请求并解析数据
}

- (NSMutableArray *)themeDetailsArray{
    if (!_themeDetailsArray) {
        _themeDetailsArray = [NSMutableArray array];
    }
    return _themeDetailsArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)analysisData{
    
    NSString * themeName = self.themeModel.title;

    NSString * urlStr = [[NSString stringWithFormat:@"%@",kThemeDetailURL] stringByAppendingString:themeName];
    
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString * strUrl = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
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
        NSArray * array = [dic[@"data"] objectForKey:@"topics"];
        
        //self.themeArray = [NSMutableArray array];
        for (NSDictionary * dict in array) {
            ThemeDetailsModel * themeDetailsModel2 = [[ThemeDetailsModel alloc]init];
            [themeDetailsModel2 setValuesForKeysWithDictionary:dict];
            [self.themeDetailsArray addObject:themeDetailsModel2];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
        NSLog(@"function == %s  line == %d error == %@",__FUNCTION__,__LINE__,error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _themeDetailsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ThemeDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"themeDetailsCell" forIndexPath:indexPath];
    
    cell.themeDatailsModel = self.themeDetailsArray[indexPath.row];
    
    
    UIView *aView = [[UIView alloc]initWithFrame:cell.frame];
    
    aView.backgroundColor = [UIColor clearColor];
    
    cell.selectedBackgroundView = aView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //在响应点击事件didSelectRowAtIndexPath中添加下面代码：(将cell上contentView背景在选择时置为白色，将contentView上textlabel在选择时背景置为白色)
    [self.tableView cellForRowAtIndexPath:indexPath].textLabel.backgroundColor = [UIColor whiteColor];
    
    [[self.tableView cellForRowAtIndexPath:indexPath].contentView setBackgroundColor:[UIColor clearColor]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KTableViewRowHeight;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

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
