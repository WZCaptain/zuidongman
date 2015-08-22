//
//  KFHeaderView.h
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFHeaderView : UIView
/**
 *  自定义view
 *
 *  @return KFHeaderView
 */
+ (KFHeaderView *)instancetypeView;

@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;

@property (weak, nonatomic) IBOutlet UILabel *headerLable;

@end
