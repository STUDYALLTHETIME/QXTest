//
//  ViewController.m
//  QXText
//
//  Created by 朱武刚 on 2018/8/11.
//  Copyright © 2018年 zwg. All rights reserved.
//

#import "ViewController.h"
#import "WXPagedImageView.h"

@interface ViewController ()<WXPagedScrollViewDelegate>
@property WXPagedImageView *pagedImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *num = @"你好吗13545657674积分兑换13456789123";
//    NSString *regex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
  
    NSString *regulaStr = @"1\\d{10}";
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:0 error:&error];
    if (regex != nil) {
        //用该方法解析出所有
        NSMutableString *mutableString = [NSMutableString stringWithString:num];
        NSArray *array = [regex matchesInString:mutableString options:NSMatchingReportProgress range:NSMakeRange(0, [mutableString length])];
        //当解析出的数组至少有一个对象时，即原文本中存在至少一个符合规则的字段
        if (array.count != 0) {
            for (NSTextCheckingResult *result in array) {
                //从NSTextCheckingResult类中取出range属性
                NSRange phoneRange = result.range;
                [mutableString replaceCharactersInRange:NSMakeRange(3+phoneRange.location, 4) withString:@"****"];
                NSLog(@"num - %@",mutableString);
//                return
            }
            NSLog(@"string - %@",[NSString stringWithFormat:@"%@",mutableString]);
        }else{
            NSLog(@"4534543543");
//            return num;
        }
    }
    
//    _pagedImageView = [[WXPagedImageView alloc] initWithFrame:CGRectMake(0, 200, 375, 168)];
//    [_pagedImageView setImageURLs:@[@"vip",@"Bitmap",@"banner"]];
//    [self.view addSubview:_pagedImageView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
