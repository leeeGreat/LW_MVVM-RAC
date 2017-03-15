//
//  APPMacro.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#ifndef APPMacro_h
#define APPMacro_h


/**
 *  本类放app相关的宏定义
 */

//内网
#define REQUEST_URL @"https://www.baidu.com"

// 正式
//#define REQUEST_URL @"http://api.qijiwang.cn/app_v1.0/"

// 首次启动判断
#define CM_FIRST_LAUNCHED @"firstLaunch"

// 动态令牌
#define YC_DYNAMIC_TOKEN_NAME @"yc_dynamic_token"

#define YC_DYNAMIC_TOKEN IF_NULL_TO_STRING(((NSString *)SEEKPLISTTHING(YC_DYNAMIC_TOKEN_NAME)))



#endif /* APPMacro_h */
