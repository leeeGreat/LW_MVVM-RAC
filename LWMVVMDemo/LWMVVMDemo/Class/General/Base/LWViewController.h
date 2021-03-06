//
//  LWViewController.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWViewControllerProtocol.h"
@interface LWViewController : UIViewController<LWViewControllerProtocol>

/*
 * view是否渗透导航栏    YES渗透   NO不渗透
 */
@property (nonatomic,assign)BOOL isExtendLayout;
/**
 * 功能：设置修改StatusBar
 * 参数：（1）StatusBar样式：statusBarStyle
 *      （2）是否隐藏StatusBar：statusBarHidden
 *      （3）是否动画过渡：animated
 */
- (void)changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle statusBarHidden:(BOOL)statusBarHidden changeStatusBarAnimated:(BOOL)animated;
/*
 *   隐藏显示导航栏
    参数：（1）是否隐藏导航栏 ： isHide
                （2）是否有过度动画：animated
 */
-(void)hideNavigationBar:(BOOL)isHide
                animated:(BOOL)animated;

/**
 * 功能： 布局导航栏界面
 * 参数：（1）导航栏背景：backGroundImage
 *      （2）导航栏标题颜色：titleColor
 *      （3）导航栏标题字体：titleFont
 *      （4）导航栏左侧按钮：leftItem
 *      （5）导航栏右侧按钮：rightItem
 */
- (void)layoutNavigationBar:(UIImage *)backgroudImage titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont leftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem rightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;


@end
