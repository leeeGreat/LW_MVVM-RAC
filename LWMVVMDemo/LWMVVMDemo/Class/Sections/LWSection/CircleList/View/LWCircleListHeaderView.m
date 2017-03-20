//
//  LWCircleListHeaderView.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//
#import "LWCircleListCollectionCell.h"
#import "LWCircleListHeaderView.h"
@interface LWCircleListHeaderView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
//这个不能懒加载而是 别处传过来的
@property (nonatomic,strong) LWCircleListHeaderViewModel *viewModel;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation LWCircleListHeaderView

- (void)lw_bindViewModel
{
    @weakify(self);
    [[self.viewModel.refreshUISubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        @strongify(self);
        [self.collectionView reloadData];
    }];
    //将self.viewModel.title的改变赋值给self.titleLabel.text
    RAC(self.titleLabel,text) = [[RACObserve(self, viewModel.title) distinctUntilChanged] takeUntil:self.rac_willDeallocSignal];
    
}

- (instancetype)initWithViewModel:(id<LWViewModelProtocol>)viewModel
{
    self.viewModel = (LWCircleListHeaderViewModel *)viewModel;
    return [super initWithViewModel:self.viewModel];
}

- (void)lw_setUpViews
{
    
}
//初始化collectionView
//- (void)updateConstraints
//{
//    WS(weakSelf);
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(weakSelf);
//        make.bottom.equalTo(weakSelf);
//    }];
//   
//}


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = white_color;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        //        [_collectionView registerClass:[UICollectionViewCell  class] forCellWithReuseIdentifier:NSStringFromClass([LWCollectionViewCell class])];
        [_collectionView registerClass:[UICollectionViewCell  class] forCellWithReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([LWCollectionViewCell class])]];
        
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _flowLayout;
}


@end
