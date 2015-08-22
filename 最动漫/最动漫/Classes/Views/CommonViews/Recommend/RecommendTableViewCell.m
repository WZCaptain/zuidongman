//
//  RecommendTableViewCell.m
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import "RecommendCartoonModel.h"
@interface RecommendTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImgView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImgView;

@property (weak, nonatomic) IBOutlet UILabel *nicknameLable;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLable;
@property (weak, nonatomic) IBOutlet UILabel *shareCountLable;
@property (weak, nonatomic) IBOutlet UILabel *commentsLable;
@property (weak, nonatomic) IBOutlet UILabel *topicLable;



@end


@implementation RecommendTableViewCell



- (void)awakeFromNib {
    // Initialization code
    [self.avatarImgView layoutIfNeeded];
    self.avatarImgView.layer.masksToBounds = YES;
    self.avatarImgView.layer.cornerRadius = self.avatarImgView.frame.size.width / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 创建cell
+ (instancetype)recommendTableViewCellWithTableView:(UITableView *)tableView andIdentifier:(NSString *)identifier
{
    RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (!cell) {
        cell = [[RecommendTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];;
    }
    // 设置点击cell为透明色
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = selectedView;
    return cell;
}

// 重写setRecommendModel方法进行赋值
- (void)setRecommendModel:(RecommendCartoonModel *)recommendModel
{
    _recommendModel = recommendModel;
    self.nicknameLable.text = recommendModel.nickname;
    self.titleLable.text = recommendModel.title;
    
    self.shareCountLable.text = [NSString stringWithFormat:@"%@",recommendModel.shared_count];
    self.commentsLable.text = [NSString stringWithFormat:@"%@",recommendModel.comments_count];
    self.likeCountLable.text = [NSString stringWithFormat:@"%@",recommendModel.likes_count];
    [self.avatarImgView sd_setImageWithURL:[NSURL URLWithString:recommendModel.avatar_url] placeholderImage:nil];
    [self.coverImgView sd_setImageWithURL:[NSURL URLWithString:recommendModel.cover_image_url] placeholderImage:nil];
    
    
}


@end
