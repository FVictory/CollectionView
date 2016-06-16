//
//  Tools.m
//  ZPay
//
//  Created by liao on 14-5-6.
//  Copyright (c) 2014年 . All rights reserved.
//
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import "Tools.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
typedef enum {
    network_type_none= 0,
    network_type_2G = 1,
    network_type_3G = 2,
    network_type_4G = 3,
    network_type_5G = 4,
    network_type_wifi= 5,
}  network_type;
@implementation Tools
/**
 系统版本
 */
+ (NSString*)getVersion{
    NSString *text = [NSString stringWithFormat:@"V%@", XcodeAppVersion];
    return  text;
}
+(network_type)getNetworkTypeFromStatusBar {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSNumber *dataNetworkItemView = nil;
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]])     {
            dataNetworkItemView = subview;
            break;
        }
    }
    network_type nettype = network_type_none;
    NSNumber * num = [dataNetworkItemView valueForKey:@"dataNetworkType"];
    nettype = [num intValue];
    return nettype;
}
/**
 检测网络状态
 */
+(NSString*)getNetworkStatus{
    NSString *type = nil;
    network_type networkType = [self getNetworkTypeFromStatusBar];
    switch (networkType) {
        case network_type_2G:
            type = @"2G";
            break;
        case network_type_3G:
            type = @"3G";
            break;
        case network_type_4G:
            type = @"4G";
            break;
        case network_type_5G:
            type = @"5G";
            break;
        case network_type_wifi:
            type = @"wifi";
            break;
        default:
            type = @"unknow";
            break;
    }
    return type;
}
/**
 获取运营商
 */
+(NSString*)getCellularProviderName{
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier*carrier = [netInfo subscriberCellularProvider];
    if ([carrier carrierName]) {
        return  [carrier carrierName];
    }
    return @" ";
}
/**
 获取当前时间
 */
+(NSString*)getDeviceIp{
    NSString *address = @"";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}
+(NSString*)getCurrentTime
{
    NSString* date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYYMMdd"];
    date = [formatter stringFromDate:[NSDate date]];
    return date;
}
+(NSString*)getLastSevenDay:(NSInteger)day{
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    if(day!=0)
    {
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        
        theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*day ];
        //or
        theDate = [nowDate initWithTimeIntervalSinceNow: -oneDay*day ];
    }
    else
    {
        theDate = nowDate;
    }
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMMdd"];
    NSString *inputDate = [inputFormatter stringFromDate:theDate];
    NSLog(@"%@",inputDate);
    return inputDate;
}

/**
 *  设备唯一编号
 *
 *  @return <#return value description#>
 */
+ (NSString*)uuid
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    NSString *str = [result stringByReplacingOccurrencesOfString :@"-" withString:@""];
    return str;
}

/**
 * 获取设备型号
 */
+ (NSString *)getCurrentDeviceModel
{
    return [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] model]];
}
/**
 * 改变颜色值
 */
+(UIColor *)changeColor:(NSString *)str{
    unsigned int red,green,blue;
    NSString * str1 = [str substringWithRange:NSMakeRange(1, 2)];
    NSString * str2 = [str substringWithRange:NSMakeRange(3, 2)];
    NSString * str3 = [str substringWithRange:NSMakeRange(5, 2)];
    
    NSScanner * canner = [NSScanner scannerWithString:str1];
    [canner scanHexInt:&red];
    canner = [NSScanner scannerWithString:str2];
    [canner scanHexInt:&green];
    
    canner = [NSScanner scannerWithString:str3];
    [canner scanHexInt:&blue];
    UIColor * color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    return color;
}
/**
 *  时间戳
 */
+ (NSString*) simulateAndRenderScene
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *timeString = [formatter stringFromDate:date];
    return timeString;
}

/**
 *  根据当前月份获取上月时间
 *
 *  @param thisMonth 当前月份时间
 *
 *  @return
 */
+(NSString*)getLastMonth:(NSString*)thisMonth{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *inputDate = [inputFormatter dateFromString:thisMonth];
    NSDate *lastDate = [NSDate dateWithTimeInterval:-24*60*60*30 sinceDate:inputDate];
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekday|NSCalendarUnitDay fromDate:lastDate];
    NSString *timeStr_ = [[NSString stringWithFormat:@"%@",lastDate] substringToIndex:10];
    NSString *timeStr =  [timeStr_ stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return timeStr;
}

/**
 *  根据时间字符串获取格式化后时间
 */
+(NSString*)getDateStr:(NSString*)dateStr{
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate* inputDate = [inputFormatter dateFromString:dateStr];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [outputFormatter stringFromDate:inputDate];
    return str;
}
+ (BOOL)settUDIDToKeyChain:(NSString*)udid
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [dic setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [dic setObject:udid forKey:(__bridge id)kSecAttrAccount];
    [dic setObject:[udid dataUsingEncoding:NSUTF8StringEncoding] forKey:(__bridge id)kSecValueData];
    OSStatus s = SecItemAdd((__bridge CFDictionaryRef)dic, NULL);
    return YES;
}
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword,(__bridge id)kSecClass,
            service, (__bridge id)kSecAttrService,
            service, (__bridge id)kSecAttrAccount,
            (__bridge id)kSecAttrAccessibleAfterFirstUnlock,(__bridge id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}
+ (UIImage*)createImageWithColor:(UIColor*)color{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
