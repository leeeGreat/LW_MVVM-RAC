//
//  LWCircleListCollectionCell.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//
#import "LWCircleListColectionCellViewModel.h"
#import "LWCircleListCollectionCell.h"
@interface LWCircleListCollectionCell ()

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@end
@implementation LWCircleListCollectionCell

//重写父method
- (void)lw_setupViews
{
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.headerImageView];
    
    [self updateConstraintsIfNeeded];
    [self setNeedsUpdateConstraints];
}

//加载完xib到此 ,相当于代码级的autoLayout
- (void)updateConstraints
{
    WS(weakSelf);
    CGFloat paddingEdge = 5;
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.contentView);
        make.height.equalTo(80);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //左右和上面一致    高度是15  y值是imageView的最下面开始
#warning bug   nameLabel的最上面是  headerImageView的最新面偏移10
        make.top.equalTo(weakSelf.headerImageView.mas_bottom).offset(paddingEdge);
        make.left.right.equalTo(weakSelf.headerImageView);
        make.height.equalTo(15);
    }];
    
    return [super updateConstraints];
}


- (void)setViewModel:(LWCircleListColectionCellViewModel *)viewModel
{
    if (!viewModel) {
        return;
    }
    _viewModel = viewModel;
    
    [self.headerImageView sd_setImageWithURL:URL(viewModel.headerImageStr) placeholderImage:ImageNamed(@"yc_circle_placeHolder.png")];
    self.nameLabel.text = viewModel.name;
    NSLog(@"self.nameLabel.text--%@",self.nameLabel.text);
}
- (void)setType:(NSString *)type
{
    self.headerImageView.image = ImageNamed(@"circle_plus.png");
    self.nameLabel.text = @"加入新圈子";
}

#pragma mark - lazyLoad
- (UIImageView *)headerImageView {
    
    if (!_headerImageView) {
        
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.backgroundColor = [UIColor grayColor];
    }
    
    return _headerImageView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = SYSTEMFONT(12);
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _nameLabel;
}

@end
