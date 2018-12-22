//
//  YYBCUtilsImgGet.m
//  AFNetworking
//
//  Created by yuYue on 2018/9/13.
//

#import "QYWKUtilsConfiger.h"

@implementation QYWKUtilsConfiger
+ (UIImage *)getBundleImgWithName:(NSString *)name{
    UIImage *ret = nil;
    
   ret = [UIImage imageNamed:name inBundle:YYBCUtilsBundle compatibleWithTraitCollection:nil];
    
    return ret;
}
@end
