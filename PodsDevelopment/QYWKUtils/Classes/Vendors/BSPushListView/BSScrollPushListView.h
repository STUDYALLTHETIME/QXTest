//
//  BSScrollPushListView.h
//  AFNetworking
//
//  Created by yuYue on 2018/11/13.
//

#import <UIKit/UIKit.h>
#import "BSPushListView.h"
@protocol BSScrollPushListViewDelegate;

NS_ASSUME_NONNULL_BEGIN


@interface BSScrollPushListView : UIView
@property (weak, nonatomic) id<BSScrollPushListViewDelegate> delegate;


/*
 *  当前的控制器
 */
@property (strong, nonatomic) UIViewController *controllerCur;


/**
    当前index
 */
@property (assign, nonatomic) NSUInteger index;


- (void)setPushListViewStyle:(NSArray *)arrPushListViewStyle controllers:(NSArray *)controllers mainController:(UIViewController *)mainController;

/*
 *  设置显示的位置
 */
- (void)setPosition:(NSUInteger)index animated:(BOOL)animated;

/**
 controller滑动到指定位置（UIView动画）
 
 @param index
 */
- (void)setPositionForScrollBar:(NSUInteger)index;

@end

@protocol BSScrollPushListViewDelegate <NSObject>

@optional


/**
 返回

 @param scrollPushListView
 */
- (void)BSScrollPushListViewDelegateForBack:(BSScrollPushListView *)scrollPushListView;
- (void)BSScrollPushListViewDelegateForScrollIndex:(BSScrollPushListView *)scrollPushListView index:(NSUInteger)index;
- (void)BSScrollPushListViewDelegateForDidScroll:(BSScrollPushListView *)scrollPushListView index:(NSUInteger)index;
@end
NS_ASSUME_NONNULL_END
