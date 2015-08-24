//
//  RecommendCartoonModel.h
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.

/**
 * 推荐漫画模型
 */

#import <Foundation/Foundation.h>

@interface RecommendCartoonModel : NSObject
/**
 *  漫画评论数
 */
@property (copy, nonatomic) NSString *comments_count;
/**
 *  点赞数
 */
@property (copy, nonatomic) NSString *likes_count;
/**
 *  分享数
 */
@property (copy, nonatomic) NSString *shared_count;
/**
 *  漫画标题
 */
@property (copy, nonatomic) NSString *title;
/**
 *  当前更新标题
 */
@property (copy, nonatomic) NSString *partTitle;
/**
 *  用户名
 */
@property (copy, nonatomic) NSString *nickname;
/**
 *  漫画主题图片url
 */
@property (copy, nonatomic) NSString *cover_image_url;
/**
 *  用户头像url
 */
@property (copy, nonatomic) NSString *avatar_url;
/**
 *  漫画id
 */
@property (copy, nonatomic) NSString *ID;

@end
