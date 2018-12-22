//
//  UIViewController+Extension.h
//  auction
//
//  Created by yuYue on 2018/7/31.
//  Copyright © 2018年 羽悦本草. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)
/**
 返回指定的VC实例对象
 
 @param VC 指定的VC
 @param navi UINavigationController
 */
+ (void)returnCustomInstanceControllerClass:(Class)VC navi:(UINavigationController *)navi;


/**
 返回指定VC实例对象

 @param VC 指定的vc
 @param navi navi
 @param addVC 要添加的VC
 */
+ (void)returnCustomInstanceControllerClass:(Class )VC navi:(UINavigationController *)navi addVC:(UIViewController *)addVC;
@end
