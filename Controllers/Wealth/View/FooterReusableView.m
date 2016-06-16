//
//  FooterReusableView.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "FooterReusableView.h"
#import "MyLabel.h"

@implementation FooterReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        self.backgroundColor = kColor(245, 245, 245, 1);
    }
    return self;
}

- (void)createUI{

    UIView *userAd = [[UIView alloc]initWithFrame:CGRectMake(0, 1, kScreenW, 30*proportionHeight)];
    userAd.backgroundColor = [UIColor whiteColor];
    UIImageView *wifeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30*ProportionW, 10*proportionHeight, 10, 10*proportionHeight)];
    wifeImageView.image = [UIImage imageNamed:@"gg_btn"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(wifeImageView.right+5, 5*proportionHeight, 60, 20*proportionHeight)];
    label.text = @"用户公告";
    label.textColor = [UIColor colorWithHexString:@"#4d4d4d" withAlpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:14];
    [userAd addSubview:label];
    MyLabel *AdLabel = [[MyLabel alloc]initWithFrame:CGRectMake(label.right+5, 5*proportionHeight, kScreenW - label.left, 20*proportionHeight)];
    AdLabel.font = [UIFont systemFontOfSize:12];
    AdLabel.text = @"信托付给用户的最新公告内容";
    AdLabel.textColor = [UIColor colorWithHexString:@"#69bfee" withAlpha:1];
    AdLabel.userInteractionEnabled = YES;
    [AdLabel addTarget:self action:@selector(labelClick:)];
    [userAd addSubview:AdLabel];
    [userAd addSubview:wifeImageView];
    [self addSubview:userAd];
    UILabel *needLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, userAd.bottom, kScreenW, self.height - userAd.bottom)];
    needLabel.text = @"猜您需要";
    needLabel.textColor = [UIColor colorWithHexString:@"#a5a5a5" withAlpha:1];
    needLabel.font = [UIFont systemFontOfSize:16];
    needLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:needLabel];
    
}

- (void)labelClick:(id)sender{
    NSLog(@"label点击");
}

@end
