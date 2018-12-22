//
//  BSUtilsConfiger.h
//  AFNetworking
//
//  Created by yuYue on 2018/11/28.
//

#import <Foundation/Foundation.h>
// 资源文件bundle
#define BSUtilsBundle [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"QYWKUtils" ofType:@"bundle"]] ?: [NSBundle mainBundle]

// 屏幕尺寸
#define KSCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define KSCREENHEIGHT [UIScreen mainScreen].bounds.size.height

//pragma mark /-----------------  设置颜色  --------------------/
#define YYBCUtilsUIColorRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define YYBCUtilsRGB(A,B,C,D) [UIColor colorWithRed:A/255.0f green:B/255.0f blue:C/255.0f alpha:D]


// 屏幕尺寸
#define YYBCUtilsKSCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define YYBCUtilsKSCREENHEIGHT [UIScreen mainScreen].bounds.size.height

// iphonX
#define YYBCUtilsiPhoneX ((YYBCUtilsKSCREENWIDTH == 375.f || YYBCUtilsKSCREENWIDTH == 414.f)  && (YYBCUtilsKSCREENHEIGHT == 812.f || YYBCUtilsKSCREENHEIGHT == 896.f) ? YES : NO)
#define YYBCUtilsNAVHEIGHT (YYBCUtilsiPhoneX ? 88 : 64)
#define YYBCUtilsNAVTOP (YYBCUtilsiPhoneX ? 44 : 20)
#define YYBUtilsBARHEIGH (YYBCUtilsiPhoneX ? 83 : 49)
#define YYBCUtilsiPhoneXBottomSafeFieldHeight (YYBCUtilsiPhoneX ? 34 : 0)

NS_ASSUME_NONNULL_BEGIN

@interface BSUtilsConfiger : NSObject

@end

NS_ASSUME_NONNULL_END
