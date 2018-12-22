//
//  UIViewController+Extension.m
//  auction
//
//  Created by yuYue on 2018/7/31.
//  Copyright © 2018年 羽悦本草. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)


/**
 返回指定的VC实例对象

 @param VC 指定的VC
 @param navi UINavigationController
 */
+ (void)returnCustomInstanceControllerClass:(Class )VC navi:(UINavigationController *)navi{
    NSMutableArray *arrControllers = [NSMutableArray arrayWithArray:navi.viewControllers];
    NSMutableArray *arrControllersUse = [NSMutableArray arrayWithArray:navi.viewControllers];
    for (int i = arrControllers.count-1; i >= 0 ; i--) {
        UIViewController *viewController = arrControllers[i];
        if ([viewController isKindOfClass:VC]) {
            //找到了我的拍品VC
            
            for (int j = i+1; j < arrControllers.count; j++) {
                [arrControllersUse removeLastObject];
            }
            [navi setViewControllers:arrControllersUse];
            break ;
        }
    }
}

+ (void)returnCustomInstanceControllerClass:(Class )VC navi:(UINavigationController *)navi addVC:(UIViewController *)addVC{
    NSMutableArray *arrControllers = [NSMutableArray arrayWithArray:navi.viewControllers];
    NSMutableArray *arrControllersUse = [NSMutableArray arrayWithArray:navi.viewControllers];
    for (int i = arrControllers.count-1; i >= 0 ; i--) {
        UIViewController *viewController = arrControllers[i];
        if ([viewController isKindOfClass:VC]) {
            //找到了我的拍品VC
            
            for (int j = i+1; j < arrControllers.count; j++) {
                [arrControllersUse removeLastObject];
            }
            [arrControllersUse addObject:addVC];
            [navi setViewControllers:arrControllersUse];
            break ;
        }
    }
}
@end









