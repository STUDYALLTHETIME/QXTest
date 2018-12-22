//
//  BSUtilsBaseViewController.h
//  BSUtils
//
//  Created by yuYue on 2018/11/28.
//

#import <UIKit/UIKit.h>
#import "BSMvpUtilsBasePresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSMvpUtilsBaseViewController : UIViewController{
     NSUserDefaults *userDefault;
}


/**
 初始化ui
 */
- (void)setUpUI;

/**
 加载状态
 */
- (void)showLoading;
- (void)hideLoading;
- (void)showLoading:(UIView *)view;
- (void)hideLoading:(UIView *)view;

/**
 数据加载完毕再次点击按钮代表网络请求
 */
- (void)showFinishLoading;
- (void)hideFinishLoading;
- (void)showFinishLoading:(UIView *)view;
- (void)hideFinishLoading:(UIView *)view;

/**
 请求数据
 */
- (void)fetchData;

#pragma mark 添加无数据视图方法
- (void)showEmptyWithView:(UIView *)view imgName:(NSString *)imgName title:(NSString *)title;
- (void)showEmptyWithView:(UIView *)view imgName:(NSString *)imgName bundle:(NSBundle *)bundle title:(NSString *)title;

#pragma mark 展示出错空数据的样式
- (void)showNoDataError:(NSError *)error;

#pragma mark 吐司
- (void)showAlertMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
