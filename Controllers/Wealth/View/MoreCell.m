//
//  MoreCell.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "MoreCell.h"

@implementation MoreCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    UIView *original = [[UIView alloc]initWithFrame:self.frame];
    original.backgroundColor = [UIColor whiteColor];
    self.backgroundView = original;
    UIView *select = [[UIView alloc]initWithFrame:self.frame];
    select.backgroundColor = kColor(245, 245, 245, 1);
    [self setSelectedBackgroundView:select];
    
    _logo = [[UIImageView alloc]initWithFrame:CGRectMake((self.width-self.width+50)/2.0, 10, self.width-50, self.width-50)];
    [self.contentView addSubview:_logo];
    
    _middle = [[UILabel alloc] initWithFrame:CGRectMake(0,_logo.bottom+5, self.width, 30)];
    _middle.tintColor = kColor(78, 78, 78, 1);
    _middle.textAlignment = NSTextAlignmentCenter;
    _middle.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_middle];
    
}

@end
