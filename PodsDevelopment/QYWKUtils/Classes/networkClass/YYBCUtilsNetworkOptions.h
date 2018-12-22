//
//  NetworkOptions.h
//
//  Created by 百顺 on 2018/3/20.
//  Copyright © 2018年 百顺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Instance.h"

@interface YYBCUtilsNetworkOptions : NSObject

/** appId */
@property (strong, nonatomic) NSString *appId;

/** 用户id */
@property (strong, nonatomic) NSString *AppUserId;

/** 经度 */
@property (strong, nonatomic) NSString *lat;

/** 纬度 */
@property (strong, nonatomic) NSString *lon;

/** 密码 */
@property (strong, nonatomic) NSString *password;

/** 版本号 */
@property (strong, nonatomic) NSString *version;

/** 定位id */
@property (strong, nonatomic) NSString *locationID;

/** 定位名称 */
@property (strong, nonatomic) NSString *locationName;

/** 平台信息 */
@property (strong, nonatomic) NSString *platform;

/**token*/
@property (strong, nonatomic) NSString *token;

/** 昵称 */
@property (strong, nonatomic) NSString *nickname;

/** 头像*/
@property (strong, nonatomic) NSString *icon;

INSTANCEH(YYBCUtilsNetworkOptions);

@end








