//
//  UIView+QXEXView.m
//  SocketDemo
//
//  Created by 朱武刚 on 2017/6/5.
//  Copyright © 2017年 朱武刚. All rights reserved.
//

#import "UIView+QXEXView.h"

@implementation UIView (QXEXView)

- (CGFloat)getWidth{
    return CGRectGetWidth(self.frame);
}
- (CGFloat)getHeight{
    return CGRectGetHeight(self.frame);
}
- (CGFloat)getHalfWidth{
    return [self getWidth]/2;
}
- (CGFloat)getHalfHeight{
    return [self getHeight]/2;
}
- (CGFloat)getMinX{
    return CGRectGetMinX(self.frame);
}
- (CGFloat)getMaxX{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)getMixY{
    return CGRectGetMinY(self.frame);
}
- (CGFloat)getMaxY{
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)getCenterX{
    return CGRectGetMidX(self.frame);
}
- (CGFloat)getCenterY{
    return CGRectGetMidY(self.frame);
}

@end
