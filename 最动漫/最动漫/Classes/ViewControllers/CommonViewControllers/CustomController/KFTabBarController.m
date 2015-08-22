//
//  KFTabBarController.m
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "KFTabBarController.h"
#import "KFNavigationController.h"
#import "ListTableViewController.h"
#import "UserViewController.h"
#import "ThemeViewController.h"
#import "SelectionTableViewController.h"

@interface KFTabBarController ()

@end

@implementation KFTabBarController

// 第一次使用这个类时调用
+ (void)initialize
{
    // 获取所有tabBarItem外观标示 (系统)
//    UITabBarItem *item = [UITabBarItem appearance];
    
    // 获取当前类的外观
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes [NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:attributes forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加子控制器
    [self setupAllChildViewController];
    
}


#pragma mark - 添加子控制器
- (void)setupAllChildViewController
{
    // 列表界面
    ListTableViewController *listController = [[ListTableViewController alloc]init];
    [self setupChildViewController:listController image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginaName:@"tabbar_home_selected"] title:@"看吧"];
  
    // 主题界面
    ThemeViewController *themeContorller = [[ThemeViewController alloc]init];
    [self setupChildViewController:themeContorller image:[UIImage imageNamed:@"favor"] selectedImage:[UIImage imageWithOriginaName:@"favor_hov"] title:@"主题"];
    
    // 发现界面
    SelectionTableViewController *selectionController = [[SelectionTableViewController alloc]init];
    [self setupChildViewController:selectionController image:[UIImage imageNamed:@"share"] selectedImage:nil title:@"漫画库"];
    
    // 个人界面
    UserViewController *userController = [[UserViewController alloc]init];
    [self setupChildViewController:userController image:[UIImage imageNamed:@"account"] selectedImage:[UIImage imageWithOriginaName:@"account_hov"] title:@"个人"];
}

/**
 *  初始化一个子控制器
 *
 *  @param VC            控制器
 *  @param image         图片
 *  @param selectedImage 选中图片
 *  @param title         标题
 */
- (void)setupChildViewController:(UIViewController *)VC image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = image;
    VC.tabBarItem.selectedImage = selectedImage;
    
    VC.navigationItem.title = title;
    
    // 设置导航
    KFNavigationController *navigationVC = [[KFNavigationController alloc]initWithRootViewController:VC];
    
    [self addChildViewController:navigationVC];
}



@end
