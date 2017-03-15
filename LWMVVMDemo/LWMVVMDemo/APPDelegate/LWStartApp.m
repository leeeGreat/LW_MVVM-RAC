//
//  LWStartApp.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWStartApp.h"

@implementation LWStartApp
    
+ (void)load
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [[self class] Is_initPersonaleData];
        });
    }
+ (void)Is_initPersonaleData
    {
        NSLog(@"Is_initPersonaleData");
    }
    
    @end
