//
//  UIButton+Btn.m
//  ktx
//
//  Created by 范胜利 on 15/7/17.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "UIButton+Btn.h"

@implementation UIButton (Btn)

- (void)btn:(NSString*)btnName select:(BOOL)select
{
    for (UIView *v1 in self.subviews) {
        [v1 removeFromSuperview];
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:self.bounds];
    
    lab.text = btnName;
    
    lab.textColor =[UIColor whiteColor];
    
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:20];
    
    [self addSubview:lab];
    
    if (select) {
        
        lab.backgroundColor = [UIColor colorWithHexString:@"#69bfee" withAlpha:1];
    }
    
    
}

@end

