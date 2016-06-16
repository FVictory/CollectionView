//
//  ConsumeController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/14.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "ConsumeController.h"

@interface ConsumeController ()

@property(nonatomic,retain)NSArray *nameArr;

@end

@implementation ConsumeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameArr = @[@"付款卡号",@"消费金额",@"请您签名"];
    [self createUI];
    [self setLeftItemToBack];
    self.view.backgroundColor = kColor(246, 246, 246, 1);
    
}

- (void)createUI{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+10, kScreenW, 260)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    for (int i = 0; i<3; i++) {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, i*40, 60, 40)];
        nameLabel.text = self.nameArr[i];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [backView addSubview:nameLabel];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,40*i, kScreenW, 1)];
        view.backgroundColor = kColor(246, 246, 246, 1);
        [backView addSubview:view];
        
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(nameLabel.right+5, nameLabel.top, 150, 40)];
        if (i==0) {
            detailLabel.textColor = [UIColor blackColor];
            detailLabel.text = @"6214*********6754";
        }else if (i==1){
            detailLabel.textColor = [UIColor colorWithHexString:@"#69bfee" withAlpha:1];
            detailLabel.text = @"2000.00元";
        }
        else{
            detailLabel.text = @"";
            UIButton *buton = [UIButton buttonWithType:UIButtonTypeCustom];
            buton.frame = CGRectMake(kScreenW-20-60, detailLabel.top+5, 60, 30);
            [buton setTitle:@"重签" forState:UIControlStateNormal];
            [buton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            buton.tag = 100;
            buton.titleLabel.font = [UIFont systemFontOfSize:12];
            buton.backgroundColor = [UIColor colorWithHexString:@"#69bfee" withAlpha:1];
            [buton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [backView addSubview:buton];
        }
        [backView addSubview:detailLabel];
    }
    
    UILabel *hintLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 160, kScreenW, 30)];
    hintLabel.textAlignment = NSTextAlignmentCenter;
    hintLabel.textColor = kColor(201, 201, 201, 1);
    hintLabel.text = @"＊持卡人与收单机构达成协议，愿意支付本单据所示金额";
    hintLabel.font = [UIFont systemFontOfSize:12];
    [backView addSubview:hintLabel];
    
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeCustom];
    submit.frame = CGRectMake(0, backView.bottom+10, kScreenW, 35);
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    submit.backgroundColor = [UIColor colorWithHexString:@"#69bfee" withAlpha:1];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submit.tag = 101;
    [submit addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];
    
}

- (void)btnClick:(UIButton *)arg{
    if (arg.tag == 100) {
        NSLog(@"重签");
    }else{
        NSLog(@"提交");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
