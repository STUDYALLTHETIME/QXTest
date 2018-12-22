//
//  NSString+String.h
//  EasyGo
//
//  Created by 徐佳琦 on 16/4/19.
//  Copyright © 2016年 Ju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (String)
+ (BOOL)isNull:(NSString *)string;

//获取当前系统时间的时间戳
+(long long)getNowTimestamp;
//将某个时间转化成 时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
//将某个时间戳转化成 时间
+(NSString *)timestampSwitchTime:(long long)timestamp andFormatter:(NSString *)format;

//求文本宽高
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

/**根据整形数字返回点赞等字串*/
+ (NSString *)getCountStrWithCount:(NSUInteger)count;

/**根据性别字段 返回性别图片*/
+ (NSString *)getImageStrWithSex:(NSString *)sex;


/**
 根据ms级时长返回对应时长字串

 @param timeLength 毫秒级时长
 @return 视频时长字串
 */
+ (NSString *)getVideoTimeLength:(NSUInteger)timeLength;

+ (NSString *)imageUrlStringWith:(NSString *)string size:(CGSize)size;


//限制UITextView输入的长度，包括汉字
+(void)limitIncludeChineseTextView:(UITextView *)textview Length:(NSUInteger)maxLength;

//限制UITextView输入的长度，不包括汉字
+(void)limitTextView:(UITextView *)textview Length:(NSUInteger)maxLength;

//限制UITextField输入的长度，包括汉字
+(void)limitIncludeChineseTextField:(UITextField *)textField Length:(NSUInteger)maxLength;

//限制UITextField输入的长度，不包括汉字
+(void)limitTextField:(UITextField *)textField Length:(NSUInteger)maxLength;


/**
 验证手机号的合法性(通用)

 @param str 手机号码字符串
 @return bool值（YES代表合法）
 */
+ (BOOL)phoneNumIsOK:(NSString *)str;

/**
 验证密码的合法性(密码位数是 6-20)

 @param str 密码字符串
 @return bool值（YES代表合法）
 */
+ (BOOL)passwordIsOK:(NSString *)str;


/**
 验证验证码的合法性(验证码位数没有规定，只要输入即可)

 @param str 验证码字符串
 @return bool值（YES代表合法）
 */
+ (BOOL)verificationCodeIsOK:(NSString *)str;


/**
 获取app信息

 @param key APP信息key
 @return 返回需要的app信息字符串
 */
+ (NSString *)getAppInfoWithKey:(NSString *)key;


/**
 获取SDImage缓存大小

 @return 缓存大小字串
 */
+ (NSString *)getSDImageCacheSize;


/**
 清除缓存图片
 */
+ (void)clearSDImageCache;

//富文本设置文字颜色字体
+ (NSMutableAttributedString *)ls_changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray;


/**
 字串变成json字串

 @param object 字串
 @return json字串
 */
+ (NSString*)DataTOjsonString:(id)object;


/**
 jsonString变为dictionary

 @param jsonString jsonStr
 @return dict
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 获得未读消息个数（格式化后）
 
 @param count 原始个数数字
 @return 格式化的数字字串
 */
+ (NSString *)unreadCount:(NSInteger)count;

/**
 获取当前日期
 
 @param format 自定义日期格式
 @return 返回当前日期字串
 */
+ (NSString *)getCurDateWithFormat:(NSString *)format;

/**
 判断字串是否是整数字串
 
 @param str 输入的字串
 @return 返回是否是整数
 */
+ (BOOL)stringIsIntNumber:(NSString *)str;

 /**
 设置行距方法
 
 @param lineSpeacing 行距值
 @param label lab
 @param str   string
 @return 返回富文本字串
 */
+ (NSAttributedString *)setLineSpeacing:(CGFloat)lineSpeacing lab:(UILabel *)label str:(NSString *)str;


/**
 根据数字获得万位字串

 @param count numer类型数字
 @return 字串
 */
+ (NSString *)getWanStrWithCount:(NSNumber *)count;


/**
 移除空格返回字串

 @param oldStr 原始字串
 @return 移除空格后的字串
 */
+ (NSString *)removeSpaceWithOldStr:(NSString *)oldStr;


/**
 字串数字加1

 @return 返回数字加1的字串
 */
- (NSString *)strNumAddOne;


/**
 将整形字串转换成num类型

 @return 返回转换后的num类型
 */
- (NSNumber *)toIntergerNumber;


/**
 将long long字串转换成num类型

 @return num
 */
- (NSNumber *)toLongLongNumber;

/**
 身份证正则

 @param IDCardNumber 身份证号码
 @return 是否是身份证号
 */
+ (BOOL)IsIdentityCard:(NSString *)IDCardNumber;
@end















