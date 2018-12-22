//
//  YYBCBFSButton.m
//  YYBCBodyFatScale-YYBCBodyFatScale
//
//  Created by 朱武刚 on 2018/12/10.
//

#import "YYBCBFSButton.h"
#import "UIColor+HEX.h"
@implementation YYBCBFSButton

- (instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)radius{
    self = [super initWithFrame:frame];
    if (self) {
        UIBezierPath *bepath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = bepath.CGPath;
        self.layer.mask = shapeLayer;
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setNormalTitle:(NSString *)title withNormalTitleColor:(NSString *)colorString withFont:(CGFloat)font{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHexString:colorString] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:font];
}

- (void)setSelectTitle:(NSString *)title withSelectTitleColor:(NSString *)colorString withFont:(CGFloat)font{
    [self setTitle:title forState:UIControlStateSelected];
    [self setTitleColor:[UIColor colorWithHexString:colorString] forState:UIControlStateSelected];
    self.titleLabel.font = [UIFont systemFontOfSize:font];
}

- (void)setNormalImage:(UIImage *)normalImage withSelectedImage:(UIImage *)selectedImage{
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:selectedImage forState:(UIControlState)UIControlStateSelected];
    
}
- (void)setHorizontalWidth:(CGFloat)width{
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -width, 0, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -width)];
}

- (void)alignmentLeft:(CGFloat)betweenWidth{
    CGFloat imageFrameX = self.imageView.frame.origin.x;
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -imageFrameX, 0, imageFrameX)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageFrameX-betweenWidth), 0, (imageFrameX-betweenWidth))];
    
}
@end
