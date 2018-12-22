//
//  UIAlertController+Extension.h
//  auction
//
//  Created by 羽悦本草 on 2018/3/24.
//  Copyright © 2018年 羽悦本草. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extension)

/**
 获得单个按钮的alertController

 @param title alertController的标题
 @param message alertController的文字
 @param actionTitle action的title
 @param okBtnClickBlock action点击动作block
 @return alertController实例对象
 */
+ (UIAlertController *)getAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle okBtnClickBlock:(void(^)(void))okBtnClickBlock;


/**
 获得两个按钮的alertController

 @param title alertController的标题
 @param message alertController的文字
 @param actionOkTitle ok按钮标题
 @param actionCancalTitle cancal按钮标题
 @param okBtnClickBlock ok按钮点击block
 @param cancalBtnClickBlock 取消按钮block
 @return alertController实例对象
 */
+ (UIAlertController *)getAlertWithTitle:(NSString *)title message:(NSString *)message actionOkTitle:(NSString *)actionOkTitle actionCancalTitle:(NSString *)actionCancalTitle okBtnClickBlock:(void(^)(void))okBtnClickBlock cancalBtnClickBlock:(void(^)(void))cancalBtnClickBlock;

//订单模块提示框
+ (UIAlertController *)orderGetAlertWithTitle:(NSString *)title message:(NSString *)message actionOkTitle:(NSString *)actionOkTitle actionCancalTitle:(NSString *)actionCancalTitle okBtnClickBlock:(void(^)(void))okBtnClickBlock cancalBtnClickBlock:(void(^)(void))cancalBtnClickBlock;
@end










