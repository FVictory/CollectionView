//
//  MineCell.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "MineCell.h"

@implementation MineCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    self.backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 120)];
    self.backImage.image = [UIImage imageNamed:@"wdxx_btn"];
    [self.contentView addSubview:self.backImage];
    
    
    self.TouImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    self.TouImage.center = CGPointMake(kScreenW/2, 50);
    self.TouImage.image = [UIImage imageNamed:@"wdxx_tx_btn"];
    [self.contentView addSubview:self.TouImage];
    
    
    self.gestureImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 20)];
    self.gestureImage.center = CGPointMake(kScreenW/2, 85);
    self.gestureImage.image = [UIImage imageNamed:@"yh_btn"];
    [self.contentView addSubview:self.gestureImage];
    
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, kScreenW, 1)];
    self.line.backgroundColor =kColor(246, 246, 246, 1);
    [self.contentView addSubview:self.line];
    
    self.headImage =[[UIImageView alloc]initWithFrame:CGRectMake(20, 12, 20, 20)];
    [self.contentView addSubview:self.headImage];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(self.headImage.right+10, 7, 100, 30)];
    self.name.font = [UIFont systemFontOfSize:15.0];
    self.name.textColor = kColor(78, 78, 78, 1);
    [self.contentView addSubview:self.name];
    
    self.arrow = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-10-20, 17, 10, 10)];
    self.arrow.image =[UIImage imageNamed:@"aqenter_btn"];
    [self.contentView addSubview:self.arrow];
    
    
    self.quitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.quitBtn.frame = CGRectMake(0, 0, kScreenW, self.bounds.size.height);
    self.quitBtn.backgroundColor =  [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    
    //self.quitBtn.backgroundColor = [UIColor blueColor];
    [self.quitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [self.quitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.quitBtn addTarget:self action:@selector(quitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.quitBtn];

    
    
}
-(void)quitBtnClick:(UIButton *)btn
{
    [self.quitDelegate quitClick];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
