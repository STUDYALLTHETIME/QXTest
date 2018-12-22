//
//  BSPushListViewTopPrivate.h
//  AFNetworking
//
//  Created by yuYue on 2018/11/13.
//

#import <UIKit/UIKit.h>
#import "BSPushListView.h"
@protocol BSPushListViewTopPrivateDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface BSPushListViewTopPrivate : UIView

@property (weak, nonatomic) id<BSPushListViewTopPrivateDelegate > delegate;

/*
 *  topViewEnd
 */
@property (strong, nonatomic)  UIView *topViewEnd;

/*
 *  topViewStart
 */

@property (strong, nonatomic)  UIView *topViewStart;

/*
 *  开始视图标题
 */
@property (strong , nonatomic) UILabel *labTitleStart;

/*
 *  开始视图返回按钮
 */
@property (strong, nonatomic) UIButton *btnTopLeftStart;


- (instancetype)initWithFrame:(CGRect)frame style:(BSPushListViewStyle *)style;
@end

@protocol BSPushListViewTopPrivateDelegate <NSObject>

@optional
- (void)BSPushListViewTopPrivateDelegateForBack:(BSPushListViewTopPrivate *)pushListViewTopPrivate;

@end

NS_ASSUME_NONNULL_END
