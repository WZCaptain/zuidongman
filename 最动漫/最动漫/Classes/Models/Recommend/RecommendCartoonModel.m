//
//  RecommendCartoonModel.m
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RecommendCartoonModel.h"

@implementation RecommendCartoonModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
       if ([key isEqualToString:@"topic"]) {
        NSDictionary *dic = value;
        self.title = dic[@"title"];
        self.avatar_url = [dic[@"user"] objectForKey:@"avatar_url"];
        self.nickname = [dic[@"user"] objectForKey:@"nickname"];
    }
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"id"]) {
        self.ID = [NSString stringWithFormat:@"%@",value];
    }
    
    if ([key isEqualToString:@"title"]) {
        self.partTitle = value;
    }

}

@end
