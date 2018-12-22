//
//  YYBCBFSLabel.h
//  AFNetworking
//
//  Created by 朱武刚 on 2018/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYBCBFSLabel : UILabel
- (instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)radius;

- (void)setTitle:(NSString *)title withTitleColor:(NSString *)colorString withFont:(CGFloat)font;

@end

NS_ASSUME_NONNULL_END
