//
//  ThemeDetailsCell.m
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ThemeDetailsCell.h"

@implementation ThemeDetailsCell

-(void)setThemeDatailsModel:(ThemeDetailsModel *)themeDatailsModel{
    self.titleLabel.text = themeDatailsModel.title;
    [self.userPic sd_setImageWithURL:[NSURL URLWithString:themeDatailsModel.avatar_url] placeholderImage:nil];
    self.userPic.layer.masksToBounds = YES;
    self.userPic.layer.cornerRadius = self.userPic.frame.size.width/2;
    
    self.nickNameLabel.text = themeDatailsModel.nickname;
    self.comments_countLabel.text = [NSString stringWithFormat:@"%@",themeDatailsModel.comments_count];
    self.likes_countLabel.text = [NSString stringWithFormat:@"%@",themeDatailsModel.likes_count];
    self.likesImgView.image = [UIImage imageNamed:@"icon_digup.png"];
    self.commentsImgView.image = [UIImage imageNamed:@"barbutton_menu_hov.png"];
    
    //设置button被选中情况下为黄色字体
    
    self.attentionBtn.backgroundColor = [UIColor clearColor];//button的背景颜色
    
    [self.attentionBtn setBackgroundImage:[UIImage imageNamed:@"favorites_btn_icon@2x.png"] forState:UIControlStateNormal];
    
    [self.mainImgView sd_setImageWithURL:[NSURL URLWithString:themeDatailsModel.cover_image_url] placeholderImage:nil];
    
    self.attentionBtn.layer.masksToBounds = YES;
    self.attentionBtn.layer.cornerRadius = 10;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)attentionBtn:(UIButton *)sender {
    
    [self.attentionBtn setBackgroundImage:[UIImage imageNamed:@"favorites_btn_icon_big@2x.png"] forState:UIControlStateNormal];
}
@end
