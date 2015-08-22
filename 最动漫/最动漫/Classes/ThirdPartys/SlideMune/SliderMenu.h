//
//  SliderMenu.h
//  Group_Project
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderMenu : UIViewController

@property (nonatomic, readonly) UIViewController *contentController;
@property (nonatomic, readonly) UIViewController *menuController;

@property (nonatomic, assign) CGFloat menuWidth;
@property (nonatomic, assign) BOOL tapGestureEnabled;
@property (nonatomic, assign) BOOL panGestureEnabled;

//初始化方法
- (instancetype)initWithContentController:(UIViewController *)contentController
                           menuController:(UIViewController *)menuController;

- (void)setContentController:(UIViewController *)contentController
                     animted:(BOOL)animated;

//显示/收回侧边栏
- (void)showMenuAnimated:(BOOL)animated;
- (void)hideMenuAnimated:(BOOL)animated;
- (BOOL)isMenuVisible;
- (void)changeStatement;

//背景图片
- (void)setBackGroundImage:(UIImage *)image;

@end
