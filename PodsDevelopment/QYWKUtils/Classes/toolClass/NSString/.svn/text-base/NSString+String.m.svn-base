//
//  NSString+String.m
//  EasyGo
//
//  Created by 徐佳琦 on 16/4/19.
//  Copyright © 2016年 Ju. All rights reserved.
//

#import "NSString+String.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"

#define DefoultWebImageWidth 320
#define DefoultWebImageHeight 200
#define kWan 10000
#define kShiWan (10000*10)
#define kBaiWan (10000*100)
#define kQianWan (10000*1000)
#define kYi (10000*10000)
#define kShiYi (10000*10000*10)



@implementation NSString (String)

+ (BOOL)isNull:(id)obj
{
    BOOL result = NO;
    
    if ([obj isEqual:[NSNull null]] || obj == nil) {
        return YES;
    }
    
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)obj;
        if (!string || [string isEqualToString:@""] || 0 == string.length) {
            result = YES;
        } else if ([string isEqualToString:@"null"]) {
            result = YES;
        }
    }
    
    return result;
}


//获取当前系统时间的时间戳
#pragma mark - 获取当前时间的 时间戳

+(long long)getNowTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间
    
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    
    //时间转时间戳的方法:
    
    long long timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    
    return timeSp;
    
}

//将某个时间转化成 时间戳
#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    return timeSp;
    
}

//将某个时间戳转化成 时间

#pragma mark - 将某个时间戳转化成 时间

+(NSString *)timestampSwitchTime:(long long)timestamp andFormatter:(NSString *)format{
    
    format = [NSString isNull:format] ? @"YYYY-MM-dd HH:mm:ss" : format;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    if (timestamp >= 1000000000000) {
        timestamp = timestamp/1000;
    }
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSLog(@"1296035591  = %@",confromTimesp);
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    //NSLog(@"&&&&&&&confromTimespStr = : %@",confromTimespStr);
    return confromTimespStr;
    
}

//球文本宽高
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize

{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize size = [str boundingRectWithSize:maxSize
                                    options:NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                 attributes:dict
                                    context:nil].size;
    
    return size;
}


#pragma mark - 根据图片url获取图片尺寸
//  获取PNG图片的大小
+(CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取gif图片的大小
+(CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取jpg图片的大小
+(CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}
//根据数字返回点赞等字串
+ (NSString *)getCountStrWithCount:(NSUInteger)count{
    NSString *str = nil;
    if (count < 10000) {
        str = [NSString stringWithFormat:@"%ld",count];
    }else if (count < 100000000){
       CGFloat countUse = count/10000.0;
        str = [NSString stringWithFormat:@"%.1fw",countUse];
    }else{
        //一亿以上
        CGFloat countUse = count/10000.0;
        str = [NSString stringWithFormat:@"%.1fw",countUse];
    }
        
    return str;
}


/**根据性别字段 返回性别图片*/
+ (NSString *)getImageStrWithSex:(NSString *)sex{
    NSString *imageStr = @"";
    if (sex.integerValue == 1) {
        imageStr = @"nan";
    }else if (sex.integerValue == 2){
        imageStr = @"nv";
    }
    return imageStr;
}

+ (NSString *)getVideoTimeLength:(NSUInteger)timeLength{
    NSString *str = @"00:00";
    
    NSString *mStr = @"00:";
    
    NSUInteger sTime = timeLength/1000.0;
    NSUInteger mTime = sTime/60.0;
    if (mTime >= 10) {
        mStr = [NSString stringWithFormat:@"%ld:",mTime];
    }else{
        mStr = [NSString stringWithFormat:@"0%ld:",mTime];
    }
    
    NSString *sUseTime = @"00";
    NSUInteger sUse = sTime%60;
    if (sUse <= 9) {
        sUseTime = [NSString stringWithFormat:@"0%ld",sUse];
    }else{
        sUseTime = [NSString stringWithFormat:@"%ld",sUse];
    }
    
    str = [NSString stringWithFormat:@"%@%@",mStr,sUseTime];
    return str;
}


+ (NSString *)imageUrlStringWith:(NSString *)string size:(CGSize)size {
 
    NSString *imageS = [[string componentsSeparatedByString:@"?"] firstObject];
    return [NSString stringWithFormat:@"%@?imageView2/2/w/%.0f",imageS,size.width * 2.0];
}


#pragma mark /-----------------  限制输入  --------------------/
//用于限制UITextView的输入中英文限制
+(void)limitIncludeChineseTextView:(UITextView *)textview Length:(NSUInteger)maxLength
{
    NSString *toBeString = textview.text;
    
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textview markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textview positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            
            if (toBeString.length > maxLength) {
                
                textview.text = [toBeString substringToIndex:maxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        
        if (toBeString.length > maxLength) {
            textview.text = [toBeString substringToIndex:maxLength];
        }
    }
}

//限制UITextView输入的长度，不包括汉字
+ (void)limitTextView:(UITextView *)textview Length:(NSUInteger)maxLength
{
    NSString *toBeString = textview.text;
    if (toBeString.length > maxLength) {
        textview.text = [toBeString substringToIndex:maxLength];
    }
    
}

+(void)limitIncludeChineseTextField:(UITextField *)textField Length:(NSUInteger)maxLength
{
    NSString *toBeString = textField.text;
    
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            
            if (toBeString.length > maxLength) {
                
                textField.text = [toBeString substringToIndex:maxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        
        if (toBeString.length > maxLength) {
            textField.text = [toBeString substringToIndex:maxLength];
        }
    }
}


//限制UITextField输入的长度，不包括汉字
+ (void)limitTextField:(UITextField *)textField Length:(NSUInteger)maxLength
{
    NSString *toBeString = textField.text;
    
    if (toBeString.length > maxLength) {
        textField.text = [toBeString substringToIndex:maxLength];
    }
    
}

//验证手机号的合法性(通用)
+ (BOOL)phoneNumIsOK:(NSString *)str{
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch)
    {
        return NO;
    }
    
    return YES;
}

//验证密码的合法性(密码位数是 6-20)
+ (BOOL)passwordIsOK:(NSString *)str{
    BOOL isOK = YES;
    
    if (str.length >= 6 && str.length <= 20) {
        
    }else{
        isOK = NO;
    }
    
    return isOK;
}

//验证验证码的合法性(验证码位数没有规定，只要输入即可)
+ (BOOL)verificationCodeIsOK:(NSString *)str{
    BOOL isOK = YES;
    
    if (str.length != 0) {
        
    }else{
        isOK = NO;
    }
    
    return isOK;
}

//获取app信息
+ (NSString *)getAppInfoWithKey:(NSString *)key{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return  [infoDictionary objectForKey:key];
}

//获取SDImage缓存大小
+ (NSString *)getSDImageCacheSize{
    NSUInteger imageSize = [[SDImageCache sharedImageCache] getSize];
    CGFloat imageSizeMB = imageSize/1024.0/1024.0;
    NSString *strCache = [NSString stringWithFormat:@"%.2fMB",imageSizeMB];
    return strCache;
}

//清除缓存图片
+ (void)clearSDImageCache{
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    [[SDWebImageManager sharedManager].imageCache clearDiskOnCompletion:nil];
}

//富文本设置文字颜色字体
+ (NSMutableAttributedString *)ls_changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
        for (NSString *rangeStr in subArray) {
                NSRange range = [totalString rangeOfString:rangeStr options:NSBackwardsSearch];
                [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
                [attributedStr addAttribute:NSFontAttributeName value:font range:range];
        }
        return attributedStr;
}

+ (NSString*)DataTOjsonString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil||[jsonString length] == 0) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        NSLog(@"解析数据=%@",jsonString);
        return nil;
        
    }
    
    return dic;
    
}


