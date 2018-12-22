//
//  SpecialTextView.m
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018年 zl. All rights reserved.
//

#import "SpecialTextView.h"
//#import "EmojiView.h"
//#import "EmojiToolBar.h"

#define buddleImage(buddle, image) [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@", buddle, image]]

@implementation SpecialTextView

/**
 提示文字 label
 */
- (UILabel *)placeHolederLabel {
    if (!_placeHolederLabel) {
        _placeHolederLabel = [[UILabel alloc]initWithFrame:CGRectMake(4, self.textContainerInset.top, self.bounds.size.width - 4, [_placeHoleder boundingRectWithSize:CGSizeMake((self.bounds.size.width - 4), MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil].size.height)];
        _placeHolederLabel.text = _placeHoleder;
        _placeHolederLabel.font = self.font;
        _placeHolederLabel.textColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.8 alpha:1.0];
        _placeHolederLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_placeHolederLabel];
    }
    return _placeHolederLabel;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
//        self.layer.shouldRasterize = YES;
//        
//        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addObserver];
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
//        weakSelf.inputAccessoryView = bar;
//        bar.reloadKeyBoard = ^(UIButton *sender) {
//            sender.selected = !sender.selected;
//            
//            if (sender.selected) {
//                if (weakSelf.keyboardType == UIKeyboardTypeDefault) {
//                    [sender setImage:[UIImage imageNamed:@"di-biaoqing.png"  inBundle:Bundle compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
//                    EmojiView * emoji = [Bundle loadNibNamed:NSStringFromClass([EmojiView class]) owner:weakSelf options:nil].firstObject;
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
 *  加通知
 */
-(void)addObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayPlaceHolederMethod) name:UITextViewTextDidChangeNotification object:nil];
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object == self) {
        if ([keyPath isEqualToString:@"text"]) {
            [self displayPlaceHolederMethod];
        }
    }
}


/**
 输入提示文字
 */
- (void)setPlaceHoleder:(NSString *)placeHoleder {
    _placeHoleder = placeHoleder;
    [self addSubview:self.placeHolederLabel];
}

- (void)displayPlaceHolederMethod{
    if (self.text.length == 0) {
        self.placeHolederLabel.hidden = NO;
    } else {
            self.placeHolederLabel.hidden = YES;
    }
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

//释放通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"text"];
}

@end
