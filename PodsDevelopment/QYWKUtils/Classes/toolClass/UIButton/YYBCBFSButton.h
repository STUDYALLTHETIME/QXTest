//
//  YYBCBFSButton.h
//  YYBCBodyFatScale-YYBCBodyFatScale
//
//  Created by 朱武刚 on 2018/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYBCBFSButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)radius;

- (void)setNormalTitle:(NSString *)title withNormalTitleColor:(NSString *)colorString withFont:(CGFloat)font;

- (void)setSelectTitle:(NSString *)title withSelectTitleColor:(NSString *)colorString withFont:(CGFloat)font;

- (void)setNormalImage:(UIImage *)normalImage withSelectedImage:(UIImage *)selectedImage;

- (void)setHorizontalWidth:(CGFloat)width;

- (void)alignmentLeft:(CGFloat)betweenWidth;
@end

NS_ASSUME_NONNULL_END
