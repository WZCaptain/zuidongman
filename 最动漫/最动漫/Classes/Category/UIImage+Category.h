//
//  UIImage+Resizable.h
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 *  图片可变
 *
 *  @param imageName 图片名称
 *
 *  @return instancetype
 */
+ (instancetype)resizableWithImageName:(NSString *)imageName;
/**
 *  加载原始图片.,不渲染
 *
 *  @param imageName 图片名称
 *
 *  @return instancetype
 */
+ (instancetype)imageWithOriginaName:(NSString *)imageName;

@end
