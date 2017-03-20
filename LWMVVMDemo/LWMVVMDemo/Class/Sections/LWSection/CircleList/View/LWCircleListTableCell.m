//
//  LWCircleListTableCell.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWCircleListTableCell.h"
@interface LWCircleListTableCell ()

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *articleImageView;

@property (nonatomic, strong) UILabel *articleLabel;

@property (nonatomic, strong) UIImageView *peopleImageView;

@property (nonatomic, strong) UILabel *peopleNumLabel;


@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation LWCircleListTableCell
#pragma mark 重写父类方法
- (void)lw_setupViews{
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.articleImageView];
    [self.contentView addSubview:self.articleLabel];
    [self.contentView addSubview:self.peopleImageView];
    [self.contentView addSubview:self.peopleNumLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.lineImageView];

    //调用updateConstrains？
    [self updateConstraintsIfNeeded];
    [self setNeedsUpdateConstraints];
}

- (void)lw_bindViewModel{}

- (void)setViewModel:(LWCircleListColectionCellViewModel *)viewModel
{
#warning 到这里了！
    if (!viewModel) {
        return;
    }
    _viewModel = viewModel;
    
    [self.headerImageView sd_setImageWithURL:URL(viewModel.headerImageStr) placeholderImage:ImageNamed(@"yc_circle_placeHolder.png")];
    self.nameLabel.text = viewModel.name;
    self.articleLabel.text = viewModel.articleNum;
    self.peopleNumLabel.text = viewModel.peopleNum;
    self.contentLabel.text = viewModel.content;

}

- (void)updateConstraints
{
    WS(weakSelf);
    CGFloat paddingEdge = 10;
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(paddingEdge);
        make.right.equalTo(-paddingEdge);
        make.center.equalTo(self.contentView.center);
        make.height.equalTo(15);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.headerImageView.mas_right).offset(paddingEdge);
        make.top.equalTo(weakSelf.headerImageView);
        make.right.equalTo(-paddingEdge);
        make.height.equalTo(15);
    }];
    
    [self.articleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.nameLabel);
        make.size.equalTo(CGSizeMake(15, 15));
        make.top.equalTo(weakSelf.nameLabel.mas_bottom).offset(paddingEdge);
    }];
    
    [self.articleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.articleImageView.mas_right).offset(3);
        make.size.equalTo(CGSizeMake(50, 15));
        make.centerY.equalTo(weakSelf.articleImageView);
    }];
    
    [self.peopleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.articleLabel.mas_right).offset(paddingEdge);
        make.size.equalTo(CGSizeMake(15, 15));
        make.centerY.equalTo(weakSelf.articleImageView);
    }];
    
    [self.peopleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.peopleImageView.mas_right).offset(3);
        make.centerY.equalTo(weakSelf.peopleImageView);
        make.size.equalTo(CGSizeMake(50, 15));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.articleImageView.mas_bottom).offset(paddingEdge);
        make.left.equalTo(weakSelf.articleImageView);
        make.right.equalTo(-paddingEdge);
        make.height.equalTo(15);
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.left.right.equalTo(weakSelf.contentView);
        make.height.equalTo(1.0);
    }];

    
    [super updateConstraints];
}



#pragma mark lazyLoad
- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
        
    }
    return _headerImageView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}
- (UIImageView *)articleImageView
{
    if (!_articleImageView) {
        _articleImageView = [[UIImageView alloc] init];
    }
    return _articleImageView;
}

- (UILabel *)articleLabel {
    
    if (!_articleLabel) {
        
        _articleLabel = [[UILabel alloc] init];
        _articleLabel.textColor = MAIN_LINE_COLOR;
        _articleLabel.font = SYSTEMFONT(12);
    }
    
    return _articleLabel;
}

- (UIImageView *)peopleImageView {
    
    if (!_peopleImageView) {
        
        _peopleImageView = [[UIImageView alloc] init];
        _peopleImageView.backgroundColor = red_color;
    }
    
    return _peopleImageView;
}

- (UILabel *)peopleNumLabel {
    
    if (!_peopleNumLabel) {
        
        _peopleNumLabel = [[UILabel alloc] init];
        _peopleNumLabel.textColor = MAIN_LINE_COLOR;
        _peopleNumLabel.font = SYSTEMFONT(12);
    }
    
    return _peopleNumLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = MAIN_BLACK_TEXT_COLOR;
        _contentLabel.font = SYSTEMFONT(14);
    }
    
    return _contentLabel;
}

- (UIImageView *)lineImageView {
    
    if (!_lineImageView) {
        
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = MAIN_LINE_COLOR;
    }
    
    return _lineImageView;
}

@end
