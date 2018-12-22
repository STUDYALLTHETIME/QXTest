//
//  BSScrollPushListView.m
//  AFNetworking
//
//  Created by yuYue on 2018/11/13.
//

#import "BSScrollPushListView.h"
#import "BSPushListViewTopPrivate.h"
#import "Masonry.h"
#import "BSPushListViewOffset.h"
#import "BSPushListScrollView.h"

@interface BSScrollPushListView ()<UIScrollViewDelegate,BSPushListViewTopPrivateDelegate,UIGestureRecognizerDelegate>
@property (weak, nonatomic)   UIViewController *mainController;
@property (strong, nonatomic) NSArray *arrControllers;
@property (strong, nonatomic) NSArray *arrStyles;
@property (strong, nonatomic) NSMutableArray *arrMTableView;
@property (strong, nonatomic) BSPushListScrollView *scrollView;
@end

@implementation BSScrollPushListView{
    BSPushListViewTopPrivate *viewTop;
}

- (void)setPushListViewStyle:(NSArray *)arrPushListViewStyle controllers:(NSArray *)controllers mainController:(UIViewController *)mainController{
    self.arrStyles = arrPushListViewStyle;
    self.arrMTableView = [NSMutableArray array];
    BSPushListViewStyle *style = self.arrStyles[0];
    
    //scrollView
    self.scrollView = [[BSPushListScrollView alloc] initWithFrame:self.bounds];
    if (style.colorScrollView) {
        self.scrollView.backgroundColor = style.colorScrollView;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * controllers.count, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    [self addSubview:self.scrollView];
    self.scrollView.vc = mainController;
    [self.scrollView setEdgePop];
    
    self.arrControllers = controllers;
    self.mainController = mainController;
    [controllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = obj;
        if (idx == 0) {
            [mainController addChildViewController:vc];
            vc.view.frame = self.bounds;
            [self.scrollView addSubview:vc.view];
            self.controllerCur = vc;
            self.index = 0;
            
            //单个controller界面处理
            BSPushListView *pushListView = [[BSPushListView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
            [vc.view addSubview:pushListView];
            
            [pushListView setPushListViewStyle:self.arrStyles[idx]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.arrMTableView addObject:((BSPushListViewStyle *)arrPushListViewStyle[idx]).tableView];
        });
    }];

  //顶部遮盖物
    CGFloat distance = 0.0;
    if (((BSPushListViewStyle *)(arrPushListViewStyle[0])).viewSegment) {
        distance = ((BSPushListViewStyle *)(arrPushListViewStyle[0])).viewSegment.frame.size.height;
    }
    
    viewTop = [[BSPushListViewTopPrivate alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 90 + BSPLVNAVTOP+distance) style:arrPushListViewStyle[0]];
    viewTop.delegate = self;
    [self addSubview:viewTop];
    
    //noti
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotiAboutTopScroll:) name:@"topScroll" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotiAboutBottomScroll:) name:@"bottomScroll" object:nil];
}

#pragma mark - 收到上下滑动通知
#pragma mark 向上滑动
- (void)getNotiAboutTopScroll:(NSNotification *)noti{
    CGFloat heightTemp = 0.0;
    BSPushListViewStyle *style = self.arrStyles[0];
    if (style.viewSegment) {
        heightTemp = style.viewSegment.frame.size.height;
    }
    
    NSNumber *numDistance = noti.object;
    CGFloat heighView = 90+BSPLVNAVTOP+heightTemp - numDistance.floatValue;
    CGFloat heighViewEnd = viewTop.topViewEnd.frame.size.height;
    if (heighView > heighViewEnd) {
        
        viewTop.topViewStart.frame = CGRectMake(0, viewTop.topViewStart.frame.origin.y, viewTop.topViewStart.bounds.size.width, heighView);
        
        viewTop.topViewStart.hidden = NO;
        viewTop.topViewEnd.hidden = YES;

    }else{
        viewTop.topViewStart.hidden = YES;
        viewTop.topViewEnd.hidden = NO;
    }
}

#pragma mark 向下滑动
- (void)getNotiAboutBottomScroll:(NSNotification *)noti{
    NSNumber *numDistance = noti.object;
    CGFloat heightTemp = 0.0;
    BSPushListViewStyle *style = self.arrStyles[0];
    if (style.viewSegment) {
        heightTemp = style.viewSegment.frame.size.height;
    }
    
    CGFloat height = 90+BSPLVNAVTOP + heightTemp;
    CGFloat heightUse = height - numDistance.floatValue;
    viewTop.topViewStart.frame = CGRectMake(0, viewTop.topViewStart.frame.origin.y, viewTop.topViewStart.bounds.size.width, heightUse);
    [viewTop.labTitleStart mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->viewTop.btnTopLeftStart).offset(-numDistance.floatValue/2.0);
    }];
    
    viewTop.topViewStart.hidden = NO;
    viewTop.topViewEnd.hidden = YES;

}

#pragma mark - Auction
- (void)BSPushListViewTopPrivateDelegateForBack:(BSPushListViewTopPrivate *)pushListViewTopPrivate{
    if ([self.delegate respondsToSelector:@selector(BSScrollPushListViewDelegateForBack:)]) {
        [self.delegate BSScrollPushListViewDelegateForBack:self];
    }
}

