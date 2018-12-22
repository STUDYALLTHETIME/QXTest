//
//  UIView+Extension.h
//  
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 laiguofeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

- (void)addTapAction:(SEL)tapAction target:(id)target;

- (CGFloat)getWidth;
- (CGFloat)getHeight;
- (CGFloat)getHalfWidth;
- (CGFloat)getHalfHeight;
- (CGFloat)getMinX;
- (CGFloat)getMaxX;
- (CGFloat)getMixY;
- (CGFloat)getMaxY;
- (CGFloat)getCenterX;
- (CGFloat)getCenterY;

/**
 移除所有子视图
 */
- (void)removeAllSubViews;

@end
