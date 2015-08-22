//
//  UIBarButtonItem+Create.h
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Create)

+ (instancetype)barButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;


@end
