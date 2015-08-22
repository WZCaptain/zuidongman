//
//  ThemeCollectionViewCell.m
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ThemeCollectionViewCell.h"

@implementation ThemeCollectionViewCell



- (void)setThemeModel:(ThemeModel *)themeModel{
    self.nameLabel.text = themeModel.title;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    
    self.imgView.layer.masksToBounds = YES;
    self.imgView.layer.cornerRadius = self.imgView.frame.size.width/2;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:themeModel.icon] placeholderImage:nil];
}



- (void)awakeFromNib {
    // Initialization code
}

@end
