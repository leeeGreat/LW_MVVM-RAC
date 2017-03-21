//
//  LWCircleListCollectionCell.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWCollectionViewCell.h"
#import "LWCircleListColectionCellViewModel.h"
@interface LWCircleListCollectionCell : LWCollectionViewCell
@property (nonatomic,strong) LWCircleListColectionCellViewModel *viewModel;
/**
 *  加入新圈子
 */
@property (nonatomic, strong) NSString *type;
@end
