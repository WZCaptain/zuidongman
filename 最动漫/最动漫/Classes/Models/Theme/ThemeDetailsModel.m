//
//  ThemeDetailsModel.m
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ThemeDetailsModel.h"

@implementation ThemeDetailsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key  isEqualToString:@"user"]) {
        NSDictionary *dict = value;
        self.nickname = dict[@"nickname"];
        self.avatar_url = dict[@"avatar_url"];
    }
}

@end
