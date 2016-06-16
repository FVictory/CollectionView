//
//  UserModel.h
//  atrustpay
//
//  Created by 范胜利 on 15/9/18.
//  Copyright © 2015年 itazk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property(nonatomic,assign)BOOL hasLogin;
/**
 用户ID
 */
@property(nonatomic,copy)NSString *userId;

/**
 根据isShow 来判断出现手势密码界面还是登录界面
 */
@property(nonatomic,assign)BOOL isShow;

+(instancetype)sharedModel;

+(void)freeUserData;

@end
