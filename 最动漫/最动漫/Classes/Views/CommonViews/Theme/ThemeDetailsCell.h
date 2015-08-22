//
//  ThemeDetailsCell.h
//  最动漫
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeDetailsModel.h"
#import "UIImageView+WebCache.h"

@interface ThemeDetailsCell : UITableViewCell


@property (nonatomic,strong) ThemeDetailsModel * themeDatailsModel;
@property (nonatomic,strong) NSMutableArray * userDic;
@property (strong, nonatomic) IBOutlet UIImageView *mainImgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userPic;
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *likesImgView;
@property (strong, nonatomic) IBOutlet UILabel *likes_countLabel;
@property (strong, nonatomic) IBOutlet UIImageView *commentsImgView;
@property (strong, nonatomic) IBOutlet UILabel *comments_countLabel;
- (IBAction)attentionBtn:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *attentionBtn;


@end
