//
//  YYBCVLNetwork.m
//
//  Created by 百顺 on 2018/3/20.
//  Copyright © 2018年 百顺. All rights reserved.
//

#import "YYBCUtilsNetwork.h"
#import "YYBCUtilsReqestManager.h"
#import "MBProgressHUD.h"
#import "ReachabilityManager.h"

NSString *const YYBCUtilsNeed4GRemind = @"Need4GRemind";

@interface YYBCUtilsNetwork ()
/** 网络请求管理者 */
@property (nonatomic,strong) AFHTTPSessionManager * sessionManager;

/** 下载 */
@property (nonatomic,strong) AFURLSessionManager * downLoadManager;

/** hud */
@property (nonatomic,strong) MBProgressHUD *hud;
@end

@implementation YYBCUtilsNetwork


#pragma mark - 单例方法

INSTANCEM(YYBCUtilsNetwork, YYBCUtilsNetwork);

#pragma mark - 加载方法--------操作区

- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask * _Nullable, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nullable))failure {
    // 处理host
    BOOL isHttps = [[parameters allKeys] containsObject:IsHttpsRequest];
    NSString *url;
    if (![URLString containsString:self.host]) {
        if ([[URLString substringToIndex:1] isEqualToString:@"/"]) {
            url = [NSString stringWithFormat:@"%@%@",self.host,URLString];
            if (isHttps) {
               url = [NSString stringWithFormat:@"%@%@",self.httpsHost,URLString];
            }
        } else {
            url = [NSString stringWithFormat:@"%@/%@",self.host,URLString];
            if (isHttps) {
               url = [NSString stringWithFormat:@"%@/%@",self.httpsHost,URLString];
            }
        }
    } else {
        url = URLString;
    }
    
    NSLog(@"\n<<-----------请求-------------------\n Url == %@\n Params == %@\n------------------------------->>", url, parameters);
    
    return [self.sessionManager GET:url parameters:parameters progress:nil success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask * _Nullable, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nullable))failure {
    // 处理host
    BOOL isHttps = [[parameters allKeys] containsObject:IsHttpsRequest];
    NSString *url;
    if (![URLString containsString:self.host]) {
        if ([[URLString substringToIndex:1] isEqualToString:@"/"]) {
            url = [NSString stringWithFormat:@"%@%@",self.host,URLString];
            if (isHttps) {
                url = [NSString stringWithFormat:@"%@%@",self.httpsHost,URLString];
            }
        } else {
            url = [NSString stringWithFormat:@"%@/%@",self.host,URLString];
            if (isHttps) {
                url = [NSString stringWithFormat:@"%@/%@",self.httpsHost,URLString];
            }
        }
        
    } else {
        url = URLString;
    }
    
    NSLog(@"\n<<-----------请求-------------------\n Url == %@\n Params == %@\n------------------------------->>", url, parameters);
    
    return [self.sessionManager POST:url parameters:parameters progress:nil success:success failure:failure];
}

- (NSURLSessionDownloadTask *)downloadTaskWithRequest:(NSString *)URLString saveToPath:(NSString *)path completionHandler:(void (^)(NSURLResponse * _Nullable, NSURL * _Nullable, NSError * _Nullable))completionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        if (path!= nil && path.length > 0) {
            return [documentsDirectoryURL URLByAppendingPathComponent:path];
        }
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        completionHandler(response,filePath,error);
    }];
    [downloadTask resume];
    return downloadTask;
}


#pragma mark - 懒加载网络请求管理者
//  设置根url懒加载
- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sessionManager.securityPolicy.allowInvalidCertificates = YES;
        [_sessionManager.securityPolicy setValidatesDomainName:NO];
        
        // 10s请求超时
        _sessionManager.requestSerializer.timeoutInterval = 10;
        
        // null变为nill
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        _sessionManager.responseSerializer =  response;

        //根据服务器请求的配置
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [_sessionManager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"accept"];
        _sessionManager.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    }
//    [self resetHeader];
    return _sessionManager;
}

- (void)resetHeader {
    //重置请求头
    [_sessionManager.requestSerializer setValue:_options.lon forHTTPHeaderField:@"lon"];
    [_sessionManager.requestSerializer setValue:_options.lat forHTTPHeaderField:@"lat"];
    [_sessionManager.requestSerializer setValue:_options.password forHTTPHeaderField:@"password"];
    [_sessionManager.requestSerializer setValue:_options.appId forHTTPHeaderField:@"appId"];
    [_sessionManager.requestSerializer setValue:_options.AppUserId forHTTPHeaderField:@"AppUserId"];
    [_sessionManager.requestSerializer setValue:_options.version forHTTPHeaderField:@"version"];
    [_sessionManager.requestSerializer setValue:_options.platform forHTTPHeaderField:@"platform"];
    [_sessionManager.requestSerializer setValue:_options.locationID forHTTPHeaderField:@"locationId"];
    [_sessionManager.requestSerializer setValue:_options.locationName forHTTPHeaderField:@"locationName"];
    [_sessionManager.requestSerializer setValue:_options.token forHTTPHeaderField:@"token"];
}

