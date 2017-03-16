//
//  LWCircleListViewModel.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWCircleListViewModel.h"
#import "LWCircleListColectionCellViewModel.h"
@interface LWCircleListViewModel()
@property (nonatomic,assign) NSUInteger currentPage;

@end

@implementation LWCircleListViewModel
- (void)lw_initialize
{
    @weakify(self)
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self)
        
        NSMutableArray *alArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<8; i++) {
            LWCircleListColectionCellViewModel *viewModel = [[LWCircleListColectionCellViewModel alloc] init];
            viewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            viewModel.name = @"财税培训圈子";
            [alArray addObject:viewModel];

        }
        self.listHeaderViewModel.dataArray = alArray;
    }];
}

@end
