//
//  MineView.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "MineView.h"

@implementation MineView

-(void)drawRect:(CGRect)rect{

    UIImage *oldImage = [UIImage imageNamed:self.imageName];
    
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);

    
    
    CGContextAddEllipseInRect(ctx, circleRect);
    
    
    CGContextClip(ctx);
    
    [oldImage drawInRect:circleRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    
    
}

@end
