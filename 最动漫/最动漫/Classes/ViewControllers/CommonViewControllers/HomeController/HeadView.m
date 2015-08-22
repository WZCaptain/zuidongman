//
//  HeadView.m
//  tableView转Collection
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HeadView.h"

@interface HeadView ()

@end

@implementation HeadView

+ (HeadView *)instancetypeView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"HeadView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

- (IBAction)didClickNext:(UIButton *)sender {
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
