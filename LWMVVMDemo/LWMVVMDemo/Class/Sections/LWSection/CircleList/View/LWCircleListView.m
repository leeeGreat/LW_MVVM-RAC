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



#pragma mark lazyLoad
- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor blueColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableHeaderView = self.listHeaderView;
        [_mainTableView registerClass:[LWCircleListTableCell class] forCellReuseIdentifier:NSStringFromClass([LWCircleListTableCell class])];
        
        //设置mj_header  mj_footer
        @weakify(self);
        _mainTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
            @strongify(self);
            [self.viewModel.refreshDataCommand execute:nil];
        }];
        _mainTableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
            @strongify(self);
            [self.viewModel.nextPageCommand execute:nil];
        }];
    }
    return _mainTableView;
}

- (LWCircleListHeaderView *)listHeaderView
{
    if (!_listHeaderView) {
        _listHeaderView = [[LWCircleListHeaderView alloc] initWithViewModel:self.viewModel.listHeaderViewModel];
    }
    return _listHeaderView;
}


#pragma mark delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
//    cell.textLabel.text = @"ahahh";
//    dequeueReusableCellWithIdentifier:forIndexPath:    会调用register class】
    LWCircleListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LWCircleListTableCell class]) forIndexPath:indexPath];
    if (indexPath.row<self.viewModel.dataArray.count) {
        cell.viewModel = self.viewModel.dataArray[indexPath.row];
    }
    return cell;
}
@end
