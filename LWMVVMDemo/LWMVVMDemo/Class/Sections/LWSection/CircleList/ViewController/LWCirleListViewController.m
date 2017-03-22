//
//  LWCirleListViewController.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//
#import "LWSecondViewController.h"
#import "LWCircleListView.h"
#import "LWCircleListViewModel.h"
#import "LWCirleListViewController.h"

@interface LWCirleListViewController ()
@property (nonatomic,strong) LWCircleListView *mainView;
@property (nonatomic,strong) LWCircleListViewModel *viewModel;
@end

@implementation LWCirleListViewController

- (void)lw_bindViewModel
{
    @weakify(self);
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        @strongify(self);
        LWSecondViewController *lwVC = [[LWSecondViewController alloc] init];
        [self.navigationController pushViewController:lwVC animated:YES];
        NSLog(@"didclickedselectrow");
    }];
    NSLog(@"lw_bindViewModel--lwcirclelistviewcontroller");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints
{
    WS(weakSelf)
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.view);
    }];
    
    [super updateViewConstraints];
    //效果一样
//    [self.view updateConstraints];
}

#pragma private methods
- (void)lw_addSubViews
{
    [self.view addSubview:self.mainView];
}




#pragma setter and getter
- (LWCircleListView *)mainView
{
    if (!_mainView) {
        //用LWCircleListViewModel 初始化CircleListView
        _mainView = [[LWCircleListView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}

- (LWCircleListViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[LWCircleListViewModel alloc] init ];
    }
    return _viewModel;
}
@end
