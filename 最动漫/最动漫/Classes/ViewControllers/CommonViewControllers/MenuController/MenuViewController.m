//
//  MenuViewController.m

//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年  All rights reserved.
//

#import "MenuViewController.h"

#import "UIViewController+SlideMennu.h"

@interface MenuViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) NSArray *munesArray;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
    
//    self.subView.backgroundColor = [UIColor blackColor];
    
    UIImageView *backgroundView = [[UIImageView alloc]init];
    backgroundView.image = [UIImage imageNamed:@"ag_background"];
    self.tableView.backgroundView = backgroundView;
}

// 懒加载
- (NSArray *)munesArray
{
    if (!_munesArray) {
        _munesArray = @[@"首页",@"关注",@"主题",@"设置"];
    }
    return _munesArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.munesArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.munesArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat randomHue = (arc4random()%256/256.0);
    UIViewController *VC = [[UIViewController alloc]init];
    VC.view.backgroundColor = [UIColor colorWithHue:randomHue saturation:1.0 brightness:1.0 alpha:1.0];
    UIViewController *contentController = [[UINavigationController alloc]initWithRootViewController:VC];
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
    [self.slideMenuController setContentController:contentController animted:YES];
//    NSLog(@"asdasdasdasdasd");
}
@end
