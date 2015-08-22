//
//  ListModel.h
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

//首页
@property (nonatomic,strong) NSString * title;

//图片的作者
@property (nonatomic,strong) NSString * nickname;

//首页图片
@property (nonatomic,strong) NSString * vertical_image_url;

@end
