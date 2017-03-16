//
//  LWViewProtocol.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWViewModelProtocol.h"
/*
 *  
 
 遵守
 */
@protocol LWViewModelProtocol;
@protocol LWViewProtocol <NSObject>
@optional
- (instancetype)initWithViewModel:(id<LWViewModelProtocol>)viewModel;
//绑定viewmodel
- (void)lw_bindViewModel;
- (void)lw_setUpViews;
- (void)lw_addRetureKeyBoard;

@end
