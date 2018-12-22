//
//  Network.h
//  Robot
//
//  Created by 百顺 on 2018/3/20.
//  Copyright © 2018年 百顺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Instance.h"
#import "YYBCUtilsNetworkOptions.h"

@interface YYBCUtilsNetwork : NSObject

// 获取单例对象

INSTANCEH(YYBCUtilsNetwork);

/**
 每次网络请求都要必传的参数
 */
@property (strong, nonatomic) NSDictionary *dictArgs;

/**
需要传入的域名子
 */
@property (strong, nonatomic) NSString *strDomain;



/** ApiHost */
@property (strong, nonatomic) NSString *host;
/** HttpsApiHost */
@property (strong, nonatomic) NSString *httpsHost;

/** 分享的host */
@property (strong, nonatomic) NSString *shareHost;
/** 分享的HttpsHost */
@property (strong, nonatomic) NSString *shareHttpsHost;

/** 图片服务器 */
@property (strong, nonatomic) NSString *imageHost;

/** 视频服务器 */
@property (strong, nonatomic) NSString *videoHost;

/** option--用于配置请求头 */
@property (strong, nonatomic) YYBCUtilsNetworkOptions * options;

/** 初始化apiHost,shareHost,imageHost */
+ (void) initApiHost:(NSString *)apiHost httpsApiHost:(NSString *)httpsApiHost shareHost:(NSString *)shareHost shareHttpsHost:(NSString *)shareHttpsHost imageHost:(NSString *)imageHost videoHost:(NSString *)videoHost;

/** 自定义拼接图片url方法 */
+ (NSString *)customAppendImgUrl:(NSString *)imageUrl;
/** 自定义拼接图片url方法返回url */
+ (NSURL *)getImgUrlCustomAppend:(NSString *)imageUrl;

#pragma mark - 请求区方法
- (nullable NSURLSessionDataTask *)GET:(NSString *_Nullable)URLString
                            parameters:(nullable id)parameters
                               success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;


- (nullable NSURLSessionDataTask *)POST:(NSString *_Nullable)URLString
                             parameters:(nullable id)parameters
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;


// 下载文件
- (NSURLSessionDownloadTask *_Nullable)downloadTaskWithRequest:(NSString *_Nullable)URLString
                                                    saveToPath:(NSString *)path
                                             completionHandler:(nullable void (^)(NSURLResponse * _Nullable response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler;
//上传文件
- (NSURLSessionDataTask *)POSTFile:(NSString *)URLString args:(NSDictionary *)args files:(NSArray *)files fileArg:(NSString *)fileArg constructingBodyWithBlock:(void(^)(id<AFMultipartFormData>  _Nonnull formData))constructingBodyWithBlock progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject))success failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

//网络加载请求转圈
+ (void)showLoading:(UIView *)view;
//取消网络请求转圈方法
+ (void)hideLoading:(UIView *)view;

//网络请求完毕加载请求的转圈方法
+ (void)showFinishLoading:(UIView *)view;
//取消网络请求加载完毕请求转圈方法
+ (void)hideFinishLoading:(UIView *)view;


//检测4g网络提醒方法
+ (void)check4GRemindMethod;
@end























