//
//  ThemeCollectionViewCell.h
//  最动漫
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeModel.h"
#import "UIImageView+WebCache.h"

@interface ThemeCollectionViewCell : UICollectionViewCell<SDWebImageManagerDelegate>

@property (strong,nonatomic)ThemeModel * themeModel;

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


@end
