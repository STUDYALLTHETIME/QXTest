//
//  BSMvpUtilsBaseNoDataView.m
//  AFNetworking
//
//  Created by yuYue on 2018/11/28.
//

#import "BSMvpUtilsBaseNoDataView.h"
#import "UIView+Extension.h"
#import "BSUtilsConfiger.h"

@interface BSMvpUtilsBaseNoDataView ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation BSMvpUtilsBaseNoDataView


- (instancetype)initWithFrame:(CGRect)frame WithImage:(UIImage *)image withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUIWithImage:image withTitle:title];
    }
    return self;
}

- (void)initUIWithImage:(UIImage *)image withTitle:(NSString *)title{
    
    _iconImageView = [[UIImageView alloc] initWithImage:image];
    _iconImageView.center = CGPointMake([self getHalfWidth], image.size.height/2);
    [self addSubview:_iconImageView];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor colorWithWhite:0.400 alpha:1.000];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake([self getHalfWidth], [_iconImageView getMaxY]+5+[_titleLabel getHalfHeight]);
    [self addSubview:_titleLabel];
    
}


+ (void)showEmptyViewWithImageName:(NSString *)imageName withTitle:(NSString *)title AddView:(UIView *)view{
    UIImage *image = [UIImage imageNamed:imageName];

    CGSize infoSize = [title boundingRectWithSize:CGSizeMake([view getWidth], 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.f]} context:nil].size;
    
    BSMvpUtilsBaseNoDataView *empty = [[BSMvpUtilsBaseNoDataView alloc] initWithFrame:CGRectMake(0, 0, infoSize.width>image.size.width?:image.size.width, image.size.height+infoSize.height+15) WithImage:image withTitle:title];
    empty.center = CGPointMake([view getHalfWidth], [view getHalfHeight]);
    [view addSubview:empty];
    [view bringSubviewToFront:empty];
}


+ (void)showEmptyViewWithImageName:(NSString *)imageName bundle:(NSBundle *)bundle withTitle:(NSString *)title AddView:(UIView *)view{
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    
    CGSize infoSize = [title boundingRectWithSize:CGSizeMake([view getWidth], 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.f]} context:nil].size;
    
    BSMvpUtilsBaseNoDataView *empty = [[BSMvpUtilsBaseNoDataView alloc] initWithFrame:CGRectMake(0, 0, infoSize.width>image.size.width?:image.size.width, image.size.height+infoSize.height+15) WithImage:image withTitle:title];
    empty.center = CGPointMake([view getHalfWidth], [view getHalfHeight]);
    [view addSubview:empty];
    [view bringSubviewToFront:empty];
}


+ (void)hideEmptyViewWithView:(UIView *)view{
    BSMvpUtilsBaseNoDataView *empty = [self emptyForView:view];
    if (empty != nil ) {
        [empty removeFromSuperview];
        empty = nil;
    }
}
+ (UIView *)getEmptyViewWithImageName:(NSString *)imageName withTitle:(NSString *)title withHeight:(CGFloat)height{
    UIImage *image = [UIImage imageNamed:imageName];

    CGSize infoSize = [title boundingRectWithSize:CGSizeMake(KSCREENWIDTH, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.f]} context:nil].size;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH/2, height)];
    BSMvpUtilsBaseNoDataView *empty = [[BSMvpUtilsBaseNoDataView alloc] initWithFrame:CGRectMake(0, 0, infoSize.width>image.size.width?:image.size.width, image.size.height+infoSize.height) WithImage:image withTitle:title];
    empty.iconImageView.center = CGPointMake([empty getHalfWidth], [empty.iconImageView getHalfHeight]);
    empty.titleLabel.center = CGPointMake([empty getHalfWidth], [empty.iconImageView getMaxY]+5+[empty.titleLabel getHalfHeight]);
    empty.center = CGPointMake(KSCREENWIDTH/2, [view getHalfHeight]);
    [view addSubview:empty];
    return view;
}
+ (UIView *)getEmptyViewWithImageName:(NSString *)imageName bundle:(NSBundle *)bundle withTitle:(NSString *)title withHeight:(CGFloat)height{
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    
    CGSize infoSize = [title boundingRectWithSize:CGSizeMake(KSCREENWIDTH, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.f]} context:nil].size;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH/2, height)];
    BSMvpUtilsBaseNoDataView *empty = [[BSMvpUtilsBaseNoDataView alloc] initWithFrame:CGRectMake(0, 0, infoSize.width>image.size.width?:image.size.width, image.size.height+infoSize.height) WithImage:image withTitle:title];
    empty.iconImageView.center = CGPointMake([empty getHalfWidth], [empty.iconImageView getHalfHeight]);
    empty.titleLabel.center = CGPointMake([empty getHalfWidth], [empty.iconImageView getMaxY]+5+[empty.titleLabel getHalfHeight]);
    empty.center = CGPointMake(KSCREENWIDTH/2, [view getHalfHeight]);
    [view addSubview:empty];
    return view;
}

+ (BSMvpUtilsBaseNoDataView *)emptyForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (BSMvpUtilsBaseNoDataView *)subview;
        }
    }
    return nil;
}

@end
