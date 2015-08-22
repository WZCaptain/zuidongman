//
//  KFNavigationController.m
//  最动漫
//
//  Created by lanou3g on 15/8/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "KFNavigationController.h"

@interface KFNavigationController ()

@end

@implementation KFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) { // 不是根控制器
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}



@end