#pragma mark - Delegate
#pragma mark 手指滑动结束代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSUInteger pageIndex = scrollView.contentOffset.x/self.bounds.size.width;

    //controller
    [self setController:self.arrControllers[pageIndex] pageIndex:pageIndex];
    if ([self.delegate respondsToSelector:@selector(BSScrollPushListViewDelegateForScrollIndex:index:)]) {
        [self.delegate BSScrollPushListViewDelegateForScrollIndex:self index:pageIndex];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(BSScrollPushListViewDelegateForDidScroll:index:)]) {
        CGFloat Y = scrollView.contentOffset.x;
        NSUInteger index = Y/scrollView.frame.size.width;
        [self.delegate BSScrollPushListViewDelegateForDidScroll:self index:index];
    }
}

#pragma mark 程序控制带动画滑动结束代理
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //controller
    NSUInteger pageIndex = scrollView.contentOffset.x/self.bounds.size.width;
    UIViewController *vc = self.arrControllers[pageIndex];
    if (vc != self.controllerCur) {
        [self setController:vc pageIndex:pageIndex];
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    CGPoint pointNew = [change[NSKeyValueChangeNewKey]CGPointValue];
    CGPoint pointOld = [change[NSKeyValueChangeOldKey]CGPointValue];

    if ([keyPath isEqualToString:@"contentOffset"] && (pointNew.x != pointOld.x)) {
        //X向有偏移
        CGFloat pageFloat = pointNew.x/self.bounds.size.width;
        NSUInteger pageIndexNext;
        if (pointNew.x >= pointOld.x) {
            //往左方向滑动
            pageIndexNext = (NSUInteger)pageFloat;
            pageIndexNext++;
        }else{
            //往右方向滑动
            pageIndexNext = (NSUInteger)pageFloat;
        }
        
        //tableView偏移量设置
        if (pageIndexNext < self.arrMTableView.count) {
            UITableView *tableView = self.arrMTableView[pageIndexNext];
            
            BSPushListViewOffset *pushListViewOffset = [BSPushListViewOffset sharedInstance];
            CGFloat distanceFlag = 40.0;//偏移量临界值
            
            if (pushListViewOffset.offsetY >= distanceFlag) {
                //临界值上面
                if (tableView.contentOffset.y >= distanceFlag) {
                    
                }else{
                    [tableView setContentOffset:CGPointMake(0, 40)];
                }
            }else{
                //临界值下面
                if (pushListViewOffset.offsetY != tableView.contentOffset.y) {
                    [tableView setContentOffset:CGPointMake(0, pushListViewOffset.offsetY)];
                }
            }
           
        }
        
        //保存X向偏移量
        CGFloat X = self.scrollView.contentOffset.x;
        BSPushListViewOffset *pushListViewOffset = [BSPushListViewOffset sharedInstance];
        pushListViewOffset.offsetX = X;
    }
    
}

#pragma mark - 设置滑动到指定位置
- (void)setPosition:(NSUInteger)index animated:(BOOL)animated{
    CGFloat distance = self.bounds.size.width;

    [self.scrollView setContentOffset:CGPointMake(distance*index, 0) animated:animated];

    if (!animated) {
        NSUInteger pageIndex = self.scrollView.contentOffset.x/self.bounds.size.width;
        UIViewController *vc = self.arrControllers[pageIndex];
        if (vc != self.controllerCur) {
            [self setController:vc pageIndex:pageIndex];
        }
    }
}

- (void)setPositionForScrollBar:(NSUInteger)index{
    CGFloat distance = self.bounds.size.width;
    
    //判断向左点击还是向右点击
    double offsetX = self.scrollView.contentOffset.x;
    if (offsetX <= distance*index) {
        //向右点击
        if (index >= 1) {
            [self.scrollView setContentOffset:CGPointMake(distance*(index-1)+1.0, 0) animated:NO];
        }
    }else{
        //向左点击
        if (index >= 0) {
            [self.scrollView setContentOffset:CGPointMake(distance*(index+1)-1.0, 0) animated:NO];
        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.scrollView setContentOffset:CGPointMake(distance*index, 0) animated:NO];
    }];
    
    NSUInteger pageIndex = self.scrollView.contentOffset.x/self.bounds.size.width;
    UIViewController *vc = self.arrControllers[pageIndex];
    if (vc != self.controllerCur) {
        [self setController:vc pageIndex:pageIndex];
    }
}

- (void)dealloc{
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setController:(UIViewController *)vc pageIndex:(NSUInteger)pageIndex{
    //已经切换了controller
    self.controllerCur = vc;
    self.index = pageIndex;
    
    //判断是否要摆放vc.view
    if (!vc.isViewLoaded) {
        [self.mainController addChildViewController:vc];
        vc.view.frame = CGRectMake(self.bounds.size.width * pageIndex, 0, self.bounds.size.width, self.bounds.size.height);
        [self.scrollView addSubview:vc.view];
        
        //单个controller界面处理
        BSPushListView *pushListView = [[BSPushListView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [vc.view addSubview:pushListView];
        
        [pushListView setPushListViewStyle:self.arrStyles[pageIndex]];
        
        BSPushListViewOffset *pushListViewOffset = [BSPushListViewOffset sharedInstance];
        CGFloat distanceFlag = 40.0;//偏移量临界值
        
        if (pushListViewOffset.offsetY >= distanceFlag) {
            //临界值上面
            if (pushListView.tableView.contentOffset.y >= distanceFlag) {
                
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [pushListView.tableView setContentOffset:CGPointMake(0, distanceFlag)];
                    [BSPushListViewOffset sharedInstance].offsetY = distanceFlag;
                });
            }
        }else{
            //临界值下面
            if (pushListViewOffset.offsetY != pushListView.tableView.contentOffset.y) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [pushListView.tableView setContentOffset:CGPointMake(0, pushListViewOffset.offsetY)];
                });
            }
        }
    }
}

@end



















