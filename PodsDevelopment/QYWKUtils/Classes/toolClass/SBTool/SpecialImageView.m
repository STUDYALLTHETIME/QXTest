//
//  SpecialImageView.m
//
//  Created by apple on 2018/12/28.
//  Copyright © 2018年 zl. All rights reserved.
//

#import "SpecialImageView.h"

@implementation SpecialImageView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
//        self.layer.shouldRasterize = YES;
//        
//        self.layer.rasterizationScale=[UIScreen mainScreen].scale;
        
        
        
    }
    
    return self;
    
}

- (void)setUIViewContentMode:(NSString *)UIViewContentMode {
    _UIViewContentMode = UIViewContentMode;
    if ([UIViewContentMode isEqualToString:@"UIViewContentModeScaleAspectFill"]) {
        self.contentMode = UIViewContentModeScaleAspectFill;
    } else if ([UIViewContentMode isEqualToString:@"UIViewContentModeScaleAspectFit"]) {
        self.contentMode = UIViewContentModeScaleAspectFit;
    } else {
        self.contentMode = UIViewContentModeScaleToFill;
    }
}

/**
 控件圆角
 */
-(void)setCornerRadius:(CGFloat)cornerRadius{
    
    if (cornerRadius == 222.0) {
        
        self.layer.cornerRadius = (self.bounds.size.height * 1.0) / 2;
        
    } else {
        
        self.layer.cornerRadius = cornerRadius;
        
    }
    
}

/**
 边框颜色
 */
-(void)setBorderColor:(UIColor *)borderColor{
    
    self.layer.borderColor = borderColor.CGColor;
    
}

/**
 边框宽度
 */
-(void)setBorderWidth:(CGFloat)borderWidth{
    
    self.layer.borderWidth = borderWidth;
    
}

/**
 阴影颜色
 */
-(void)setShadowColor:(UIColor *)shadowColor{
    
    self.layer.shadowColor = shadowColor.CGColor;
    
}

/**
 阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
 */
-(void)setShadowOffset:(CGSize)shadowOffset{
    
    self.layer.shadowOffset = shadowOffset;
    
}

/**
 阴影透明度
 */
-(void)setShadowOpacity:(float)shadowOpacity{
    
    self.layer.shadowOpacity = shadowOpacity;
    
}

@end
