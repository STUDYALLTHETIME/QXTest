//
//  BSMvpUtilsBaseNoDataView.h
//  AFNetworking
//
//  Created by yuYue on 2018/11/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSMvpUtilsBaseNoDataView : UIView
+ (void)showEmptyViewWithImageName:(NSString *)imageName withTitle:(NSString *)title AddView:(UIView *)view;
+ (void)showEmptyViewWithImageName:(NSString *)imageName bundle:(NSBundle *)bundle withTitle:(NSString *)title AddView:(UIView *)view;
+ (void)hideEmptyViewWithView:(UIView *)view;

+ (UIView *)getEmptyViewWithImageName:(NSString *)imageName withTitle:(NSString *)title withHeight:(CGFloat)height;
+ (UIView *)getEmptyViewWithImageName:(NSString *)imageName bundle:(NSBundle *)bundle withTitle:(NSString *)title withHeight:(CGFloat)height;
- (instancetype)initWithFrame:(CGRect)frame WithImage:(UIImage *)image withTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
