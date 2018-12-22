//
//  BSPushListView.m
//  AFNetworking
//
//  Created by yuYue on 2018/11/12.
//

#import "BSPushListView.h"
#import "BSPushListViewOffset.h"
#import "Masonry.h"

@interface BSPushListView ()
/*
 *  topViewEnd
 */
@property (strong, nonatomic)  UIView *viewTopViewEnd;

/*
 *  topViewStart
 */

@property (strong, nonatomic)  UIView *viewTopViewStart;

/*
 *  返回按钮
 */
@property (strong, nonatomic) UIButton *btnTopLeft;

/*
 *  开始视图返回按钮
 */
@property (strong, nonatomic) UIButton *btnTopLeftStart;

/*
 *  顶部结束的imageView
 */
@property (strong, nonatomic) UIImageView *imageViewTopEnd;
/*
 *  标题
 */
@property (strong, nonatomic) UILabel *labTitle;

/*
 *  开始视图标题
 */
@property (strong , nonatomic) UILabel *labTitleStart;;

/*
 *  顶部开始的imageView
 */
@property (strong, nonatomic) UIImageView *imageViewTopStart;

/*
 *  接收的style
 */
@property (strong, nonatomic) BSPushListViewStyle *pushListViewStyleSave;


@end

@implementation BSPushListView{
    
}

- (void)setPushListViewStyle:(BSPushListViewStyle *)pushListViewStyle{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.pushListViewStyleSave = pushListViewStyle;

        /** topViewEnd */
        //背景图
        self.viewTopViewEnd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50+BSPLVNAVTOP)];
        self.imageViewTopEnd = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.viewTopViewEnd.frame.size.width, self.viewTopViewEnd.frame.size.height)];
        self.imageViewTopEnd.image = pushListViewStyle.imageTopEnd;
        [self.viewTopViewEnd addSubview:self.imageViewTopEnd];
        [self addSubview:self.viewTopViewEnd];
        if (self.pushListViewStyleSave.isScrollLeftRight) {
            self.viewTopViewEnd.hidden = YES;
        }
        
        //返回按钮
        self.btnTopLeft = [[UIButton alloc] initWithFrame:CGRectMake(0,  BSPLVNAVTOP, 30+pushListViewStyle.imageBack.size.width, 50.0)];
        [self.btnTopLeft setImage:pushListViewStyle.imageBack forState:UIControlStateNormal];
        [self.viewTopViewEnd addSubview:self.btnTopLeft];
        [self.btnTopLeft addTarget:self action:@selector(btnBackClick) forControlEvents:UIControlEventTouchUpInside];
        
        //标题
        self.labTitle = [[UILabel alloc] init];
        [self.viewTopViewEnd addSubview:self.labTitle];
        [self.labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.viewTopViewEnd);
            make.centerY.equalTo(self.btnTopLeft);
            make.width.mas_lessThanOrEqualTo(200.0);
        }];
        self.labTitle.textColor = [UIColor whiteColor];
        self.labTitle.font = [UIFont systemFontOfSize:18.0];
        self.labTitle.text = pushListViewStyle.strTitle;
        
        /** tableView */
        //tableView
        CGFloat heightBottom = 0;
        if (BSPLViPhoneX) {
            heightBottom = BSPLViPhoneXBottomSafeFieldHeight;
        }
        self.tableView = pushListViewStyle.tableView;
        [self addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.viewTopViewEnd.mas_bottom);
            make.left.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-heightBottom);
        }];
        
        UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        viewHeader.backgroundColor = [UIColor clearColor];
        self.tableView.tableHeaderView = viewHeader;
        
        /** topViewStart */
        //背景图
        self.viewTopViewStart = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 90+BSPLVNAVTOP)];
        self.imageViewTopStart = [[UIImageView alloc] init];
        self.imageViewTopStart.image = pushListViewStyle.imageTopStart;
        [self.viewTopViewStart addSubview:self.imageViewTopStart];
        [self.imageViewTopStart mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        [self addSubview:self.viewTopViewStart];
        if (self.pushListViewStyleSave.isScrollLeftRight) {
            self.viewTopViewStart.hidden = YES;
        }
        
        CGFloat widthTemp = self.pushListViewStyleSave.imageTopStart.size.width;
        CGFloat heightTemp = self.pushListViewStyleSave.imageTopStart.size.height;
        UIImage *imageTemp = [self.pushListViewStyleSave.imageTopStart resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0,heightTemp-1 , widthTemp-1) resizingMode:UIImageResizingModeStretch];
        
        self.imageViewTopStart.image = imageTemp;

    
        //返回按钮
        self.btnTopLeftStart = [[UIButton alloc] initWithFrame:CGRectMake(0,  BSPLVNAVTOP, 30+pushListViewStyle.imageBack.size.width, 50.0)];
        [self.btnTopLeftStart setImage:pushListViewStyle.imageBack forState:UIControlStateNormal];
        [self.viewTopViewStart addSubview:self.btnTopLeftStart];
        [self.btnTopLeftStart addTarget:self action:@selector(btnBackClick) forControlEvents:UIControlEventTouchUpInside];
        
        //标题
        self.labTitleStart = [[UILabel alloc] init];
        [self.viewTopViewStart addSubview:self.labTitleStart];
        [self.labTitleStart mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.viewTopViewStart);
            make.centerY.equalTo(self.btnTopLeftStart);
            make.width.mas_lessThanOrEqualTo(200.0);
        }];
        self.labTitleStart.textColor = [UIColor whiteColor];
        self.labTitleStart.font = [UIFont systemFontOfSize:18.0];
        self.labTitleStart.text = pushListViewStyle.strTitle;
        
        //时间
        UILabel *labTime = [[UILabel alloc] init];
        [self.viewTopViewStart addSubview:labTime];
        [labTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.labTitleStart.mas_bottom).offset(10.0);
            make.centerX.equalTo(self.labTitleStart);
        }];
        labTime.textColor = [UIColor whiteColor];
        labTime.font = [UIFont systemFontOfSize:11];
        labTime.text = pushListViewStyle.strTime;
        
        //kvo
       [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    });
}

//kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    CGPoint pointNew = [change[NSKeyValueChangeNewKey]CGPointValue];
    CGPoint pointOld = [change[NSKeyValueChangeOldKey]CGPointValue];
    
    if ([keyPath isEqualToString:@"contentOffset"] && (pointNew.y != pointOld.y)) {
        //viewTopViewStart做动画
        CGFloat offsetY = self.tableView.contentOffset.y;
        CGFloat height = 90+BSPLVNAVTOP;
        if (offsetY > 0) {
            //向上滑动
            CGFloat heightUse = height - offsetY;
            if (heightUse > 0) {
                self.viewTopViewStart.frame = CGRectMake(0, self.viewTopViewStart.frame.origin.y, self.viewTopViewStart.bounds.size.width, heightUse);
            }
            
            if (!self.pushListViewStyleSave.isScrollLeftRight) {
                CGFloat distanceFlag = 40.0;//偏移量临界值
                if (offsetY >= distanceFlag) {
                    self.viewTopViewStart.hidden = YES;
                    self.viewTopViewEnd.hidden = NO;
                }else{
                    self.viewTopViewStart.hidden = NO;
                    self.viewTopViewEnd.hidden = YES;
                }
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"topScroll" object:@(offsetY)];
        }else{
            //向下滑动
            CGFloat heightUse = height - offsetY;
            self.viewTopViewStart.frame = CGRectMake(0, self.viewTopViewStart.frame.origin.y, self.viewTopViewStart.bounds.size.width, heightUse);
            
            [self.labTitleStart mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.btnTopLeftStart).offset(-offsetY/2.0);
            }];
            
            if (!self.pushListViewStyleSave.isScrollLeftRight) {
                self.viewTopViewStart.hidden = NO;
                self.viewTopViewEnd.hidden = YES;
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"bottomScroll" object:@(offsetY)];
        }
        
        if (self.pushListViewStyleSave.isScrollLeftRight) {
            //偏移量保存（Y向有偏移）
            BSPushListViewOffset *pushListViewOffset =  [BSPushListViewOffset sharedInstance];
            CGFloat Y = self.tableView.contentOffset.y;
            pushListViewOffset.offsetY = Y;
        }
    }
}

#pragma mark - Auction

#pragma mark 返回按钮被点击
- (void)btnBackClick{
    if ([self.delegate respondsToSelector:@selector(BSPushListViewDelegateForBack:)]) {
        [self.delegate BSPushListViewDelegateForBack:self];
    }
}

- (void)dealloc{
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}
@end
