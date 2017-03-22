//
//  LWCircleListHeaderView.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//
#import "LWCircleListCollectionCell.h"
#import "LWCircleListHeaderView.h"
@interface LWCircleListHeaderView()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
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
    //直接传至也行，实际类型没问题，
//    return [super initWithViewModel:viewModel];
    self.viewModel = (LWCircleListHeaderViewModel *)viewModel;
    return [super initWithViewModel:self.viewModel];
}

- (void)lw_setUpViews
{
    [self addSubview:self.bgView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.collectionView];
    
    [self updateConstraintsIfNeeded];
    [self setNeedsUpdateConstraints];
}
//初始化collectionView
- (void)updateConstraints
{
    WS(weakSelf);
    CGFloat paddingEdge = 10;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
    }];
   
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(paddingEdge);
        make.top.equalTo(paddingEdge);
        make.right.equalTo(-paddingEdge);
        make.height.equalTo(20);
    }];

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(weakSelf);
        //这两个啥意思？
        make.bottom.equalTo(weakSelf).offset(-paddingEdge);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(paddingEdge);
    }];

    [super updateConstraints];
}

#pragma lazyLoad
- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = white_color;
    }
    
    return _bgView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = MAIN_BLACK_TEXT_COLOR;
        _titleLabel.font = SYSTEMFONT(15);
    }
    
    return _titleLabel;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = white_color;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[LWCircleListCollectionCell  class] forCellWithReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([LWCircleListCollectionCell class])]];
        
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

#pragma delegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count+1;
}
#pragma flowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}




#pragma datesource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWCircleListCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LWCircleListCollectionCell class]) forIndexPath:indexPath];
    if (indexPath.row<self.viewModel.dataArray.count) {
        cell.viewModel = self.viewModel.dataArray[indexPath.row];
    }
    else if(indexPath.row==self.viewModel.dataArray.count)
    {
        cell.type = @"加入新圈子";
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel.cellClickSubject sendNext:nil];
}

@end
