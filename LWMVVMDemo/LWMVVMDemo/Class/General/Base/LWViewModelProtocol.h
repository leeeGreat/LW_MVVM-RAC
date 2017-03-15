//
//  LWViewModelProtocol.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
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
- (instancetype)

@end
