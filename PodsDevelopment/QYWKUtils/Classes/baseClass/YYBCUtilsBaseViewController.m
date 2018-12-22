//
//  BaseViewController.m
//
//  Created by 百顺 on 2018/10/11.
//  Copyright © 2018年 百顺. All rights reserved.
//

#import "YYBCUtilsBaseViewController.h"
#import "Masonry.h"
#import "FLAnimatedImage.h"
#import <AVKit/AVKit.h>
#import "YYBCUtilsBaseNodataView.h"
#import "QYWKUtilsConfiger.h"
#import "YYBCUtilsNetwork.h"

@interface YYBCUtilsBaseViewController ()

/** netweakView */
@property (strong, nonatomic) UIView *netweakView;

@property (strong, nonatomic) UIView *netweakBackView;
/** 设置网络 */
@property (strong, nonatomic) UIButton *netSetAction;

/** 重新加载 */
@property (strong, nonatomic) UIButton *reloadAction;

/** 无网络图片 */
@property (strong, nonatomic) UIImageView *netweakImage;

/** 显示的内容 */
@property (strong, nonatomic) UILabel *netweakLabel;

/** 加载View */
@property (strong, nonatomic) UIView *loadingView;

/** 加载中的图片 */
@property (strong, nonatomic) UIImageView *loadingImage;

/** 加载中的文字 */
@property (strong, nonatomic) UILabel *loadingText;

/** 重新加载 */
@property (copy, nonatomic) void(^reload)(void);

@end

@implementation YYBCUtilsBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化分页默认数据
    self.pageNum = 1;
    self.pageSize = 10;
    
    //初始化默认分页列表数组
    self.arrMList = [NSMutableArray array];
    
//    //tableView向下偏移问题
//    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
        
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    NSLog(@"%@--------------init",self.class);
}

//- (void)initDefaultNaviMethod{
//
//    //自定义导航栏背景色
//    //修改状态栏的文字颜色(需要info.plist配置View controller-based status bar appearance为NO)
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
//    //[self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//
//    //自定义返回按钮图片+文字（注意这时候系统的侧滑功能失效，需要在自定义的naviController里添加代码判断控制）
//    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnLeft.frame = CGRectMake(0, 0, 100.0, 44.0);
//    [btnLeft setTitle:@"" forState:UIControlStateNormal];
//    [btnLeft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btnLeft.titleLabel.font = [UIFont systemFontOfSize:16.0];
//    [btnLeft setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    [btnLeft setTitleEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
//    [btnLeft setContentEdgeInsets:UIEdgeInsetsMake(0,0, 0, 0)];
//    [btnLeft setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 0)];
//    UIImage *img = [[UIImage imageNamed:@"back_icon"  inBundle:YYBCUtilsBundle compatibleWithTraitCollection:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnLeft setImage:img forState:UIControlStateNormal];
//    [btnLeft addTapAction:@selector(back) target:self];
//
//    UIBarButtonItem *naviItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    naviItem.width = -8;
//
//    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:btnLeft]];
//
//    //自定义标题颜色
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0],NSForegroundColorAttributeName:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
//
//    //背景色的设置
//    self.view.backgroundColor = [UIColor grayColor];
//    if (!self.loadingBackViewColor) {
//        self.loadingBackViewColor = [UIColor whiteColor];
//    }
//
//    if (!self.loadingBackViewFinishColor) {
//        self.loadingBackViewFinishColor = [UIColor clearColor];
//    }
//}

//- (void)initNoLeftArrowNaviMethod{
//    //自定义返回按钮图片+文字（注意这时候系统的侧滑功能失效，需要在自定义的naviController里添加代码判断控制）
//    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnLeft.frame = CGRectMake(0, 0, 100.0, 44.0);
//    [btnLeft setTitle:@"" forState:UIControlStateNormal];
//    [btnLeft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btnLeft.titleLabel.font = [UIFont systemFontOfSize:16.0];
//    [btnLeft setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    [btnLeft setTitleEdgeInsets:UIEdgeInsetsMake(0, 9, 0, 0)];
//    [btnLeft setImage:nil forState:UIControlStateNormal];
//    [btnLeft addTapAction:@selector(back) target:self];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
//
//}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 加载中(刚进入界面)
// 自定义转圈样式
- (void)showLoading {
    dispatch_async(dispatch_get_main_queue(), ^{
        [YYBCUtilsNetwork showLoading:self.view];
    });
}

- (void)hideLoading {
    dispatch_async(dispatch_get_main_queue(), ^{
        [YYBCUtilsNetwork hideLoading:self.view];
    });
}

// 自定义转圈样式
- (void)showLoading:(UIView *)view {
    dispatch_async(dispatch_get_main_queue(), ^{
        [YYBCUtilsNetwork showLoading:view];
    });
}

