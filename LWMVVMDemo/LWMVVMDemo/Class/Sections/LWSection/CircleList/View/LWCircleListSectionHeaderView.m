//
//  LWCircleListSectionHeaderView.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWCircleListSectionHeaderView.h"
@interface LWCircleListSectionHeaderView()
@property (nonatomic,strong) LWCircleListSectionHeaderViewModel *viewModel;
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation LWCircleListSectionHeaderView

- (instancetype)initWithViewModel:(id<LWViewModelProtocol>)viewModel
{
    self.viewModel = (LWCircleListSectionHeaderViewModel *)viewModel;
    return [super initWithViewModel:self.viewModel];
}

- (void)lw_setUpViews
{
    [self addSubview:self.bgImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineImageView];

    [self updateConstraintsIfNeeded];
    [self setNeedsUpdateConstraints];
}

- (void)lw_bindViewModel
{
//    从self.viweModel.title动态读值
//     RAC(self.titleLabel,text)  ===   RAC(self,titleLabel.text)
    RAC(self,titleLabel.text) = [[RACObserve(self, viewModel.title) distinctUntilChanged] takeUntil:self.rac_willDeallocSignal];
    
}
- (void)updateConstraints
{
    WS(weakSelf);
    CGFloat paddingEdge = 10;
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(paddingEdge);
        make.right.equalTo(-paddingEdge);
        make.height.equalTo(20);
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(weakSelf);
        make.height.equalTo(1.0);
    }];
    
    [super updateConstraints];
}

#pragma mark - lazyLoad
- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = white_color;
    }
    
    return _bgImageView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = SYSTEMFONT(17);
        _titleLabel.textColor = MAIN_BLACK_TEXT_COLOR;
    }
    
    return _titleLabel;
}

- (UIImageView *)lineImageView {
    
    if (!_lineImageView) {
        
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = MAIN_LINE_COLOR;
    }
    
    return _lineImageView;
}

@end
