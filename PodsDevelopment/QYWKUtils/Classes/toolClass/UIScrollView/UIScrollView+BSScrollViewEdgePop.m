//
//  UIScrollView+BSScrollViewEdgePop.m
//  AFNetworking
//
//  Created by yuYue on 2018/11/15.
//

#import "UIScrollView+BSScrollViewEdgePop.h"
#import <objc/runtime.h>
#define IPHONE_H [UIScreen mainScreen].bounds.size.height //屏幕的高度
#define IPHONE_W [UIScreen mainScreen].bounds.size.width // 屏幕的宽度
static UIPanGestureRecognizer *pan;

@implementation UIScrollView (BSScrollViewEdgePop)

- (void)setPanGr:(UIPanGestureRecognizer *)panGr{
    objc_setAssociatedObject(self, &pan, panGr,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPanGestureRecognizer *)panGr{
    return objc_getAssociatedObject(self, &pan);
}

//是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥.
//是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播
//一句话总结就是此方法返回YES时，手势事件会一直往下传递，不论当前层次是否对该事件进行响应。
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//
//    if ([self panBack:gestureRecognizer]) {
//        return YES;
//    }
//    return NO;
//}

- (void)setEdgePop{
    UIViewController *vc = [self viewController];
    // 设置代理
    id target = vc.navigationController.interactivePopGestureRecognizer.delegate;
    // 创建手势
    self.panGr = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    // 添加手势
    [[UIApplication sharedApplication].keyWindow addGestureRecognizer:self.panGr];
}

//location_X可自己定义,其代表的是滑动返回距左边的有效长度
- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
    
    //是滑动返回距左边的有效长度
    int location_X =0.15*IPHONE_W;
    
    if (gestureRecognizer ==self.panGestureRecognizer) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state ||UIGestureRecognizerStatePossible == state) {
            CGPoint location = [gestureRecognizer locationInView:self];
            
            //这是允许每张图片都可实现滑动返回
            int temp1 = location.x;
            int temp2 =IPHONE_W;
            NSInteger XX = temp1 % temp2;
            if (point.x >0 && XX < location_X) {
                return YES;
            }
        }
    }
    return NO;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([self panBack:gestureRecognizer]) {
        return NO;
    }
    return YES;
}

- (void)dealloc{
    [[UIApplication sharedApplication].keyWindow removeGestureRecognizer:self.panGr];
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
