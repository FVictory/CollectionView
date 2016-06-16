//
//  PurseFooterReusableView.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "PurseFooterReusableView.h"

@implementation PurseFooterReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kColor(246, 246, 246, 1);
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    UIImageView * PayBackImage = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenW-150)/2,(kScreenH-64-3*44-5-70)/3, 150, 70)];
    PayBackImage.image = [UIImage imageNamed:@"dplogo_btn"];
    [self addSubview:PayBackImage];
}

@end
