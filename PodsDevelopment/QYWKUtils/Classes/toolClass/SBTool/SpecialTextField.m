//
//  SpecialTextField.m
//  LuckyUmbrella
//
//  Created by LGF on 2018/6/19.
//  Copyright © 2018年 LGF. All rights reserved.
//

#import "SpecialTextField.h"
//#import "EmojiView.h"
//#import "EmojiToolBar.h"

#define buddleImage(buddle, image) [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@", buddle, image]]

@implementation SpecialTextField

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.layer.shouldRasterize = YES;
        
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
}

/**
 是否使用 emoji 键盘
 */
- (void)setShowEmojiKeyBoard:(BOOL)showEmojiKeyBoard {
//    _showEmojiKeyBoard = showEmojiKeyBoard;
//    if (_showEmojiKeyBoard) {
//        kSelfWeak;
//        UIColor *emojiStyleColor = AllButtonTextColor;
//        
//        EmojiToolBar *bar = [Bundle loadNibNamed:NSStringFromClass([EmojiToolBar class]) owner:weakSelf options:nil].firstObject;
//        bar.backgroundColor = [UIColor colorWithHexString:@"f2f3f4"];
//        [bar.reloadKB setImage:[UIImage imageNamed:@"jianpan.png"  inBundle:Bundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
//        bar.styleColor = emojiStyleColor;
//        self.inputAccessoryView = bar;
//        bar.reloadKeyBoard = ^(UIButton *sender) {
//            sender.selected = !sender.selected;
//            
//            if (sender.selected) {
//                if (weakSelf.keyboardType == UIKeyboardTypeDefault) {
//                    [sender setImage:[UIImage imageNamed:@"di-biaoqing.png"  inBundle:Bundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
//                    EmojiView * emoji = [Bundle loadNibNamed:NSStringFromClass([EmojiView class]) owner:self options:nil].firstObject;
//                    emoji.styleColor = emojiStyleColor;
//                    emoji.textField = weakSelf;
//                    weakSelf.inputView = emoji;
//                    [weakSelf reloadInputViews];
//                }
//            } else {
//                [sender setImage:[UIImage imageNamed:@"jianpan.png"  inBundle:Bundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
//                weakSelf.inputView = nil;
//                [weakSelf reloadInputViews];
//            }
//        };
//        bar.hideKeyBoard = ^(UIButton *sender) {
//            [weakSelf resignFirstResponder];
//        };
//    }
}

/**
 控件圆角
 */
-(void)setCornerRadius:(CGFloat)cornerRadius{
    
    if (cornerRadius == 222.0) {
        
        self.layer.cornerRadius = (self.bounds.size.height * 1) / 2;
        
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
 阴影圆角
 */
-(void)setShadowRadius:(CGFloat)shadowRadius{
    
    if (shadowRadius == 222.0) {
        
        self.layer.shadowRadius = self.bounds.size.height / 2;
        
    } else {
        
        self.layer.shadowRadius = shadowRadius;
        
    }
    
}

/**
 阴影透明度
 */
-(void)setShadowOpacity:(float)shadowOpacity{
    
    self.layer.shadowOpacity = shadowOpacity;
    
}

@end

