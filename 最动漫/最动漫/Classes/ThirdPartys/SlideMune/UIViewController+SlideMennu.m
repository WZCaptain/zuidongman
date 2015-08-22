//
//  UIViewController+SlideMennu.m
//  Group_Project
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "UIViewController+SlideMennu.h"

@implementation UIViewController (SlideMennu)

- (SliderMenu *)slideMenuController {
    if ([self.parentViewController isKindOfClass:[SliderMenu class]]) {
        return (SliderMenu *)self.parentViewController;
    }
    return nil;
}

@end
