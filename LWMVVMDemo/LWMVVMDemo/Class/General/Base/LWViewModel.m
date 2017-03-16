//
//  LWViewModel.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//
#import "CMRequest.h"
#import "LWViewModel.h"

@implementation LWViewModel
//delegate方法的实现
@synthesize request = _request;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    //传的子类时，viewModel类型是子类，下面调用子类的initialize方法
    LWViewModel *viewModel = [super allocWithZone:zone];
    if (viewModel) {
        [viewModel lw_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model
{
    self = [super init];
    if (self) {
        ///
    }
    return self;
}
#pragma 代理方法实现
- (CMRequest *)request
{
    if (!_request) {
        _request = [CMRequest request];
    }
    return _request;
}

- (void)lw_initialize
{
    NSLog(@"lw_initialize");
}
@end
