//
//  BSPushListViewTopPrivate.m
//  AFNetworking
//
//  Created by yuYue on 2018/11/13.
//

#import "BSPushListViewTopPrivate.h"
#import "Masonry.h"


@interface BSPushListViewTopPrivate ()

@property (strong, nonatomic) BSPushListViewStyle *style;

/*
 *  返回按钮
 */
@property (strong, nonatomic) UIButton *btnTopLeft;

/*
 *  顶部结束的imageView
 */
@property (strong, nonatomic) UIImageView *imageViewTopEnd;
/*
 *  标题
 */
@property (strong, nonatomic) UILabel *labTitle;



/*
 *  顶部开始的imageView
 */
@property (strong, nonatomic) UIImageView *imageViewTopStart;

/*
 *  接收的style
 */
@property (strong, nonatomic) BSPushListViewStyle *pushListViewStyleSave;

/*
 *  segment
 */
@property (strong, nonatomic) UIView *viewSegment;

@end

@implementation BSPushListViewTopPrivate

- (instancetype)initWithFrame:(CGRect)frame style:(BSPushListViewStyle *)style{
    self = [super initWithFrame:frame];
    if (self) {
        self.style = style;
        
        CGFloat heightTemp = 0.0;
        if (self.style.viewSegment) {
            heightTemp = self.style.viewSegment.frame.size.height;
        }
        
        /** topViewEnd */
        //背景图
        self.topViewEnd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50+BSPLVNAVTOP+heightTemp)];
        self.imageViewTopEnd = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.topViewEnd.frame.size.width, self.topViewEnd.frame.size.height-heightTemp)];
        self.imageViewTopEnd.image = self.style.imageTopEnd;
        [self.topViewEnd addSubview:self.imageViewTopEnd];
        [self addSubview:self.topViewEnd];
        
        //返回按钮
        self.btnTopLeft = [[UIButton alloc] initWithFrame:CGRectMake(0,  BSPLVNAVTOP, 30+self.style.imageBack.size.width, 50.0)];
        [self.btnTopLeft setImage:self.style.imageBack forState:UIControlStateNormal];
        [self.topViewEnd addSubview:self.btnTopLeft];
        [self.btnTopLeft addTarget:self action:@selector(btnBackClick) forControlEvents:UIControlEventTouchUpInside];
        
        //标题
        self.labTitle = [[UILabel alloc] init];
        [self.topViewEnd addSubview:self.labTitle];
        [self.labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.topViewEnd);
            make.centerY.equalTo(self.btnTopLeft);
            make.width.mas_lessThanOrEqualTo(200.0);
        }];
        self.labTitle.textColor = [UIColor whiteColor];
        self.labTitle.font = [UIFont systemFontOfSize:18.0];
        self.labTitle.text = self.style.strTitle;
        
        //segment
        if (style.viewSegment) {
            //需要segment
            UIView *viewSegmentCopy = style.viewSegmentCopy;
            [self.topViewEnd addSubview:viewSegmentCopy];
            [viewSegmentCopy mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imageViewTopEnd.mas_bottom);
                make.left.right.equalTo(self);
                make.bottom.equalTo(self.topViewEnd);
            }];
        }
        
        /** topViewStart */
        //背景图
        self.topViewStart = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 90+BSPLVNAVTOP+heightTemp)];
        [self addSubview:self.topViewStart];
        
        self.imageViewTopStart = [[UIImageView alloc] init];
        self.imageViewTopStart.image = self.style.imageTopStart;
        [self.topViewStart addSubview:self.imageViewTopStart];
        [self.imageViewTopStart mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.equalTo(self.topViewStart.mas_bottom).offset(-self.style.viewSegment.bounds.size.height);
        }];
        
        CGFloat widthTempImg = self.style.imageTopStart.size.width;
        CGFloat heightTempImg = self.style.imageTopStart.size.height;
        UIImage *imageTemp = [self.style.imageTopStart resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0,heightTempImg-1 , widthTempImg-1) resizingMode:UIImageResizingModeStretch];

        self.imageViewTopStart.image = imageTemp;
        
        
        //返回按钮
        self.btnTopLeftStart = [[UIButton alloc] initWithFrame:CGRectMake(0,  BSPLVNAVTOP, 30+self.style.imageBack.size.width, 50.0)];
        [self.btnTopLeftStart setImage:self.style.imageBack forState:UIControlStateNormal];
        [self.topViewStart addSubview:self.btnTopLeftStart];
        [self.btnTopLeftStart addTarget:self action:@selector(btnBackClick) forControlEvents:UIControlEventTouchUpInside];
        
        //标题
        self.labTitleStart = [[UILabel alloc] init];
        [self.topViewStart addSubview:self.labTitleStart];
        [self.labTitleStart mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.topViewStart);
            make.centerY.equalTo(self.btnTopLeftStart);
            make.width.mas_lessThanOrEqualTo(200.0);
        }];
        self.labTitleStart.textColor = [UIColor whiteColor];
        self.labTitleStart.font = [UIFont systemFontOfSize:18.0];
        self.labTitleStart.text = self.style.strTitle;
        
        //时间
        UILabel *labTime = [[UILabel alloc] init];
        [self.topViewStart addSubview:labTime];
        [labTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.labTitleStart.mas_bottom).offset(10.0);
            make.centerX.equalTo(self.labTitleStart);
        }];
        labTime.textColor = [UIColor whiteColor];
        labTime.font = [UIFont systemFontOfSize:11];
        labTime.text = self.style.strTime;
        
        if (style.viewSegment) {
            //需要segment
            self.viewSegment = style.viewSegment;
            [self.topViewStart addSubview:self.viewSegment];
            [self.viewSegment mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imageViewTopStart.mas_bottom);
                make.left.right.equalTo(self);
                make.bottom.mas_equalTo(0);
            }];
        }
    }
    return self;
}

- (void)btnBackClick{
    if ([self.delegate respondsToSelector:@selector(BSPushListViewTopPrivateDelegateForBack:)]) {
        [self.delegate BSPushListViewTopPrivateDelegateForBack:self];
    }
}
@end



