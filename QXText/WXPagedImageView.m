//
//  WXPagedImageView.m
//  TestScrollImageView
//
//  Created by lzq on 16/4/13.
//  Copyright © 2016年 weixiang. All rights reserved.
//

#import "WXPagedImageView.h"
#import "UIView+QXEXView.h"
//#import <SDWebImage/UIImageView+WebCache.h>

@interface WXPagedImageView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIImageView *currentImageView;
@property (nonatomic, strong) UIImageView *otherImageView;

@property (nonatomic, strong) UIImageView *preImageView;
@property (nonatomic, strong) UIImageView *scrollPreImageView;
@property (nonatomic, strong) UIImageView *nextImageView;
@property (nonatomic, strong) UIImageView *scrollNextImageView;
@property (nonatomic, assign) BOOL isFirst;
@property (nonatomic, assign) BOOL isCaluation;

@end

@implementation WXPagedImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.isCaluation = YES;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.currentPage = 0;
        _pageControl.hidden = YES;
        [self addSubview:_pageControl];
        
        self.imageViews = [NSMutableArray array];
        
        UIGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        [self addGestureRecognizer:gr];
        [self startAutoScroll];
        _isFirst = YES;
    }
    return self;
}

- (void)startAutoScroll
{
    __weak WXPagedImageView *wself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [wself doScroll];
    });
}

- (void)doScroll
{
//    if (!_scrollView.dragging && !_scrollView.decelerating) {
//        [_scrollView setContentOffset:CGPointMake(_scrollView.contentSize.width - CGRectGetWidth(_scrollView.frame), 0) animated:YES];
//    }
//    __weak WXPagedImageView *wself = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [wself doScroll];
//    });
}

- (void)setImageURLs:(NSArray *)imageURLs
{
    _isFirst = YES;
    if (imageURLs.count > 0) {
        _imageURLs = imageURLs;
        [_imageViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_imageViews removeAllObjects];
        _pageControl.numberOfPages = [_imageURLs count];
//        if (imageURLs.count > 1) {
//            _pageControl.hidden = NO;
//        }
//        else {
//            _pageControl.hidden = YES;
//        }
        for (NSUInteger i = 0;i < [imageURLs count];i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            UIImage *image = [UIImage imageNamed:imageURLs[i]];
            imageView.image = image;
            imageView.tag = i;
            [_imageViews addObject:imageView];
        }
        if (self.imageViews.count > 0) {
                self.currentImageView = self.imageViews[0];
                [self.scrollView addSubview:self.currentImageView];
                if ([self.imageViews count] > 1) {
                    self.preImageView = [self.imageViews lastObject];
                    [self.scrollView addSubview:self.preImageView];
                    
                    self.nextImageView = self.imageViews[1];
                    [self.scrollView addSubview:self.nextImageView];
                }
                [self setNeedsLayout];
                [self layoutIfNeeded];
                [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.frame), 0)];
        }
    }
}

- (void)onTap:(UIGestureRecognizer *)gr
{
    if (_delegate && [_delegate respondsToSelector:@selector(selectImageAtIndex:)]) {
        [_delegate selectImageAtIndex:_pageControl.currentPage];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _scrollView.frame = self.bounds;
    if ([_imageViews count] == 1) {
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    }
    else {
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * 3, CGRectGetHeight(self.frame));
    }
    if ([_imageViews count] > 1) {
        CGFloat x = CGRectGetWidth(self.frame);
        _preImageView.frame = CGRectMake(50, 10, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-20);
        _currentImageView.frame = CGRectMake(x+20, 10, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-20);
        _nextImageView.frame = CGRectMake(x*2-10, 10, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-20);
    
    }
    else {
        _currentImageView.frame = CGRectMake(20, 0, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame));
    }
//    NSLog(@"%@",_currentImageView);
}

- (void)reposition
{
    CGFloat x = CGRectGetWidth(self.frame);
    
    self.currentImageView.transform = CGAffineTransformIdentity;
//    self.otherImageView.transform = CGAffineTransformIdentity;
    
    self.currentImageView = _otherImageView;
    if (_currentImageView.tag < [_imageViews count] - 1) {
        _scrollNextImageView = _imageViews[_currentImageView.tag + 1];
    }else{
        _scrollNextImageView = [_imageViews firstObject];
    }
    if (_scrollNextImageView && ![_scrollNextImageView superview]) {
        [_scrollView addSubview:_scrollNextImageView];
    }
    self.nextImageView = _scrollNextImageView;;
    
    if (_currentImageView.tag == 0) {
        _scrollPreImageView = [_imageViews lastObject];
    }
    else {
        _scrollPreImageView = _imageViews[_currentImageView.tag - 1];
    }
    if (_scrollPreImageView && ![_scrollPreImageView superview]) {
        [_scrollView addSubview:_scrollPreImageView];
    }
    self.preImageView = _scrollPreImageView;;
    self.isCaluation = NO;

    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:NO];
    self.isCaluation = YES;
//    [self setNeedsLayout];

    _nextImageView.center = CGPointMake([self getWidth]*2-10+[_nextImageView getHalfWidth], [self getHalfHeight]);
    _currentImageView.center = CGPointMake([self getWidth]+20+[_currentImageView getHalfWidth], [self getHalfHeight]);
    _preImageView.center = CGPointMake(50+[_preImageView getHalfWidth], [self getHalfHeight]);
  

}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (fabs(scrollView.contentOffset.x - CGRectGetWidth(self.frame)) > 1) {
        [self reposition];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (fabs(scrollView.contentOffset.x - CGRectGetWidth(self.frame)) > 1) {
        [self reposition];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([_imageViews count] > 0) {
        CGFloat x = CGRectGetWidth(self.frame);
        if (scrollView.contentOffset.x > x) {
            if (_currentImageView.tag < [_imageViews count] - 1) {
                self.otherImageView = _imageViews[_currentImageView.tag + 1];
            }
            else {
                self.otherImageView = [_imageViews firstObject];
            }
            self.otherImageView.frame = CGRectMake(x*2-10, 10, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-20);
        }
        else if (scrollView.contentOffset.x < x){
            if (_currentImageView.tag == 0) {
                self.otherImageView = [_imageViews lastObject];
            }
            else {
                self.otherImageView = _imageViews[_currentImageView.tag - 1];
            }
            self.otherImageView.frame = CGRectMake(50, 10, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-20);
        }
        if (self.isCaluation) {
            CGFloat scale = fabs(scrollView.contentOffset.x - x)/x;
            NSLog(@"scale = %f",scale);
            CGFloat current = 1-0.2*scale;
            CGFloat other = 1+0.2*scale;
            self.currentImageView.transform = CGAffineTransformMakeScale(1,current);
            self.otherImageView.transform = CGAffineTransformMakeScale(1,other);
        }
        if (_otherImageView && ![_otherImageView superview]) {
            [_scrollView addSubview:_otherImageView];
        }
    }
}




@end
