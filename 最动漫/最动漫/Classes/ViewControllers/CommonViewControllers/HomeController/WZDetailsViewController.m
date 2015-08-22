//
//  WZDetailsViewController.m
//  最动漫
//
//  Created by lanou3g on 15/8/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "WZDetailsViewController.h"

@interface WZDetailsViewController ()

@property (nonatomic,strong) UIView * headerView;

@property (strong, nonatomic)UIView *bottomLineView;





@end

@implementation WZDetailsViewController


#define KCollectionCellHeight 39
static NSString *const cellIdentifier = @"cells";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    

    
       // [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBarHidden = YES;
    //self.view.backgroundColor = [UIColor whiteColor];
//    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 230)];
//    self.headerView.backgroundColor = [UIColor redColor];
//    self.navigationItem.titleView = self.headerView;
    
    
//    NSArray * array = [NSArray arrayWithObjects:@"简介",@"内容",nil];
//    UISegmentedControl * segmentControl = [[UISegmentedControl alloc]initWithItems:array];
//    segmentControl.frame = CGRectMake(0, 230, CGRectGetWidth(self.view.bounds), 50);
//    
//    segmentControl.selectedSegmentIndex = 0;
    
//    [self.view addSubview:segmentControl];
    

    
    
    
    
    
}

//-(void)uisegumentSelectionChange:(NSInteger)selection;







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
