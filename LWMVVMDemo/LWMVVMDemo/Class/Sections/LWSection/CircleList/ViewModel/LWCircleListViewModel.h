//
//  LWCircleListViewModel.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWViewModel.h"
#import "LWCircleListHeaderViewModel.h"
#import "LWCircleListSectionHeaderViewModel.h"
@interface LWCircleListViewModel : LWViewModel
@property (nonatomic,strong) RACSubject *refreshEndSubject;
@property (nonatomic,strong) RACSubject *refreshUI;
@property (nonatomic,strong) RACCommand *refreshDataCommand;
@property (nonatomic,strong) RACCommand *nextPageCommand;
@property (nonatomic, strong) LWCircleListHeaderViewModel *listHeaderViewModel;

@property (nonatomic, strong) LWCircleListSectionHeaderViewModel *sectionHeaderViewModel;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic,strong) RACSubject *cellClickSubject;

@end
