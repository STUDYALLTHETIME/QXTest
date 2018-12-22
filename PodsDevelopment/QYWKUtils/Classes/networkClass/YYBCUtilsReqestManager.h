//
//  ReqestManager.h
//
//  Created by 百顺 on 2018/3/20.
//  Copyright © 2018年 百顺. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RequestManager_Method_POST @"POST"
#define RequestManager_Method_GET  @"GET"
#define IsHttpsRequest @"isHttpsRequest"

@interface YYBCUtilsReqestManager : NSObject

/**
 网络请求
 
 @param method 请求方法：GET/POST 目前只支持这两中
 @param url 地址
 @param parameters 参数
 @param completed 回调
 @param dictReference 判断成功还是后台出错的错误码
 */
+ (void)request:(NSString *)method url:(NSString *)url parameters:(NSDictionary *)parameters completed:(void (^)(NSDictionary *, NSError *))completed  reference:(NSDictionary *)dictReference;


/**
 下载文件

 @param fileUrl 要下载的文件路径
 @param completed 完成后回调
 */
+ (void)downLoadFile:(NSString *)fileUrl saveToPath:(NSString *)path completed:(void(^)(NSURL *url, NSError *error))completed;


/**
 上传文件

 @param URLString url 地址
 @param args 普通参数
 @param files 文件数组
 @param fileArg 文件key
 @param progress 上传进度
 @param completed 上传完成
 */
+ (void)POSTFile:(NSString *)URLString args:(NSDictionary *)args files:(NSArray *)files fileArg:(NSString *)fileArg  progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress completed:(void(^)(NSDictionary *data, NSError *error))completed;
@end





