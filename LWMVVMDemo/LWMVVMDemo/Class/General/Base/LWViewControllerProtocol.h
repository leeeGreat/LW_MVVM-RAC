//
//  LWViewControllerProtocol.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//
#import "LWViewControllerProtocol.h"
@protocol LWViewModelProtocol;
@protocol LWViewControllerProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id<LWViewModelProtocol>)viewModel;

- (void)lw_bindViewModel;
- (void)lw_addSubViews;
- (void)lw_layoutNavgations;
- (void)lw_getNewData;
- (void)lw_recoveryKeyboard;


@end
