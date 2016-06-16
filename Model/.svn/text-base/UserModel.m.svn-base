//
//  UserModel.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/18.
//  Copyright © 2015年 itazk. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+(instancetype)sharedModel{
    
    static id sharedModel;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModel = [[UserModel alloc] init];
    });
    return sharedModel;
}
+ (void)freeUserData{
    
}

@end
