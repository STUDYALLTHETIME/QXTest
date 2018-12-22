//
//  TimerProxy.h
//  auction
//
//  Created by yuYue on 2018/7/20.
//  Copyright © 2018年 羽悦本草. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerProxy : NSProxy
- (instancetype)initWithTarget:(id)target;
@end
