//
//  LWCircleListTableCell.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWTableViewCell.h"
#import "LWCircleListColectionCellViewModel.h"
@interface LWCircleListTableCell : LWTableViewCell
//这里省略tableViewCell的数据，用LWCircleListColectionCellView数据代替？这里属性相似？就懒得写了？
@property (nonatomic, strong) LWCircleListColectionCellViewModel *viewModel;
@end
