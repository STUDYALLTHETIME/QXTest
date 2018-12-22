//
//  TimerProxy.m
//  auction
//
//  Created by yuYue on 2018/7/20.
//  Copyright © 2018年 羽悦本草. All rights reserved.
//

#import "TimerProxy.h"

@interface TimerProxy ()
@property (nonatomic,weak)id target;
@end

@implementation TimerProxy
- (instancetype)initWithTarget:(id)target {
    
    self.target = target;
    
    return self;
}



/*
 这个函数让重载方有机会抛出一个函数的签名，再由后面的forwardInvocation:去执行
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

/*
 将消息转发给其他对象，这里转发给控制器
 */
- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel=[invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

@end





