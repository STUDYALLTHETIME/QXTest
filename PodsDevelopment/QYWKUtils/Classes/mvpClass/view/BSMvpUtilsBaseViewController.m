//
//  BSUtilsBaseViewController.m
//  BSUtils
//
//  Created by yuYue on 2018/11/28.
//

#import "BSMvpUtilsBaseViewController.h"
#import "YYBCUtilsNetwork.h"
#import "BSMvpUtilsBaseNoDataView.h"
#import <MBProgressHUD/MBProgressHUD.h>

//无网络图片名字
#define BSMvpUtilsNoNetWorkImageName @"YYBCNoNetwork"
//系统出错图片名字
#define BSMvpUtilsSystemErrorImgeName @"YYBCSystemError"

@interface BSMvpUtilsBaseViewController ()

@end

@implementation BSMvpUtilsBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userDefault = [NSUserDefaults standardUserDefaults];
    if (@available(iOS 11.0, *)) {
        
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    NSLog(@"%@--------------init",self.class);
}

- (void)dealloc{
    NSLog(@"%@--------------dealloc",self.class);
}

#pragma mark 初始化UI
- (void)setUpUI{
    
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
// 自定义转圈样式，传入view
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

#pragma mark - 数据加载完毕点击按钮代表数据请求的view
- (void)showFinishLoading{
    [YYBCUtilsNetwork showFinishLoading:self.view];
}
- (void)hideFinishLoading{
    [YYBCUtilsNetwork hideFinishLoading:self.view];
}
- (void)showFinishLoading:(UIView *)view{
    [YYBCUtilsNetwork showFinishLoading:view];
}
- (void)hideFinishLoading:(UIView *)view{
    [YYBCUtilsNetwork hideFinishLoading:view];
}

#pragma mark - 吐司
- (void)showAlertMessage:(NSString *)message{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.class toastWithString:message addView:self.view completeWithDuration:2];
    });
}
+ (void)toastWithString:(NSString *)string addView:(UIView *)view completeWithDuration:(NSTimeInterval)duration{
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = string;
    hud.mode = MBProgressHUDModeText;
    [view addSubview:hud];
    [hud showAnimated:YES];
    [view bringSubviewToFront:hud];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, duration*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [hud removeFromSuperview];
    });
}

#pragma mark 添加无数据视图方法
- (void)showEmptyWithView:(UIView *)view imgName:(NSString *)imgName title:(NSString *)title {
    [BSMvpUtilsBaseNoDataView showEmptyViewWithImageName:imgName withTitle:title AddView:view];
}
- (void)showEmptyWithView:(UIView *)view imgName:(NSString *)imgName bundle:(NSBundle *)bundle title:(NSString *)title {
    [BSMvpUtilsBaseNoDataView showEmptyViewWithImageName:imgName bundle:bundle withTitle:title AddView:view];
}

- (void)showNoDataError:(NSError *)error{
    if (error.code == -1001 || error.code == -1009) {
        //没网络
        [self showEmptyWithView:self.view imgName:BSMvpUtilsNoNetWorkImageName title:error.localizedDescription];
    }else{
        [self showEmptyWithView:self.view imgName:BSMvpUtilsSystemErrorImgeName title:error.localizedDescription];
    }
}

#pragma mark - 请求数据
- (void)fetchData{
    
}
@end



















