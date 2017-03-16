//
//  LWViewModelProtocol.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LWHeaderRefresh_HasMoreData = 1,
    LWHeaderRefresh_HasNoMoreData,
    LWFooterRefresh_HasMoreData,
    LWFooterRefresh_HasNoMoreData,
    LWRefreshError,
    LWRefreshUI,
} LWRefreshDataStatus;

@protocol LWViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;

@property (strong, nonatomic)CMRequest *request;

/**
 *  初始化
 */
- (void)yd_initialize;

@end
