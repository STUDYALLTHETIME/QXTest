//
//  UIAlertController+Extension.m
//  auction
//
//  Created by 羽悦本草 on 2018/3/24.
//  Copyright © 2018年 羽悦本草. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)
+ (UIAlertController *)getAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle okBtnClickBlock:(void(^)(void))okBtnClickBlock{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (okBtnClickBlock) {
            okBtnClickBlock();
        }
    }];
    [alertController addAction:actionOK];
    
    //title
    NSMutableAttributedString *alertControllerStrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    [alertControllerStrTitle addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    [alertControllerStrTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    [alertController setValue:alertControllerStrTitle forKey:@"attributedTitle"];
    
    //message
    message = [NSString stringWithFormat:@" \n%@",message];
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.88] range:NSMakeRange(0, message.length)];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, message.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 7; // 调整行间距
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(1, alertControllerMessageStr.string.length-1)];

//
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:1] range:NSMakeRange(0,1)];
    NSMutableParagraphStyle *paragraphStyle0 = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle0.lineSpacing = 0; // 调整行间距
    paragraphStyle0.alignment = NSTextAlignmentCenter;
    [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle0 range:NSMakeRange(0, 1)];
    [alertController setValue:alertControllerMessageStr forKey:@"attributedMessage"];
    
    //actionTitle
    [actionOK setValue:[UIColor colorWithRed:180/255.0 green:24/255.0 blue:0 alpha:1.0] forKey:@"titleTextColor"];
    
    return alertController;
}

+ (UIAlertController *)getAlertWithTitle:(NSString *)title message:(NSString *)message actionOkTitle:(NSString *)actionOkTitle actionCancalTitle:(NSString *)actionCancalTitle okBtnClickBlock:(void(^)(void))okBtnClickBlock cancalBtnClickBlock:(void(^)(void))cancalBtnClickBlock{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionCancal = [UIAlertAction actionWithTitle:actionCancalTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancalBtnClickBlock) {
            cancalBtnClickBlock();
        }
    }];
    [alertController addAction:actionCancal];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:actionOkTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (okBtnClickBlock) {
            okBtnClickBlock();
        }
    }];
    [alertController addAction:actionOK];
    
    //title
    NSMutableAttributedString *alertControllerStrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    [alertControllerStrTitle addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    [alertControllerStrTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    [alertController setValue:alertControllerStrTitle forKey:@"attributedTitle"];
    
    //message
    message = [NSString stringWithFormat:@" \n%@",message];
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.88] range:NSMakeRange(0, message.length)];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, message.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 7; // 调整行间距
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(1, alertControllerMessageStr.string.length-1)];
    
    //
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:1] range:NSMakeRange(0,1)];
    NSMutableParagraphStyle *paragraphStyle0 = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle0.lineSpacing = 0; // 调整行间距
    paragraphStyle0.alignment = NSTextAlignmentCenter;
    [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle0 range:NSMakeRange(0, 1)];
    [alertController setValue:alertControllerMessageStr forKey:@"attributedMessage"];
    
    //actionTitle
    [actionOK setValue:[UIColor colorWithRed:180/255.0 green:24/255.0 blue:0 alpha:1.0] forKey:@"titleTextColor"];
    //actionCancalTitle
    [actionCancal setValue:[UIColor grayColor] forKey:@"titleTextColor"];
    
    return alertController;
}

//订单模块提示框
+ (UIAlertController *)orderGetAlertWithTitle:(NSString *)title message:(NSString *)message actionOkTitle:(NSString *)actionOkTitle actionCancalTitle:(NSString *)actionCancalTitle okBtnClickBlock:(void(^)(void))okBtnClickBlock cancalBtnClickBlock:(void(^)(void))cancalBtnClickBlock{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:actionOkTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (okBtnClickBlock) {
            okBtnClickBlock();
        }
    }];
    [alertController addAction:actionOK];
    
    UIAlertAction *actionCancal = [UIAlertAction actionWithTitle:actionCancalTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (cancalBtnClickBlock) {
            cancalBtnClickBlock();
        }
    }];
    [alertController addAction:actionCancal];
    

    
    //title
    NSMutableAttributedString *alertControllerStrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    [alertControllerStrTitle addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    [alertControllerStrTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    [alertController setValue:alertControllerStrTitle forKey:@"attributedTitle"];
    
    //message
    message = [NSString stringWithFormat:@" \n%@",message];
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.88] range:NSMakeRange(0, message.length)];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, message.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 7; // 调整行间距
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(1, alertControllerMessageStr.string.length-1)];
    
    //
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:1] range:NSMakeRange(0,1)];
    NSMutableParagraphStyle *paragraphStyle0 = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle0.lineSpacing = 0; // 调整行间距
    paragraphStyle0.alignment = NSTextAlignmentCenter;
    [alertControllerMessageStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle0 range:NSMakeRange(0, 1)];
    [alertController setValue:alertControllerMessageStr forKey:@"attributedMessage"];
    
    //actionTitle
    [actionOK setValue:[UIColor colorWithRed:180/255.0 green:24/255.0 blue:0 alpha:1.0] forKey:@"titleTextColor"];
    //actionCancalTitle
    [actionCancal setValue:[UIColor grayColor] forKey:@"titleTextColor"];
    
    return alertController;
}
@end












