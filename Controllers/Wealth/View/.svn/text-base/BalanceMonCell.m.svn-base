//
//  BalanceMonCell.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/14.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "BalanceMonCell.h"

@implementation BalanceMonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    
    self.backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 140)];
    self.backImage.image = [UIImage imageNamed:@"zhye_btn"];
    [self.contentView addSubview:self.backImage];
    
    
    self.BalanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 130, 30)];
    self.BalanceLabel.font = [UIFont systemFontOfSize:16];
    self.BalanceLabel.textColor = [UIColor whiteColor];
    self.BalanceLabel.text = @"账户余额（元）";
    [self.contentView addSubview:self.BalanceLabel];
    
    
    self.AccountImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 140 - 30, 20, 20)];
    self.AccountImage.image = [UIImage imageNamed:@"je_btn"];
    [self.contentView addSubview:self.AccountImage];
    
    
    self.AccountLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.AccountImage.right + 5, 110, 100, 20)];
    self.AccountLabel.font = [UIFont systemFontOfSize:13];
    self.AccountLabel.textColor = [UIColor whiteColor];
    self.AccountLabel.text = @"待结算金额(元)";
    [self.contentView addSubview:self.AccountLabel];
    
    
    self.AccountMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.AccountLabel.right + 10, 105, kScreenW, 30)];
    self.AccountMoneyLabel.font = [UIFont systemFontOfSize:20];
    self.AccountMoneyLabel.textColor = [UIColor whiteColor];
    //测试
    self.AccountMoneyLabel.text = @"0.00";
    [self.contentView addSubview:self.AccountMoneyLabel];
    
    self.MoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.MoneyLabel.center = CGPointMake(kScreenW/2, 70);
    self.MoneyLabel.textColor = [UIColor whiteColor];
    //测试
    self.MoneyLabel.text = @"10563.91";
    self.MoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.MoneyLabel.font = [UIFont systemFontOfSize:40];
    [self.contentView addSubview:self.MoneyLabel];
    
    
    
    
    self.NumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.NumberLabel.center =  CGPointMake(kScreenW/2, 35);
    //测试
    self.NumberLabel.text = @"编号 88888888888";
    self.NumberLabel.textAlignment = NSTextAlignmentCenter;
    self.NumberLabel.textColor = [UIColor colorWithRed:97/255 green:97/255 blue:97/255 alpha:1];
    [self.contentView addSubview:self.NumberLabel];
    
    
    
    self.StatusLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 15)];
    self.StatusLabel.center = CGPointMake(kScreenW/4, 30);
    self.StatusLabel.font = [UIFont systemFontOfSize:14];
    self.StatusLabel.textAlignment = NSTextAlignmentCenter;
    self.StatusLabel.text = @"结算状态";
    self.StatusLabel.textColor = [UIColor colorWithRed:70/255 green:70/255 blue:70/255 alpha:1];
    [self.contentView addSubview:self.StatusLabel];
    
    self.Normallabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 15)];
    self.Normallabel.center = CGPointMake(kScreenW/4, 55);
    self.Normallabel.textAlignment = NSTextAlignmentCenter;
    self.Normallabel.font = [UIFont systemFontOfSize:14];
    //测试
    self.Normallabel.text = @"正常";
    self.Normallabel.textColor = [UIColor colorWithRed:70/255 green:70/255 blue:70/255 alpha:1];
    [self.contentView addSubview:self.Normallabel];
    
    
    self.TimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 15)];
    self.TimeLabel.center = CGPointMake(kScreenW/4, 90);
    self.TimeLabel.textAlignment = NSTextAlignmentCenter;
    self.TimeLabel.font = [UIFont systemFontOfSize:14];
    self.TimeLabel.text = @"计算周期";
    self.TimeLabel.textColor = [UIColor colorWithRed:70/255 green:70/255 blue:70/255 alpha:1];
    [self.contentView addSubview:self.TimeLabel];
    
    
    self.TimerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 15)];
    self.TimerLabel.center = CGPointMake(kScreenW/4, 115);
    self.TimerLabel.textAlignment = NSTextAlignmentCenter;
    self.TimerLabel.font = [UIFont systemFontOfSize:14];
    //测试
    self.TimerLabel.text = @"T+1";
    self.TimerLabel.textColor = [UIColor colorWithRed:70/255 green:70/255 blue:70/255 alpha:1];
    [self.contentView addSubview:self.TimerLabel];
    
    
    
    self.SecondeView = [[UIView alloc]initWithFrame:CGRectMake(kScreenW/2 - 0.5, 10, 1, 120)];
    self.SecondeView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.SecondeView];
    
    
    
    self.CardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.CardButton.frame = CGRectMake(kScreenW/2, 0, kScreenW/2, 140);
    [self.CardButton addTarget:self action:@selector(CardPress:) forControlEvents:UIControlEventTouchUpInside];
    self.CardButton.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.CardButton];
    
    
    
    self.CardNumberlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 15)];
    self.CardNumberlabel.center = CGPointMake(kScreenW/3*2+10, 115);
    self.CardNumberlabel.text = @"银行卡数";
    self.CardNumberlabel.textColor = [UIColor colorWithRed:70/255 green:70/255 blue:70/255 alpha:1];
    self.CardNumberlabel.textAlignment = NSTextAlignmentCenter;
    self.CardNumberlabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.CardNumberlabel];
    
    
    self.CardImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    self.CardImage.center = CGPointMake(kScreenW/3*2 + 10, 55);
    self.CardImage.image = [UIImage imageNamed:@"zhye_yhks_btn"];
    [self.contentView addSubview:self.CardImage];
    
    
    self.arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 10, 10)];
    self.arrowImage.center = CGPointMake(kScreenW - 30, 70);
    self.arrowImage.image = [UIImage imageNamed:@"aqenter_btn"];
    [self.contentView addSubview:self.arrowImage];
    
    
}

-(void)CardPress:(UIButton *)sender{


    [self.CardDelegate  CardBuutnClick];


}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
