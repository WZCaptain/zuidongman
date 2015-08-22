//
//  ListModel.m
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"user"]) {
        NSDictionary *dic = value;
        self.nickname = dic[@"nickname"];
    }
}

@end
