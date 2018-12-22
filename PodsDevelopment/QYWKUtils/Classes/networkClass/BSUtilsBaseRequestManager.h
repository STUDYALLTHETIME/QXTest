//
//  BSUtilsBaseRequestManager.h
//  AFNetworking
//
//  Created by yuYue on 2018/12/3.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSUtilsBaseRequestManager : NSObject
@property (nonatomic, strong) AFHTTPSessionManager *sessionManger;//会话管理
@property (nonatomic, strong) NSString *baseUrl;//
@property (nonatomic, strong) NSString *securityBaseUrl;//


/**
 初始化session
 */
- (void)initSession;

/**
 post请求

 @param urlString 接口地址
 @param parmas 参数
 @param finishBlk 完成请求block
 */
- (void)postWithUrl:(NSString *)urlString parmas:(NSDictionary *)parmas finishBlk:(void (^)(NSDictionary *responseObject, NSError *error))finishBlk;
@end

NS_ASSUME_NONNULL_END
