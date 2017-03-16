//
//  LWCircleListView.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWCircleListViewModel.h"
#import "LWCircleListHeaderView.h"
#import "LWCircleListSectionHeaderView.h"
#import "LWCircleListTableCell.h"
#import "LWCircleListView.h"
@interface LWCircleListView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) LWCircleListViewModel *viewModel;

@property (strong, nonatomic) UITableView *mainTableView;

@property (strong, nonatomic) LWCircleListHeaderView *listHeaderView;

@property (strong, nonatomic) LWCircleListSectionHeaderView *sectionHeaderView;


@end

@implementation LWCircleListView
//覆盖父类
 - (instancetype)initWithViewModel:(id<LWViewModelProtocol>)viewModel
{
    self.viewModel = (LWCircleListViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (void)updateConstraints
{
    WS(weakSelf)
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [super updateConstraints];
}

#pragma private

- (void)lw_setUpViews
{
    [self addSubview:self.mainTableView];
    //当约束改变时调用，相当于autoLayout
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

//调用viewModel方法，封装逻辑在viewModel里面
- (void)lw_bindViewModel
{
    
}
@end
