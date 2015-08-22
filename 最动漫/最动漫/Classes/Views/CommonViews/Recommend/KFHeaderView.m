//
//  KFHeaderView.m
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "KFHeaderView.h"

#define kHight 50
#define kVertical 64
#define kHorizontal 0

@interface KFHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *alertLable;

@end

@implementation KFHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (KFHeaderView *)instancetypeView
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"KFHeader" owner:nil options:nil];
    return [views lastObject];
//    return [nibView objectAtIndex:0];
}

- (void)awakeFromNib
{
    self.frame = CGRectMake(kHorizontal, kVertical, [UIScreen mainScreen].bounds.size.width, kHight);
    self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
}

@end
