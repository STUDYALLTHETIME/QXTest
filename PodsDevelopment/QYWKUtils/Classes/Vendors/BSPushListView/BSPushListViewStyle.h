//
//  BSPushListViewStyle.h
//  AFNetworking
//
//  Created by yuYue on 2018/11/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSPushListViewStyle : UIView
/*
 *  上边开始图片
 */
@property (strong, nonatomic) UIImage *imageTopStart;

/*
 *  上边结束图片
 */
@property (strong, nonatomic) UIImage *imageTopEnd;

/*
 *  自定义的tableView
 */
@property (strong, nonatomic) UITableView *tableView;

/*
 *  左边返回箭头
 */
@property (strong, nonatomic) UIImage *imageBack;

/*
 *  标题
 */
@property (copy, nonatomic) NSString *strTitle;

/*
 *  时间
 */
@property (copy, nonatomic) NSString *strTime;

/*
 *  是带左右滑动的效果
 */
@property (assign, nonatomic) BOOL isScrollLeftRight;

/*
 *  segment
 */
@property (strong, nonatomic) UIView *viewSegment;

/*
 *  segmentCopy
 */
@property (strong, nonatomic) UIView *viewSegmentCopy;

/*
 *  最底层scrollView的背景色
 */
@property (strong, nonatomic) UIColor *colorScrollView;


@end

NS_ASSUME_NONNULL_END














