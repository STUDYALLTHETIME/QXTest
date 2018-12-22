//
//  AutoPermission.h
//
//  Created by apple on 2018/1/29.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>


@interface AutoPermission : NSObject

/**
 相机自动权限请求
 */
+ (void)cameraAutoPermission:(void(^)(BOOL success))block;

/**
 麦克风自动权限请求
 */
+ (void)microPhoneAutoPermission:(void(^)(BOOL success))block;

/**
 相册自动权限请求
 */
+ (void)photoAutoPermission:(void(^)(BOOL success))block;



/**
 获得相机权限

 @param block 权限结果block
 */
+ (void)getCameraPermission:(void(^)(BOOL success))block;


/**
 获得麦克风权限

 @param block 权限结果block
 */
+ (void)getMicroPhoneAutoPermission:(void(^)(BOOL success))block;


/**
 获得相册权限

 @param block 权限结果block
 */
+ (void)getPhotoAutoPermission:(void(^)(BOOL success))block;

/**
 进入设置权限方法 
 */
+ (void)goToSettingPermission;
@end
