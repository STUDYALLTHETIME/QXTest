//
//  YYBCVLBaseCollectionView.h
//  YYBCVideoLive-YYBCVideoLive
//
//  Created by yuYue on 2018/9/8.
//

#import <UIKit/UIKit.h>
@class MJRefreshAutoNormalFooter;

@interface YYBCUtilsBaseCollectionView : UICollectionView
/** 下拉刷新  */
@property (copy, nonatomic) void(^loadNewData)(void);

/** 上拉加载更多 */
@property (copy, nonatomic) void(^loadMoreData)(void);

//预加载功能

/** 是否有预加载功能 */
@property (assign, nonatomic) BOOL isHavePreLoad;
/** 加载时机 */
@property (assign, nonatomic) CGFloat threshold;
/** 每页加载尺寸 */
@property (assign, nonatomic) CGFloat pageSize;
/** 初始化页面尺寸 */
@property (assign, nonatomic) CGFloat initialPage;
/** 当前页 */
@property (assign, nonatomic) NSUInteger curPage;
/** 预加载blk */
@property (strong, nonatomic) void(^preLoadFetchBlk)(void);

/** 是最后一页 */
@property (assign, nonatomic) BOOL isPreLoadLastPage;
/** 正在请求数据 */
@property (assign, nonatomic) BOOL isPreLoadRefreshing;
/** 预加载footer */
@property (strong, nonatomic) MJRefreshAutoNormalFooter *preLoadFooter;

- (void)endRefresh;
- (void)hideFooter;
- (void)showFooter;

//预加载功能
- (void)preLoadDataThresholdLastItem:(NSUInteger)lastItem WithPageSize:(CGFloat)pageSize initialPage:(int)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk noNetWorkBlk:(void(^)(void))noNetWorkBlk;

- (void)preLoadDataWithThreshold:(CGFloat)threshold pageSize:(CGFloat)pageSize initialPage:(int)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk noNetWorkBlk:(void(^)(void))noNetWorkBlk;
@end