- (void)hideLoading:(UIView *)view {
    dispatch_async(dispatch_get_main_queue(), ^{
        [YYBCUtilsNetwork hideLoading:view];
    });
}


//// 自定义带动画的样式
//- (UIView *)loadingBackView {
//    if (!_loadingBackView) {
//        _loadingBackView = [[UIView alloc] init];
//        _loadingBackView.backgroundColor = self.loadingBackViewColor;
//        [_loadingBackView addSubview:self.loadingView];
//    }
//    return _loadingBackView;
//}
//
//- (UIView *)loadingView {
//    if (!_loadingView) {
//        CGFloat height = MAX(YYBCUtilsKSCREENHEIGHT, YYBCUtilsKSCREENWIDTH);
//        //        if ([self isKindOfClass:NSClassFromString(@"YDVideoContentViewController")]) {
//        //            height = height - (MIN(KSCREENHEIGHT, KSCREENWIDTH)*9/16 - 80);
//        //        }
//        _loadingView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) * 0.5, (height - 120) * 0.5 - 80, 100, 120)];
//        [_loadingView addSubview:self.loadingImage];
//        [_loadingView addSubview:self.loadingText];
//    }
//    return _loadingView;
//}
//
//- (UIImageView *)loadingImage {
//    if (!_loadingImage) {
//        _loadingImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        FLAnimatedImageView *imageViewImg = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(15, 15, 70, 70)];
//        [_loadingImage addSubview:imageViewImg];
//
//        NSData *gif = [NSData dataWithContentsOfFile:[YYBCUtilsBundle pathForResource:@"loading" ofType:@"gif"]];
//        FLAnimatedImage *animatedImg = [FLAnimatedImage animatedImageWithGIFData:gif];
//        imageViewImg.animatedImage = animatedImg;
//    }
//    return _loadingImage;
//}
//
//- (UILabel *)loadingText {
//    if (!_loadingText) {
//        _loadingText = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 100, 20)];
//        _loadingText.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
//        _loadingText.font = [UIFont systemFontOfSize:14.0];
//        //_loadingText.text = @"正在加载中...";
//        _loadingText.text = @"";
//        _loadingText.textAlignment = NSTextAlignmentCenter;
//    }
//    return _loadingText;
//}

#pragma mark - 网络加载失败
- (void)showError:(NSError *)error reload:(void (^)())reload {
    //设置默认的无网络占位图
    self.netweakImage.image = [UIImage imageNamed:@"image_yichang" inBundle:YYBCUtilsBundle compatibleWithTraitCollection:nil];
    
    if (error.code == -1001) {
        // 请求超时
        [self showNetworkWeakView:nil isNetWeak:YES];
    } else {
        //判断是-1009断网.500后台错误,还是其他后台给出的自定义错误码（网弱-1001，断网-1009归为一类显示。系统错误500和后台自定义的错误归为一类显示）
        
        if (error.code != -1009) {
            //后台自定义的错误码
            if (!self.imgCustomError) {
                self.imgCustomError = [UIImage imageNamed:@"collection_box" inBundle:YYBCUtilsBundle compatibleWithTraitCollection:nil];
            }
            self.netweakImage.image = self.imgCustomError;
        }
        [self showNetworkWeakView:error.localizedDescription isNetWeak:NO];
    }
    self.reload = reload;
}

- (void)clickAction:(UIButton *)action {
    [self hideNetworkWeakView];
    if (action == self.netSetAction) {
        // 去设置网络
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    } else if (action == self.reloadAction) {
        // 重新加载
        if (self.reload) {
            self.reload();
            return;
        }
        [self showLoading];
        [self fetchData];
    }
}


