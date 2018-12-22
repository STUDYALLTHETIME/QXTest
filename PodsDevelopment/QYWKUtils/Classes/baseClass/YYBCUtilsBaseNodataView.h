//
//  Ins_NodataView.h
//  ChildEnd
//
//  Created by 百顺 on 2018/8/25.
//  Copyright © 2018年 readyidu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NodataAction)();

@interface YYBCUtilsBaseNodataView : UIView


+ (instancetype)NodataViewWithIcon:(UIImage *)icon detail:(NSString *)detail bottomCenterView:(UIView *)bottomCenterView;
+ (instancetype)NodataViewWithIcon:(UIImage *)icon detail:(NSString *)detail actionTitle:(NSString *)title action:(NodataAction) noDataAction bottomCenterView:(UIView *)bottomCenterView;

/** icon */
@property (strong, nonatomic) UIImageView *icon;
/** 描述信息 */
@property (strong, nonatomic) UILabel *detail;
/** button */
@property (strong, nonatomic) UIButton *action;

/** block */
@property (copy, nonatomic) NodataAction noDataAction;

@end
