//
//  BSUtilsBasePresenter.m
//  BSUtils
//
//  Created by yuYue on 2018/11/28.
//

#import "BSMvpUtilsBasePresenter.h"

@implementation BSMvpUtilsBasePresenter

- (instancetype)init{
    self = [super init];
    if (self) {
        self.pageNum = 1;
        self.pageSize = 10;
        self.arrMList = [NSMutableArray array];
    }
    return self;
}

@end
