//
//  AutoPermission.m
//
//  Created by apple on 2018/1/29.
//

#define SystemVersion [UIDevice currentDevice].systemVersion.doubleValue

#import "AutoPermission.h"
#import <Photos/Photos.h>

@implementation AutoPermission

+ (void)cameraAutoPermission:(void(^)(BOOL success))block {
    if ([AVCaptureDevice respondsToSelector:@selector(requestAccessForMediaType:completionHandler:)]) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    block(YES);
                } else {
                    [self goSetWithTitle:@"为了更方便的使用上传头像功能，我希望您能开启相机的使用权限"];
                    block(NO);
                }
            });
        }];
    } else {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            [self goSetWithTitle:@"为了更方便的使用上传头像功能，我希望您能开启相机的使用权限"];
            block(NO);
        } else {
            block(YES);
        }
    }
}

+ (void)photoAutoPermission:(void(^)(BOOL success))block {
    if ([PHPhotoLibrary respondsToSelector:@selector(requestAuthorization:)]) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if(status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
                    [self goSetWithTitle:@"为了更方便的使用上传头像功能，我希望您能开启相册的使用权限"];
                    block(NO);
                } else {
                    block(YES);
                }
            });
        }];
    } else {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if(status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
            [self goSetWithTitle:@"为了更方便的使用上传头像功能，我希望您能开启相册的使用权限"];
            block(NO);
        } else {
            block(YES);
        }
    }
}

+ (void)microPhoneAutoPermission:(void(^)(BOOL success))block {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
        [audioSession requestRecordPermission:^(BOOL granted) {
            if (granted) {
                block(YES);
            } else {
                [self goSetWithTitle:@"为了更方便的使用语音输入功能，我希望您能开启麦克风的使用权限"];
                block(NO);
            }
        }];
    } else {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
        if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
            [self goSetWithTitle:@"为了更方便的使用语音输入功能，我希望您能开启麦克风的使用权限"];
            block(NO);
        } else {
            block(YES);
        }
    }
}

+ (void)goSetWithTitle:(NSString *)title {
//    [[YDAlertView share] showWithTitle:title cancel:^{
//    } confirm:^{
//        UIApplication *application = [UIApplication sharedApplication];
//        NSURL *URL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//        if([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
//            [application openURL:URL options:@{} completionHandler:^(BOOL success) {}];
//        }else{
//            [application openURL:URL];
//        }
//    }];
}

#pragma mark - 相机权限
+ (void)getCameraPermission:(void(^)(BOOL success))block{
    if ([AVCaptureDevice respondsToSelector:@selector(requestAccessForMediaType:completionHandler:)]) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    block(YES);
                } else {
                    block(NO);
                }
            });
        }];
    } else {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            block(NO);
        } else {
            block(YES);
        }
    }
}

#pragma mark - 麦克风权限
+ (void)getMicroPhoneAutoPermission:(void(^)(BOOL success))block {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
        [audioSession requestRecordPermission:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    block(YES);
                } else {
                    block(NO);
                }
            });
        }];
    } else {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
        if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
            block(NO);
        } else {
            block(YES);
        }
    }
}
#pragma mark - 相册权限
+ (void)getPhotoAutoPermission:(void(^)(BOOL success))block {
    if ([PHPhotoLibrary respondsToSelector:@selector(requestAuthorization:)]) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if(status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
                    block(NO);
                } else {
                    block(YES);
                }
            });
        }];
    } else {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if(status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
            block(NO);
        } else {
            block(YES);
        }
    }
}

//进入设置权限方法
+ (void)goToSettingPermission{
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:URL options:@{} completionHandler:^(BOOL success) {}];
    }else{
        [application openURL:URL];
    }
}
@end




