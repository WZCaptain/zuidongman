//
//  SliderMenu.m
//  Group_Project
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "SliderMenu.h"

//全局常量
const CGFloat SideMenuMinimumRelativePanDistanceToOpen = 0.33;
const CGFloat SideMenuDefaultMenuWidth = 260.0;
const CGFloat SideMenuDefaultDamping = 0.5;

//动画时间
const CGFloat SideMenuDefaultOpenAnimationTime = 1.2;
const CGFloat SideMenuDefaultCloseAnimationTime = 0.4;

@interface SliderMenu ()

@property (nonatomic, strong) UIImageView *backgroundImgView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation SliderMenu

#pragma mark -- 初始化
- (instancetype)initWithContentController:(UIViewController *)contentController menuController:(UIViewController *)menuController {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _contentController = contentController;
        _menuController = menuController;
        
        _menuWidth = SideMenuDefaultMenuWidth;
        _tapGestureEnabled = YES;
        _panGestureEnabled = YES;
    }
    return self;
}

#pragma mark -- UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子视图控制器
    [self addChildViewController:self.menuController];
    [self addChildViewController:self.contentController];
    [self.menuController didMoveToParentViewController:self];
    [self.contentController didMoveToParentViewController:self];
    
    //添加子视图
    self.containerView = [[UIView alloc]initWithFrame:self.view.bounds];
    _containerView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    [self.containerView addSubview:self.contentController.view];
    self.contentController.view.frame = self.containerView.bounds;
    self.contentController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_containerView];
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognized:)];
    [self.containerView addGestureRecognizer:self.panGestureRecognizer];
}

- (void)setBackGroundImage:(UIImage *)image {
    if (!self.backgroundImgView && image) {
        self.backgroundImgView = [[UIImageView alloc]initWithImage:image];
        self.backgroundImgView.frame = self.view.frame;
        self.backgroundImgView.layer.cornerRadius = self.backgroundImgView.frame.size.width/2;
        self.backgroundImgView.layer.masksToBounds = YES;
        self.backgroundImgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view insertSubview:self.backgroundImgView atIndex:0];
    } else if (image == nil) {
        [self.backgroundImgView removeFromSuperview];
        self.backgroundImgView = nil;
    } else {
        self.backgroundImgView.image = image;
    }
}

#pragma mark -- 替换ViewController

- (void)setContentController:(UIViewController *)contentController
                     animted:(BOOL)animated {
    if (contentController == nil) return;
    UIViewController *previousController = self.contentController;
    _contentController = contentController;
    
    //添加子视图控制器
    [self addChildViewController:self.contentController];
    
    //添加子视图
    self.contentController.view.frame = self.containerView.bounds;
    self.contentController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //动画效果
    __weak typeof(self) blockSelf = self;
    CGFloat offset = SideMenuDefaultMenuWidth + (self.view.frame.size.width - SideMenuDefaultMenuWidth)/2.0;
    [UIView animateWithDuration:SideMenuDefaultCloseAnimationTime/2.0 animations:^{
        blockSelf.containerView.transform = CGAffineTransformMakeTranslation(offset, 0);
        [blockSelf statusBarView].transform = blockSelf.containerView.transform;
        
    } completion:^(BOOL finished) {
        //移动到containerView
        [blockSelf.containerView addSubview:self.contentController.view];
        [blockSelf.contentController didMoveToParentViewController:blockSelf];
        
        //移除旧的VC
        [previousController willMoveToParentViewController:nil];
        [previousController removeFromParentViewController];
        [previousController.view removeFromSuperview];
        
        [blockSelf hideMenuAnimated:YES];
    }];
    
}

#pragma mark -- 滑动

- (void)tapGestureRecognized:(UITapGestureRecognizer *)TapGr {
}

- (void)changeStatement {
    if (!self.tapGestureEnabled) return;
    if (![self isMenuVisible]) {
        [self showMenuAnimated:YES];
    } else {
        [self hideMenuAnimated:YES];
    }
}

- (void)panGestureRecognized:(UIPanGestureRecognizer *)PanGr {
    if (!self.panGestureEnabled) return;
    CGPoint translation = [PanGr translationInView:PanGr.view];
    CGPoint velocity = [PanGr velocityInView:PanGr.view];
    
    switch (PanGr.state) {
        case UIGestureRecognizerStateBegan:
            [self addMenuControllerView];
            [PanGr setTranslation:CGPointMake(PanGr.view.frame.origin.x, 0) inView:PanGr.view];
            break;
        case UIGestureRecognizerStateChanged:
            [PanGr.view setTransform:CGAffineTransformMakeTranslation(MAX(0, translation.x), 0)];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            if (velocity.x > 5.0 || (velocity.x >= -1.0 && translation.x > SideMenuMinimumRelativePanDistanceToOpen * self.menuWidth)) {
                CGFloat tranformdVelocity = velocity.x / ABS(self.menuWidth - translation.x);
                CGFloat duration = SideMenuDefaultOpenAnimationTime * 0.66;
                [self showMenuAnimated:YES duration:duration initialVelocity:tranformdVelocity];
            } else {
                [self hideMenuAnimated:YES];
            }
        default:
            break;
    }
}

- (void)addMenuControllerView {
    if (self.menuController.view.superview == nil) {
        CGRect menuFrame, restFrame;
        CGRectDivide(self.view.bounds, &menuFrame, &restFrame, self.menuWidth, CGRectMinXEdge);
        self.menuController.view.frame = menuFrame;
        self.menuController.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
        self.view.backgroundColor = self.menuController.view.backgroundColor;
        if (self.backgroundImgView) {
            [self.view insertSubview:self.menuController.view aboveSubview:self.backgroundImgView];
        } else {
            [self.view insertSubview:self.menuController.view atIndex:0];
        }
    }
}

- (void)showMenuAnimated:(BOOL)animated {
    [self showMenuAnimated:animated duration:SideMenuDefaultCloseAnimationTime initialVelocity:1.0];
}

- (void)showMenuAnimated:(BOOL)animated duration:(CGFloat)duration initialVelocity:(CGFloat)velocity {
    
    //添加侧边栏View
    [self addMenuControllerView];
    
    //推动
    __weak typeof(self) blockSelf = self;
    [UIView animateWithDuration:animated ? duration : 0.0
                          delay:0 options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
        blockSelf.containerView.transform = CGAffineTransformMakeTranslation(self.menuWidth, 0);
        [self statusBarView].transform = blockSelf.containerView.transform;
    }
                     completion:nil];
}

- (void)hideMenuAnimated:(BOOL)animated {
    __weak typeof(self) blockSelf = self;
    [UIView animateWithDuration:SideMenuDefaultCloseAnimationTime animations:^{
        blockSelf.containerView.transform = CGAffineTransformIdentity;
        [self statusBarView].transform = blockSelf.containerView.transform;
    } completion:^(BOOL finished) {
        [blockSelf.menuController.view removeFromSuperview];
    }];
}

#pragma mark -- 显示状态

- (BOOL)isMenuVisible {
    return !CGAffineTransformEqualToTransform(self.containerView.transform, CGAffineTransformIdentity);
}

#pragma mark -- StatusBar

- (UIView *)statusBarView {
    UIView *statusBar = nil;
    NSString *key = @"stusBar";
    UIApplication *application = [UIApplication sharedApplication];
    if ([application respondsToSelector:NSSelectorFromString(key)]) {
        statusBar = [application valueForKey:key];
    }
    return statusBar;
}
@end
