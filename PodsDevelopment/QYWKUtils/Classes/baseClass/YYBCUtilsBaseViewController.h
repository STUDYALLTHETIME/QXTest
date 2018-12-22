//
//  BaseViewController.h
//
//  Created by 百顺 on 2018/10/11.
//  Copyright © 2018年 百顺. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYBCUtilsBaseNodataView;


@class YYBCUtilsBaseViewController;
 
@protocol BaseViewControllerDelegate <NSObject>

@optional
- (void)baseViewController:(YYBCUtilsBaseViewController *)vc getNewNews:(NSDictionary *)message keyword:(NSString *)keyword;

- (void)refreshListViewControllerWithBaseViewController:(YYBCUtilsBaseViewController *)viewController;

@end

@interface YYBCUtilsBaseViewController : UIViewController <BaseViewControllerDelegate>
/** 无数据视图 */
@property (strong, nonatomic) YYBCUtilsBaseNodataView *YYBCUtilsNodata;

/** 分页数据 */
@property (nonatomic, assign) NSUInteger pageNum;
@property (nonatomic, assign) NSUInteger pageSize;

/** 列表数组 */
@property (strong, nonatomic) NSMutableArray *arrMList;

/** 代理 */
@property (strong, nonatomic) id<BaseViewControllerDelegate> delegate;

/** 加载View背景 */
@property (strong, nonatomic) UIView *loadingBackView;

/** UIColor （一开始进入界面请求数据）*/
@property (strong, nonatomic) UIColor *loadingBackViewColor;

/** UIColor （已经进入界面请求数据）*/
@property (strong, nonatomic) UIColor *loadingBackViewFinishColor;

/** 是否链接到详情页 */
@property (assign, nonatomic) BOOL isConfigDetail;

/** 后台返回的错误占位图（支持自定义） */
@property (strong, nonatomic) UIImage *imgCustomError;

/** 返回上层视图方法 */
- (void)back;

/**
 加载状态
 */
- (void)showLoading;
- (void)hideLoading;

/**
 数据加载完毕再次点击按钮代表网络请求
 */
- (void)showFinishLoading;
- (void)hideFinishLoading;

- (void)showLoading:(UIView *)view;
- (void)hideLoading:(UIView *)view;

/**
 加载失败时显示
 */
- (void)showNetworkWeakView:(NSString *)title isNetWeak:(BOOL)isNetWeak;
- (void)showError:(NSError *)error reload:(void(^)(void))reload;
- (void)hideNetworkWeakView;
- (void)fetchData;
- (void)fetchDataFinishBlk:(void(^)(void))finishBlk;
- (void)setUpUI;


/**
 制作无数据视图
 */
- (YYBCUtilsBaseNodataView *)makeNodataWithView:(UIView *)view imgName:(NSString *)imgName title:(NSString *)title;
/**
 制作默认图片的无数据视图
 */
- (YYBCUtilsBaseNodataView *)makeNodataWithView:(UIView *)view title:(NSString *)title;

/**
  初始化默认导航栏样式
 */
- (void)initDefaultNaviMethod;
/**
 初始化没有返回箭头的导航栏样式
 */
- (void)initNoLeftArrowNaviMethod;
@end
















