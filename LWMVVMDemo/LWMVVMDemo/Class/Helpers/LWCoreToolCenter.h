//
//  LWCoreToolCenter.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWCoreToolCenter : NSObject


extern void ShowSuccessStatus(NSString *status);
extern void ShowErrorStatus(NSString *status);
extern void ShowMaskStatus(NSString *status);
extern void ShowMessage(NSString *status);
extern void ShowProgress(CGFloat progress);
extern void DissmissHud(void);

@end
