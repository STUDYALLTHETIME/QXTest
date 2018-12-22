//
//  ModalTransitioningImpl.m
//  Demo
//
//  Created by YZY on 2018/7/26.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "ModalTransitioningImpl.h"
#import "PopTransitionAnimation.h"
#import "PushTransitionAnimation.h"

@implementation ModalTransitioningImpl

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[PopTransitionAnimation alloc] init];
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[PushTransitionAnimation alloc] init];
}

@end
