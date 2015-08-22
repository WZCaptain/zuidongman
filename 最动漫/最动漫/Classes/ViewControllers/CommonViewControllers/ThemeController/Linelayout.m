//
//  Linelayout.m
//  UILesson21_LineLayout
//
//  Created by lanou3g on 15/7/29.
//  Copyright (c) 2015年 lanou3g 任汪洋. All rights reserved.
//

#import "Linelayout.h"

#define kItem 100
#define kItemBJ 100

@implementation Linelayout

// 准备布局
- (void)prepareLayout{
    //item大小
    self.itemSize = CGSizeMake(kItem, kItem);
    
    //滑动方向
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //最小边距
    self.minimumLineSpacing = 10;
    
    //设置内边距
//    CGFloat insert = (self.collectionView.frame.size.width - kItem)*0.5;
    
    self.sectionInset = UIEdgeInsetsMake(25, 25, 25, 25);
}


-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}

@end
