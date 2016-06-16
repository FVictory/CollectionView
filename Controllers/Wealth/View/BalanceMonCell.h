//
//  BalanceMonCell.h
//  atrustpay
//
//  Created by qiuqiu on 15/9/14.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardButtonDelegate <NSObject>

-(void)CardBuutnClick;

@end



@interface BalanceMonCell : UITableViewCell


@property(nonatomic, strong)UIImageView *backImage;
@property(nonatomic, strong)UILabel *BalanceLabel;
@property(nonatomic, strong)UILabel *AccountLabel;
@property(nonatomic, strong)UILabel *MoneyLabel;
@property(nonatomic, strong)UILabel *AccountMoneyLabel;
@property(nonatomic, strong)UIImageView *AccountImage;



@property(nonatomic, strong) UILabel *NumberLabel;



@property(nonatomic, strong)UILabel *StatusLabel;
@property(nonatomic, strong)UILabel *Normallabel;
@property(nonatomic, strong)UILabel *TimeLabel;
@property(nonatomic, strong)UILabel *TimerLabel;
@property(nonatomic, strong)UILabel *CardNumberlabel;
@property(nonatomic, strong)UIView *firstView;
@property(nonatomic, strong)UIView *SecondeView;
@property(nonatomic, strong)UIImageView *CardImage;
@property(nonatomic, strong)UIImageView *arrowImage;
@property(nonatomic, strong)UIButton *CardButton;

@property(assign,nonatomic)id<CardButtonDelegate>CardDelegate;


@end
