//
//  UIColor+YUColor.h
//  YUANBAOAPP
//
//  Created by yxy on 14-8-14.
//  Copyright (c) 2014年 ATAW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Color;

@interface UIColor (YUColor)

+(UIColor * )borderGrayColor;
+(UIColor *) MainViewbackGroundColor;
+(UIColor*)lowGrayColor;
+(UIColor *)yDeepBlueColor;
+(UIColor *)yDeepGrayColor;

+(UIColor *)yDarkBlackColor;

+(UIColor *)yFontGrayColor;

+(UIColor *)yYbOrangeColor;

+ (UIColor *) colorWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;
+ (Color *) RGBWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;

@end
