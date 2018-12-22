//
//  WXPagedImageView.h
//  TestScrollImageView
//
//  Created by lzq on 16/4/13.
//  Copyright © 2016年 weixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WXPagedScrollViewDelegate <NSObject>

@optional
- (void)selectImageAtIndex:(NSInteger)index;
- (void)imageDidLoaded:(UIImage *)image;

@end

@interface WXPagedImageView : UIView

@property (nonatomic, strong) NSArray *imageURLs;
@property (nonatomic, weak) id<WXPagedScrollViewDelegate> delegate;

@end
