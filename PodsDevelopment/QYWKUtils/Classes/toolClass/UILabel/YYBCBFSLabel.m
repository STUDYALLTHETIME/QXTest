//
//  YYBCBFSLabel.m
//  AFNetworking
//
//  Created by 朱武刚 on 2018/12/10.
//

#import "YYBCBFSLabel.h"
#import "UIColor+HEX.h"
@implementation YYBCBFSLabel

- (instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)radius{
    self = [super initWithFrame:frame];
    if (self) {
        UIBezierPath *bepath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = bepath.CGPath;
        self.layer.mask = shapeLayer;
        self.backgroundColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor blackColor];
        self.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setTitle:(NSString *)title withTitleColor:(NSString *)colorString withFont:(CGFloat)font{
    self.text = title;
    if ([colorString length] > 0) {
        self.textColor = [UIColor colorWithHexString:colorString];
    }
    if (font > 0) {
        self.font = [UIFont systemFontOfSize:font];
    }
}

@end
 