- (void)showNetworkWeakView:(NSString *)title isNetWeak:(BOOL)isNetWeak {
//    if (!isNetWeak) {
        self.netSetAction.hidden = YES;
        self.netweakLabel.text = title ?: @"请求出了点问题哦, 请稍后重试";
        self.reloadAction.frame = CGRectMake(0, 190,  (YYBCUtilsKSCREENWIDTH - 60), 45);
//    } else {
//        self.netSetAction.hidden = NO;
//        self.netweakLabel.text = @"网络异常，请检查您的网络状态";
//        self.reloadAction.frame = CGRectMake(CGRectGetMaxX(self.netSetAction.frame) + 15, 190,  (KSCREENWIDTH - 70) * 0.5, 45);
//    }
    [self.view addSubview:self.netweakBackView];
    [self.netweakBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
}

- (void)hideNetworkWeakView {
    [self.netweakBackView removeFromSuperview];
    [self.netweakBackView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.netweakBackView = nil;
}

// 加载错误中的文件
- (UIView *)netweakBackView {
    if (!_netweakBackView) {
        _netweakBackView = [[UIView alloc] init];
        _netweakBackView.backgroundColor = [UIColor whiteColor];
        [_netweakBackView addSubview:self.netweakView];
    }
    return _netweakBackView;
}

- (UIView *)netweakView {
    if (_netweakView == nil) {
        CGFloat height = MAX(YYBCUtilsKSCREENHEIGHT, YYBCUtilsKSCREENWIDTH);
        if ([self isKindOfClass:NSClassFromString(@"YDVideoContentViewController")]) {
            height = height - (MIN(YYBCUtilsKSCREENHEIGHT, YYBCUtilsKSCREENWIDTH)*9/16 - 80);
        }
        _netweakView = [[UIView alloc] initWithFrame:CGRectMake(30, (height - 250) * 0.5 - 64, YYBCUtilsKSCREENWIDTH - 30, 250)];
        _netweakView.backgroundColor = [UIColor clearColor];
        [_netweakView addSubview:self.netweakImage];
        [_netweakView addSubview:self.netweakLabel];
        [_netweakView addSubview:self.netSetAction];
        [_netweakView addSubview:self.reloadAction];
    }
    return _netweakView;
}

- (UIButton *)netSetAction {
    if (_netSetAction == nil) {
        _netSetAction = [[UIButton alloc] initWithFrame:CGRectMake(0, 190, (YYBCUtilsKSCREENWIDTH - 70) * 0.5, 45)];
        _netSetAction.backgroundColor = [UIColor blueColor];
        [_netSetAction setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _netSetAction.titleLabel.font = [UIFont systemFontOfSize:17];
        _netSetAction.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_netSetAction setTitle:@"设置网络" forState:UIControlStateNormal];
        [_netSetAction addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        _netSetAction.layer.cornerRadius = 5.0;
        _netSetAction.layer.masksToBounds = YES;
    }
    return _netSetAction;
}

- (UIButton *)reloadAction {
    if (_reloadAction == nil) {
        _reloadAction = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.netSetAction.frame) + 15, 190,  (YYBCUtilsKSCREENWIDTH - 70) * 0.5, 45)];
        _reloadAction.backgroundColor = [UIColor redColor];
        [_reloadAction setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _reloadAction.titleLabel.font = [UIFont systemFontOfSize:17];
        _reloadAction.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_reloadAction setTitle:@"重新加载" forState:UIControlStateNormal];
        _reloadAction.layer.cornerRadius = 5.0;
        _reloadAction.layer.masksToBounds = YES;
        [_reloadAction addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reloadAction;

}

- (UIImageView *)netweakImage {
    if (!_netweakImage) {
        _netweakImage = [[UIImageView alloc] initWithFrame:CGRectMake((YYBCUtilsKSCREENWIDTH-100) * 0.5 - 25, 0, 100, 105)];
        _netweakImage.contentMode = UIViewContentModeScaleAspectFit;
        
        _netweakImage.image = [UIImage imageNamed:@"image_yichang" inBundle:YYBCUtilsBundle compatibleWithTraitCollection:nil];
    }
    return _netweakImage;
}

- (UILabel *)netweakLabel {
    if (!_netweakLabel) {
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 120,  YYBCUtilsKSCREENWIDTH - 60, 20)];
        text.text = @"网络异常，请检查您的网络状态";
        text.textAlignment = NSTextAlignmentCenter;
        text.font = [UIFont systemFontOfSize:14.0];
        text.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
        _netweakLabel = text;
    }
    return _netweakLabel;
}


#pragma mark - 数据加载完毕点击按钮代表数据请求的view
- (void)showFinishLoading{
    [YYBCUtilsNetwork showFinishLoading:self.view];
}

- (void)hideFinishLoading{
    [YYBCUtilsNetwork hideFinishLoading:self.view];
}

#pragma mark - 制作无数据视图
- (YYBCUtilsBaseNodataView *)makeNodataWithView:(UIView *)view imgName:(NSString *)imgName title:(NSString *)title{
    if (_YYBCUtilsNodata == nil) {
        [view.superview layoutIfNeeded];
        [view layoutIfNeeded];
        _YYBCUtilsNodata = [YYBCUtilsBaseNodataView NodataViewWithIcon:[UIImage imageNamed:imgName inBundle:YYBCUtilsBundle compatibleWithTraitCollection:nil] detail:title bottomCenterView:view];
        _YYBCUtilsNodata.hidden = YES;
    }
    return _YYBCUtilsNodata;
}

#pragma mark - 制作默认图片的无数据视图
- (YYBCUtilsBaseNodataView *)makeNodataWithView:(UIView *)view title:(NSString *)title{
   return [self makeNodataWithView:view imgName:@"default_nodata" title:title];
}


- (void)dealloc {
    NSLog(@"%@---------------dealloc",self.class);
}

@end
















