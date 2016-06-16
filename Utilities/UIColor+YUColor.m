//
//  UIColor+YUColor.m
//  YUANBAOAPP
//
//  Created by yxy on 14-8-14.
//  Copyright (c) 2014年 ATAW. All rights reserved.
//

#import "UIColor+YUColor.h"
#import "Color.h"

@implementation UIColor (YUColor)

+(UIColor * )borderGrayColor{
    
    return [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1];
}
+(UIColor *) MainViewbackGroundColor{
    
    return [UIColor colorWithRed:239 /255.0 green:239/255.0 blue:239/255.0 alpha:1];
}
+(UIColor*)lowGrayColor{

    return [UIColor colorWithRed:149 /255.0 green:149/255.0 blue:149/255.0 alpha:1];
}
+(UIColor *)yDeepBlueColor{
    
    return [UIColor colorWithRed:0 /255.0 green:140/255.0 blue:206/255.0 alpha:1];
  

}
+(UIColor *)yYbOrangeColor{


    return [UIColor colorWithRed:224 /255.0 green:77/255.0 blue:62/255.0 alpha:1];
}
+(UIColor *)yDeepGrayColor{
    
    return [UIColor colorWithRed:181 /255.0 green:181/255.0 blue:181/255.0 alpha:1];

}

+(UIColor *)yDarkBlackColor{

return [UIColor colorWithRed:74 /255.0 green:74/255.0 blue:74/255.0 alpha:1];

    }

+(UIColor *)yFontGrayColor{

    return [UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1];

}

#pragma mark 16进制颜色转换
// color = #FFFFFF 或者 0xFFFFFF
+ (UIColor *) colorWithHexString: (NSString *)color withAlpha:(CGFloat)alpha
{
    unsigned int r, g, b;
    Color *rgb = [self RGBWithHexString:color withAlpha:alpha];
    r = rgb.R;
    g = rgb.G;
    b = rgb.B;
    alpha = rgb.alpha;
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

#pragma mark 16进制转换为RGB模式
+ (Color *) RGBWithHexString: (NSString *)color withAlpha:(CGFloat)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return Nil;
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return Nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    Color *rgb = [[Color alloc] init];
    rgb.R = r;
    rgb.B = b;
    rgb.G = g;
    rgb.alpha = alpha;
    return  rgb;
}


@end
