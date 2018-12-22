//
//  UIImage+Extension.h
//  AFNetworking
//
//  Created by yuYue on 2018/9/27.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 创建模糊图片方法

 @param blur 模糊比例
 @return 返回模糊后的图片
 */
- (UIImage *)createBlurImageWithBlur:(CGFloat )blur;


/**
 根据尺寸颜色创建图片

 @param size 尺寸
 @param color 颜色
 @return 图片
 */
+ (UIImage *)getImageWithSize:(CGSize)size withColor:(UIColor *)color;
@end
