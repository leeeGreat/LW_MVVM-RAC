//
//  LWView.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWView.h"

@implementation LWView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self lw_setUpViews];
        [self lw_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id<LWViewModelProtocol>)viewModel
{
    self = [super init];
    if (self) {
        [self lw_setUpViews];
        [self lw_bindViewModel];
    }
    return self;
}

- (void)lw_setUpViews
{
    
}

- (void)lw_bindViewModel
{
    
}

- (void)lw_addRetureKeyBoard
{
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] init];
    tapG.numberOfTapsRequired = 1;
    tapG.numberOfTouchesRequired = 1;
    //绑定事件
    [tapG.rac_gestureSignal subscribeNext:^(id x) {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tapG];
}
@end
