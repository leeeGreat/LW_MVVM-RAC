//
//  LWCircleListHeaderViewModel.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWViewModel.h"

@interface LWCircleListHeaderViewModel : LWViewModel
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) RACSubject *refreshUISubject;

@property (nonatomic, strong) RACSubject *cellClickSubject;


@end
