//
//  Ins_NodataView.m
//  ChildEnd
//
//  Created by 百顺 on 2018/8/25.
//  Copyright © 2018年 readyidu. All rights reserved.
//

#import "YYBCUtilsBaseNodataView.h"
#import "QYWKUtilsConfiger.h"
// 主题蓝色
#define UtilsMAIN_COLOR_NODATA_VIEW [UIColor colorWithHexString:@"1fd1a8"]
#define UtilsFont_color3_NODATA_VIEW    [UIColor colorWithHexString:@"9b9b9b"]

@interface YYBCUtilsBaseNodataView()



@end

@implementation YYBCUtilsBaseNodataView

+ (instancetype)NodataViewWithIcon:(UIImage *)icon detail:(NSString *)detail bottomCenterView:(UIView *)bottomCenterView{
    
    CGFloat Y = (bottomCenterView.frame.size.height - 266)/2.0;
    YYBCUtilsBaseNodataView *view = [[YYBCUtilsBaseNodataView alloc] initWithFrame:CGRectMake(0, Y, [[UIScreen mainScreen] bounds].size.width, 266)];
    view.backgroundColor = [UIColor clearColor];
    view.userInteractionEnabled = NO;
    view.icon.image = icon;
    view.detail.text = detail;
    [view addSubview:view.icon];
    [view addSubview:view.detail];
    return view;
}

+ (instancetype)NodataViewWithIcon:(UIImage *)icon detail:(NSString *)detail actionTitle:(NSString *)title action:(NodataAction)noDataAction bottomCenterView:(UIView *)bottomCenterView{
     CGFloat Y = (bottomCenterView.frame.size.height - 266)/2.0;
    YYBCUtilsBaseNodataView *view = [[YYBCUtilsBaseNodataView alloc] initWithFrame:CGRectMake(0, Y, [[UIScreen mainScreen] bounds].size.width, 250)];
    view.backgroundColor = [UIColor clearColor];
    view.userInteractionEnabled = YES;
    view.icon.image = icon;
    view.detail.text = detail;
    [view.action setTitle:title forState:UIControlStateNormal];
    [view addSubview:view.icon];
    [view addSubview:view.detail];
    [view addSubview:view.action];
    view.noDataAction = noDataAction;
    return view;
}


- (UIButton *)action {
    if (!_action) {
        _action = [[UIButton alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 180)*0.5, 200, 180, 40)];
        _action.layer.borderWidth = 1;
        _action.layer.borderColor = UtilsMAIN_COLOR_NODATA_VIEW.CGColor;
        _action.titleLabel.font = [UIFont systemFontOfSize:16.0];;
        _action.layer.cornerRadius = 5;
        _action.layer.masksToBounds = YES;
        [_action setTitleColor:UtilsMAIN_COLOR_NODATA_VIEW forState:UIControlStateNormal];
        [_action addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _action;
}

- (void)buttonClick {
    if (self.noDataAction) {
        self.noDataAction();
    }
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 158)*0.5, 30, 158, 158)];
        _icon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _icon;
}

- (UILabel *)detail {
    if (!_detail) {
        _detail = [[UILabel alloc] initWithFrame:CGRectMake(15, 196, [[UIScreen mainScreen] bounds].size.width - 30, 40)];
        _detail.numberOfLines = 2;
        _detail.textColor = [UIColor colorWithHexString:@"9b9b9b"];
        _detail.font = [UIFont systemFontOfSize:14.0];
        _detail.textAlignment = NSTextAlignmentCenter;
    }
    return _detail;
}
@end



