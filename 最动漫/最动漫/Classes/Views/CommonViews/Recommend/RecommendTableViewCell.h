//
//  RecommendTableViewCell.h
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RecommendCartoonModel;

@interface RecommendTableViewCell : UITableViewCell
/**
 *  推荐动画模型
 */
@property (strong, nonatomic) RecommendCartoonModel *recommendModel;

/**
 *  类方法进行cell的初始化
 *
 *  @param tableView 传过来的参数
 *  @param identifier cell重用标识
 *  @return 任意类型
 */
+ (instancetype)recommendTableViewCellWithTableView:(UITableView *)tableView andIdentifier:(NSString *)identifier;




@end
