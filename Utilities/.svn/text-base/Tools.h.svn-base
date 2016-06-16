//
//  Tools.h
//  ZPay
//
//  Created by liao on 14-5-6.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <CFNetwork/CFNetwork.h>
#import <Security/Security.h>

@interface Tools : NSObject{
    CFTimeInterval  lastFrameStartTime;
}
/**
 系统版本
 */
+ (NSString *)getVersion;
/**
 检测网络状态
 */
+(NSString*)getNetworkStatus;
/**
 获取当前设备ip
 */
+(NSString*)getDeviceIp;
/**
 获取运营商
 */
+(NSString*)getCellularProviderName;
/**
 获取当前时间
 */
+(NSString*)getCurrentTime;
/**
 获取UUID
 */
+(NSString*)uuid;
/**
 获取设备型号
 */
+(NSString *)getCurrentDeviceModel;//设备型号
/**
 时间戳
 */
+(NSString*)simulateAndRenderScene;
/**
 根据当前月份获取上月时间戳
 */
+(NSString*)getLastMonth:(NSString*)thisMonth;
/**
 根据时间字符串获取格式化后时间
 */
+(NSString*)getDateStr:(NSString*)dateStr;
+(UIColor *)changeColor:(NSString *)str;
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
+ (UIImage*)createImageWithColor:(UIColor*)color;
+(NSString*)getLastSevenDay:(NSInteger)day;
@end
