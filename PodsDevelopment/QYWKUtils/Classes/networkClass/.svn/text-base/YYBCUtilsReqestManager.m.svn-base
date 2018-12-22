//
//  ReqestManager.m
//
//  Created by 百顺 on 2018/3/20.
//  Copyright © 2018年 百顺. All rights reserved.
//

#import "YYBCUtilsReqestManager.h"
#import "YYBCUtilsNetwork.h"

#define ReqestManager_Method_POST @"POST"
#define ReqestManager_Method_GET  @"GET"

NSString *strDomain = @"YYBCUtilsNetwork";
@implementation YYBCUtilsReqestManager

+ (void)request:(NSString *)method url:(NSString *)url parameters:(NSDictionary *)parameters completed:(void (^)(NSDictionary *, NSError *))completed  reference:(NSDictionary *)dictReference{
    if ([YYBCUtilsNetwork sharedYYBCUtilsNetwork].strDomain) {
        strDomain = [YYBCUtilsNetwork sharedYYBCUtilsNetwork].strDomain;
    }
    
    if ([method isEqualToString:ReqestManager_Method_GET]) {
        // get
        NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:parameters];
        [dictM setDictionary:parameters];
        if ([YYBCUtilsNetwork sharedYYBCUtilsNetwork].dictArgs) {
            [dictM setDictionary:[YYBCUtilsNetwork sharedYYBCUtilsNetwork].dictArgs];
        }
        
        [[YYBCUtilsNetwork sharedYYBCUtilsNetwork] GET:url parameters:parameters success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
            NSDictionary *json_dic = (NSDictionary*)responseObject;
            NSData *data = [NSJSONSerialization dataWithJSONObject:json_dic options:NSJSONWritingPrettyPrinted error:nil];
            NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"\n<<-----------返回--------------------\n Url == %@\n Response == %@\n", url, dataStr);
            
            NSString *strKey = dictReference.allKeys.firstObject;
            NSString *strValue = dictReference.allValues.firstObject;

            NSString *strValueUse = responseObject[strKey];
            strValueUse = [NSString stringWithFormat:@"%@",strValueUse];
            
        if (( responseObject[strKey] && ![strValueUse isEqualToString:strValue] )) {
                // 虽然已经和后台沟通了，但是最好还是保留，避免出错
                NSString *errorMessage = responseObject[@"message"] ?: @"请求出了点问题哦, 请稍后重试";
                NSInteger code = responseObject[@"code"]? [responseObject[@"code"] integerValue] : task.error.code;
                NSError * err = [NSError errorWithDomain:strDomain code: code
                                                userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
            
                     completed([NSDictionary dictionary],err);
            
            } else {
                completed(responseObject[@"data"],nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
            NSLog(@"%@", error);
            // 网络欠佳的情况
            if (error.code == -1001 || [error.localizedDescription isEqualToString:@"The request timed out."]) {
                NSError *err = [NSError errorWithDomain:strDomain code: -1001
                                               userInfo:@{NSLocalizedDescriptionKey:@"当前网络不佳，请检查网络"}];
                error = err;
            }
            if (error.code == -1009) {
                // 网络断开
                NSError *err = [NSError errorWithDomain:strDomain code: -1009
                                               userInfo:@{NSLocalizedDescriptionKey:@"似乎已断开与互联网的连接"}];
                error = err;
            }
            
            if (error.code == 500) {
                NSError *err = [NSError errorWithDomain:strDomain code: 500
                                               userInfo:@{NSLocalizedDescriptionKey:@"当前服务不可用，请稍后再试"}];
                error = err;
            }
            completed(nil,error);
        }];
    } else if ([method isEqualToString:ReqestManager_Method_POST]) {
        // post
        
        NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:parameters];
        [dictM setDictionary:parameters];
        if ([YYBCUtilsNetwork sharedYYBCUtilsNetwork].dictArgs) {
             [dictM setDictionary:[YYBCUtilsNetwork sharedYYBCUtilsNetwork].dictArgs];
        }
       
        
        [[YYBCUtilsNetwork sharedYYBCUtilsNetwork] POST:url parameters:dictM success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
            NSDictionary *json_dic = (NSDictionary*)responseObject;
            NSData *data = [NSJSONSerialization dataWithJSONObject:json_dic options:NSJSONWritingPrettyPrinted error:nil];
            NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"\n<<-----------返回--------------------\n Url == %@\n Response == %@\n", url, dataStr);
            
            NSString *strKey = dictReference.allKeys.firstObject;
            NSString *strValue = dictReference.allValues.firstObject;
            
            NSString *strValueUse = responseObject[strKey];
            strValueUse = [NSString stringWithFormat:@"%@",strValueUse];
       if (( responseObject[strKey] && ![strValueUse isEqualToString:strValue] )) {
                // 虽然已经和后台沟通了，但是最好还是保留，避免出错
                NSString *errorMessage = responseObject[@"message"] ?: @"请求出了点问题哦, 请稍后重试";
                NSInteger code = responseObject[@"code"]? [responseObject[@"code"] integerValue] : task.error.code;
                NSError * err = [NSError errorWithDomain:strDomain code: code
                                                userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
           
                   completed([NSDictionary dictionary],err);
           
            }else{
                completed(responseObject[@"data"],nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
            NSLog(@"%@", error);
            // 网络欠佳的情况
            if (error.code == -1001 || [error.localizedDescription isEqualToString:@"The request timed out."]) {
                NSError *err = [NSError errorWithDomain:strDomain code: -1001
                                               userInfo:@{NSLocalizedDescriptionKey:@"当前网络不佳，请检查网络"}];
                error = err;
            }
            if (error.code == -1009) {
                // 网络断开
                NSError *err = [NSError errorWithDomain:strDomain code: -1009
                                               userInfo:@{NSLocalizedDescriptionKey:@"似乎已断开与互联网的连接"}];
                error = err;
            }
            
            if (error.code == 500) {
                NSError *err = [NSError errorWithDomain:strDomain code: 500
                                               userInfo:@{NSLocalizedDescriptionKey:@"当前服务不可用，请稍后再试"}];
                error = err;
            }
            completed(nil,error);
        }];
    }
}

