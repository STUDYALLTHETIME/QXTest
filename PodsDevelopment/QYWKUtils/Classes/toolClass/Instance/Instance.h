//
//  CircleInstance.h
//  ChildEnd
//
//  Created by zl on 2018/12/22.
//  Copyright © 2018年 readyidu. All rights reserved.
//

#define INSTANCEH(methodName) + (instancetype)shared##methodName

#define INSTANCEM(name,methodName) static name* _instance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
\
+ (instancetype)shared##methodName{\
\
return [[name alloc] init];\
}\
- (instancetype)init{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super init];\
});\
return _instance;\
}\
\
- (instancetype)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
- (instancetype)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}

