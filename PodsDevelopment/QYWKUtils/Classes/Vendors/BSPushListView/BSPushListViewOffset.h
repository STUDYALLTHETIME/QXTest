//
//  BSPushListViewOffset.h
//  AFNetworking
//
//  Created by yuYue on 2018/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSPushListViewOffset : NSObject
/*
 *  纵向偏移量
 */
@property (assign, nonatomic) CGFloat offsetY;

/*
 *  横向偏移量
 */
@property (assign, nonatomic) CGFloat offsetX;

/*
 *  单例
 */
+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