+ (void)downLoadFile:(NSString *)fileUrl saveToPath:(NSString *)path completed:(void (^)(NSURL *, NSError *))completed {
    [[YYBCUtilsNetwork sharedYYBCUtilsNetwork] downloadTaskWithRequest:fileUrl saveToPath:path completionHandler:^(NSURLResponse * _Nullable response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        completed(filePath,error);
    }];
}


+ (void)POSTFile:(NSString *)URLString args:(NSDictionary *)args files:(NSArray *)files fileArg:(NSString *)fileArg  progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress completed:(void (^)(NSDictionary *, NSError *))completed{
    
    if ([YYBCUtilsNetwork sharedYYBCUtilsNetwork].strDomain) {
        strDomain = [YYBCUtilsNetwork sharedYYBCUtilsNetwork].strDomain;
    }
    
    [[YYBCUtilsNetwork sharedYYBCUtilsNetwork] POSTFile:URLString args:args files:files fileArg:fileArg constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //拼接图片
        [files enumerateObjectsUsingBlock:^(UIImage * _Nonnull image, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
            
            NSString *strTemp = [NSString stringWithFormat:@"%@%zd",fileArg,idx];
            [formData appendPartWithFileData:imageData name:strTemp fileName:@"image.jpg" mimeType:@"image/jpg"];
            
        }];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 回到主队列刷新UI,用户自定义的进度条
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *json_dic = (NSDictionary*)responseObject;
        NSData *data = [NSJSONSerialization dataWithJSONObject:json_dic options:NSJSONWritingPrettyPrinted error:nil];
        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"\n<<-----------返回--------------------\n Url == %@\n Response == %@\n", URLString, dataStr);
        
        if (( responseObject[@"error"] && [responseObject[@"error"] integerValue] != 0 )) {
            // 虽然已经和后台沟通了，但是最好还是保留，避免出错
            NSString *errorMessage = responseObject[@"message"] ?: @"请求出了点问题哦, 请稍后重试";
            NSInteger code = responseObject[@"code"]? [responseObject[@"code"] integerValue] : task.error.code;
            NSError * err = [NSError errorWithDomain:strDomain code: code
                                            userInfo:@{NSLocalizedDescriptionKey:errorMessage}];
                completed([NSDictionary dictionary],err);
        } else {
            completed(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        // 网络欠佳的情况
        if (error.code == -1001 || [error.localizedDescription isEqualToString:@"The request timed out."]) {
            NSError *err = [NSError errorWithDomain:strDomain code: -1001
                                           userInfo:@{NSLocalizedDescriptionKey:@"当前网络不佳，请检查网络"}];
            error = err;

        }
        if (error.code == -1009) {
            // 网络断开
            NSError *err = [NSError errorWithDomain:strDomain code: -1009
                                           userInfo:@{NSLocalizedDescriptionKey:@"似乎已断开与互联网的连接"}];
            error = err;

        }
        
        if (error.code == 500) {
            NSError *err = [NSError errorWithDomain:strDomain code: 500
                                           userInfo:@{NSLocalizedDescriptionKey:@"当前服务不可用，请稍后再试"}];
            error = err;
           
        }
        completed(nil,error);

    }];
}

@end