- (AFURLSessionManager *)downLoadManager{
    if (!_downLoadManager) {
        //默认配置
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        //AFN3.0+基于封住URLSession的句柄
        _downLoadManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return _downLoadManager;
}

- (NSURLSessionDataTask *)POSTFile:(NSString *)URLString args:(NSDictionary *)args files:(NSArray *)files fileArg:(NSString *)fileArg constructingBodyWithBlock:(void(^)(id<AFMultipartFormData>  _Nonnull formData))constructingBodyWithBlock progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject))success failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
    // 处理host
    NSString *url;
    
    if (![URLString containsString:self.host]) {
        if ([[URLString substringToIndex:1] isEqualToString:@"/"]) {
            url = [NSString stringWithFormat:@"%@%@",self.host,URLString];
        } else {
            url = [NSString stringWithFormat:@"%@/%@",self.host,URLString];
        }
        
    } else {
        url = URLString;
    }
    
    NSLog(@"\n<<-----------请求-------------------\n Url == %@\n files == %@\n-------------------------------\n fileArgs == %@\n------------------------------->>", url,files ,fileArg);
    
    return [self.sessionManager POST:url parameters:args constructingBodyWithBlock:constructingBodyWithBlock progress:progress success:success failure:failure];
}

+ (void) initApiHost:(NSString *)apiHost httpsApiHost:(NSString *)httpsApiHost shareHost:(NSString *)shareHost shareHttpsHost:(NSString *)shareHttpsHost imageHost:(NSString *)imageHost videoHost:(NSString *)videoHost{
    YYBCUtilsNetwork *network = [YYBCUtilsNetwork sharedYYBCUtilsNetwork];
//    network.host = @"http://47.97.175.119:28080/qianYuWeiKe";
//    network.httpsHost = @"https://zjyuyue.com/qianYuWeiKe";
    //判断域名后边有没有/
    NSString *apiHostTemp = [apiHost substringFromIndex:apiHost.length-1];
    if ([apiHostTemp isEqualToString:@"/"]) {
        apiHostTemp = [apiHost substringToIndex:apiHost.length-1];
    }
    NSString *apiHttpsHostTemp = [httpsApiHost substringFromIndex:httpsApiHost.length-1];
    if ([apiHttpsHostTemp isEqualToString:@"/"]) {
        apiHttpsHostTemp = [httpsApiHost substringToIndex:httpsApiHost.length-1];
    }
    
    network.host = apiHostTemp;
    network.httpsHost = apiHttpsHostTemp;
    network.shareHost = shareHost;
    network.shareHttpsHost = shareHttpsHost;
    network.imageHost = imageHost;
    network.videoHost = videoHost;
    
    /** 测试时候临时赋值 */
//    network.host = @"http://47.97.175.119:38080/qianYuWeiKe";//外网测试服
    //network.host = @"http://192.168.0.122:8080/qianYuWeiKe";//内网测试服
    //network.host = @"http://192.168.0.113:8080/qianYuWeiKe";//甘贤胜ip
//    network.httpsHost = @"";
//    network.shareHost = @"";
//    network.shareHttpsHost = @"";
//    network.imageHost = @"http://file.ttyouni.com/image/";//图片服务器
//    network.videoHost = @"http://zjyuyue-package.oss-cn-shanghai.aliyuncs.com/";//视频服务器
    
    //初始化4g提醒方法
    [self init4GRemindMethod];
}

+ (NSString *)customAppendImgUrl:(NSString *)imageUrl{
    YYBCUtilsNetwork *network = [YYBCUtilsNetwork sharedYYBCUtilsNetwork];
    if ([imageUrl containsString:@"http://"] || [imageUrl containsString:@"https://"]) {
        return imageUrl;
    }
    return [NSString stringWithFormat:@"%@%@",network.imageHost,imageUrl];
}

+ (NSURL *)getImgUrlCustomAppend:(NSString *)imageUrl{
    return [NSURL URLWithString:[self customAppendImgUrl:imageUrl]];
}

#pragma mark - 网络请求转圈方法
+ (void)showLoading:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mkjz"]];
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 4;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount =ULLONG_MAX;
    [gifImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    hud.customView = gifImageView;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    [view bringSubviewToFront:hud];
}

#pragma mark - 取消网络请求转圈方法
+ (void)hideLoading:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

#pragma mark - 网络请求完毕加载请求的转圈方法
+ (void)showFinishLoading:(UIView *)view{
    [self showLoading:view];
}
#pragma mark - 取消网络请求加载完毕请求转圈方法
+ (void)hideFinishLoading:(UIView *)view{
    [self hideLoading:view];
}


//4g提醒
+ (void)init4GRemindMethod{
    [[NSUserDefaults standardUserDefaults] setObject:@1 forKey:YYBCUtilsNeed4GRemind];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//检测4g并提示方法
+ (void)check4GRemindMethod{
    [ReachabilityManager internetStatus:^(NetworkStatus internetStatus) {
        if (internetStatus == ReachableViaWWAN) {
            //4G
            
            //判断是否是需要提示
            NSNumber *numNeed4GRemind = [[NSUserDefaults standardUserDefaults] objectForKey:YYBCUtilsNeed4GRemind];
            if (numNeed4GRemind.integerValue) {
                //需要提示
//                [[UIApplication sharedApplication].keyWindow makeToas:@"手机当前处于4G网络，请注意手机流量"];
                [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:YYBCUtilsNeed4GRemind];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
        }
    }];
}
@end

















