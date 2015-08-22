//
//  HeadView.h
//  tableView转Collection
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView

+ (HeadView *)instancetypeView;

@property (weak, nonatomic) IBOutlet UILabel *descLable;

- (IBAction)didClickNext:(UIButton *)sender;





@end
