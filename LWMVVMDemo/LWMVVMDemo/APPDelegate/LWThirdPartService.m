//
//  LWThirdPartService.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWThirdPartService.h"
@implementation LWThirdPartService
+ (void)load
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });
    
}
#pragma 初始化coreData
+ (void)initCoreData
{
    
    NSLog(@"initCoredata");
}
#pragma 键盘回收相关    还有遮挡键盘，单例可以拿来用
+ (void)Is_setKeyBoard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;

    NSLog(@"Is_setKeyBoard");
    
}
# pragma 检测网络相关
+ (void)Is_testReachableStatus
{
    NSLog(@"Is_testReachableStatus");
}
@end
