//
//  ThemeDetailsModel.h
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeDetailsModel : NSObject

//title: 主题
//likes_count:点赞数
//comments_count:评论数
//cover_image_url: 主题图片
//nickname : 用户名/作者名

@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * likes_count;
@property(nonatomic,strong)NSString * comments_count;
@property(nonatomic,strong)NSString * cover_image_url;
@property(nonatomic,strong)NSString * nickname;
@property(nonatomic,strong)NSString * avatar_url;

@end