/**
 获得未读消息个数（格式化后）

 @param count 原始个数数字
 @return 格式化的数字字串
 */
+ (NSString *)unreadCount:(NSInteger)count{
    NSString *unCount = @"0";
    
    if (count > 99) {
        unCount = @"···";
    }else{
        unCount = [NSString stringWithFormat:@"%ld",count];
    }
    
    return unCount;
}


/**
 获取当前日期

 @param format 自定义日期格式
 @return 返回当前日期字串
 */
+ (NSString *)getCurDateWithFormat:(NSString *)format{
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:format];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    return dateStr;
}


/**
 判断字串是否是整数字串

 @param str 输入的字串
 @return 返回是否是整数
 */
+ (BOOL)stringIsIntNumber:(NSString *)str{
    BOOL ret = NO;
    
    NSScanner* scan = [NSScanner scannerWithString:str];
    int val;
    ret = [scan scanInt:&val] && [scan isAtEnd];
    
    return ret;
}


/**
 设置行距方法

 @param lineSpeacing 行距值
 @param label lab
 @param str   string
 @return 返回富文本字串
 */
+ (NSAttributedString *)setLineSpeacing:(CGFloat)lineSpeacing lab:(UILabel *)label str:(NSString *)str{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = lineSpeacing - (label.font.lineHeight - label.font.pointSize);
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    return [[NSAttributedString alloc] initWithString:str attributes:attributes];
}


+ (NSString *)getWanStrWithCount:(NSNumber *)count{
    NSString *ret = count.stringValue;
    
    if (count.longLongValue > 9999) {
       float result = count.longLongValue/10000.0;
       ret = [NSString stringWithFormat:@"%.2f万",result];
    }
    
    return ret;
}

+ (NSString *)removeSpaceWithOldStr:(NSString *)oldStr{
    NSString *str = nil;
    
    str = [oldStr stringByReplacingOccurrencesOfString:@" "withString:@""];
    
    str = [oldStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return str;
}

- (NSString *)strNumAddOne{
    NSString *str = nil;
    
    NSInteger count = self.integerValue;
    count++;
    str = [NSString stringWithFormat:@"%ld",count];
    return str;
}

- (NSNumber *)toIntergerNumber{
    NSNumber *num = nil;
    
    NSInteger count = self.integerValue;
    num = [NSNumber numberWithInteger:count];
    
    return num;
}

- (NSNumber *)toLongLongNumber{
    NSNumber *num = nil;
    
    long long count = self.longLongValue;
    num = [NSNumber numberWithLongLong:count];
    
    return num;
}

+ (BOOL)IsIdentityCard:(NSString *)IDCardNumber
{
    BOOL flag;
    
    if (IDCardNumber.length <= 0) {
        
        flag = NO;
        
        return flag;
        
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:IDCardNumber];
}
@end












