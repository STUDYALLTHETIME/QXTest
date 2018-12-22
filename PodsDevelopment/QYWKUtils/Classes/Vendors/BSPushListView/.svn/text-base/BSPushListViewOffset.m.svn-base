//
//  BSPushListViewOffset.m
//  AFNetworking
//
//  Created by yuYue on 2018/11/14.
//

#import "BSPushListViewOffset.h"
static BSPushListViewOffset *instance;

@implementation BSPushListViewOffset

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
@end
