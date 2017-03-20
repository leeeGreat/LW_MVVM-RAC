//
//  LWCircleListHeaderViewModel.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWCircleListHeaderViewModel.h"

@implementation LWCircleListHeaderViewModel


//有必要重写吗？@property不就可以了吗
- (RACSubject *)refreshUISubject {
    
    if (!_refreshUISubject) {
        
        _refreshUISubject = [RACSubject subject];
    }
    
    return _refreshUISubject;
}


@end
