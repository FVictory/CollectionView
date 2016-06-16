//
//  BaseController.h
//  atrustpay
//
//  Created by 范胜利 on 15/9/9.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

// 设置返回按钮
- (void)setLeftItemToBack;
//提取共有的方法
- (void)backPop;

-(void)toastResult:(NSString *) toastMsg;

@end
