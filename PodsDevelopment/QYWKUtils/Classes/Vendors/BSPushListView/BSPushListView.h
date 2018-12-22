//
//  BSPushListView.h
//  AFNetworking
//
//  Created by yuYue on 2018/11/12.
//

#import <UIKit/UIKit.h>
#import "BSPushListViewStyle.h"
@protocol BSPushListViewDelegate;

// 屏幕尺寸
#define BSPLVkSCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define BSPLVkSCREENHEIGHT [UIScreen mainScreen].bounds.size.height
// iphonX
#define BSPLViPhoneX ((BSPLVkSCREENWIDTH == 375.f || BSPLVkSCREENWIDTH == 414.f)  && (BSPLVkSCREENHEIGHT == 812.f || BSPLVkSCREENHEIGHT == 896.f) ? YES : NO)
#define BSPLVNAVHEIGHT (BSPLViPhoneX ? 88 : 64)
#define BSPLVNAVTOP (BSPLViPhoneX ? 44 : 20)
#define BSPLVBARHEIGH (BSPLViPhoneX ? 83 : 49)

#define BSPLViPhoneXBottomSafeFieldHeight 34

NS_ASSUME_NONNULL_BEGIN



@interface BSPushListView : UIView

@property (weak, nonatomic) id<BSPushListViewDelegate> delegate;

/*
 *  tableView
 */
@property (strong, nonatomic)  UITableView *tableView;

/**
 设置样式

 @param pushListViewStyle 样式
 */
- (void)setPushListViewStyle:(BSPushListViewStyle *)pushListViewStyle;
@end


@protocol BSPushListViewDelegate <NSObject>

@optional
- (void)BSPushListViewDelegateForBack:(BSPushListView *)pushListView;

@end

NS_ASSUME_NONNULL_END
