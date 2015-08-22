//
//  UIImage+Resizable.m
//



#import "UIImage+Category.h"

@implementation UIImage (Category)

+ (instancetype)resizableWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];

}


+ (instancetype)imageWithOriginaName:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
