//
//  YYBCVLBaseCollectionView.m
//  YYBCVideoLive-YYBCVideoLive
//
//  Created by yuYue on 2018/9/8.
//

#import "YYBCUtilsBaseCollectionView.h"
#import "MJRefresh.h"
#import "ReachabilityManager.h"
#import "UIView+Toast.h"

@implementation YYBCUtilsBaseCollectionView
- (void)setLoadNewData:(void (^)(void))loadNewData {
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _loadNewData = loadNewData;
    __weak typeof(self)weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.loadNewData();
    }];
    self.mj_header = header;
}

- (void)setLoadMoreData:(void (^)(void))loadMoreData {
    _loadMoreData = loadMoreData;
    __weak typeof(self)weakSelf = self;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.loadMoreData();
    }];
    self.mj_footer = footer;
    [self hideFooter];
}

- (void)endRefresh {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)hideFooter {
    self.mj_footer.hidden = YES;
}

- (void)showFooter {
    self.mj_footer.hidden = NO;
}

#pragma mark - 预加载功能的封装
- (void)preLoadDataThresholdLastItem:(NSUInteger)lastItem WithPageSize:(CGFloat)pageSize initialPage:(int)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk noNetWorkBlk:(void(^)(void))noNetWorkBlk{
    [self preLoadDataWithThreshold:(pageSize-lastItem)/(pageSize*1.0) pageSize:pageSize initialPage:initialPage curPage:curPage preLoadFetchBlk:preLoadFetchBlk noNetWorkBlk:noNetWorkBlk];
}

- (void)preLoadDataWithThreshold:(CGFloat)threshold pageSize:(CGFloat)pageSize initialPage:(int)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk noNetWorkBlk:(void(^)(void))noNetWorkBlk{
    
    self.threshold = threshold;
    self.pageSize = pageSize;
    self.initialPage = initialPage;
    self.curPage = curPage;
    self.preLoadFetchBlk = preLoadFetchBlk;
    
    __weak typeof(self) weakSelf = self;
    self.preLoadFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [ReachabilityManager internetStatus:^(NetworkStatus internetStatus) {
            if (internetStatus == NotReachable) {
                [weakSelf.mj_footer endRefreshing];
                if (noNetWorkBlk) {
                    noNetWorkBlk();
                }else{
                    [weakSelf makeCenterWhiteToastWithString:@"似乎已断开与互联网的连接"];
                }
            }
        }];
    }];
    self.mj_footer = self.preLoadFooter;
    
    self.isHavePreLoad = YES;
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    CGPoint pointNew = [change[NSKeyValueChangeNewKey]CGPointValue];
    CGPoint pointOld = [change[NSKeyValueChangeOldKey]CGPointValue];
    
    if ([keyPath isEqualToString:@"contentOffset"] && (pointNew.y != pointOld.y)) {
        [self preLoadMethodWithScrollView:self threshold:self.threshold pageSize:self.pageSize initialPage:self.initialPage curPage:self.curPage preLoadFetchBlk:self.preLoadFetchBlk];
    }
}

- (void)preLoadMethodWithScrollView:(UIScrollView *)scrollView threshold:(CGFloat )threshold pageSize:(CGFloat)pageSize initialPage:(int) initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk{
    
    CGFloat current = scrollView.contentOffset.y + scrollView.frame.size.height;
    CGFloat total = scrollView.contentSize.height;
    CGFloat ratio = current / total;
    
    int pageCur = 0;
    if (initialPage == 1) {
        pageCur = initialPage - 1;
    }
    
    CGFloat needRead = pageSize * threshold + pageCur * pageSize;
    CGFloat totalItem = pageSize * (pageCur + 1);
    CGFloat newThreshold = needRead / totalItem;
    
    __block BOOL isNoNetwork = NO;
    [ReachabilityManager internetStatus:^(NetworkStatus internetStatus) {
        if (internetStatus == NotReachable) {
            //没有网络
            isNoNetwork = YES;
        }
    }];
    
    if ((ratio >= newThreshold && isNoNetwork == NO) && (self.isPreLoadRefreshing == NO && self.isPreLoadLastPage == NO)) {
        self.isPreLoadRefreshing = YES;
        
        if (preLoadFetchBlk) {
            curPage += 1;
            preLoadFetchBlk();
        }
    }
}

- (void)dealloc{
    if (self.isHavePreLoad) {
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
}

@end
