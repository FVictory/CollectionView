//
//  GatheringViewController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "GatheringViewController.h"
#import "Keyboard.h"

@interface GatheringViewController ()
{
    UILabel *_showView;
}
@end

@implementation GatheringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收款";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    [self setLeftItemToBack];
    [self createUI];
}

-(void)createUI{
    _showView=[[UILabel alloc]initWithFrame:CGRectMake(0, 64, kScreenW,150*proportionHeight)];
    _showView.backgroundColor=[UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    _showView.tag=1;//设置tag，方便后面对他操作
    _showView.textAlignment = NSTextAlignmentCenter;
    _showView.textColor = [UIColor whiteColor];
    [_showView setFont:[UIFont systemFontOfSize:40]];
    _showView.numberOfLines = 0;
    [self.view addSubview:_showView];
    
    //创建了一个自定义视图，显示键盘，并且按键监控
    Keyboard *key=[[Keyboard alloc]initWithFrame:CGRectMake(0, _showView.bottom, kScreenW, kScreenH-_showView.bottom)];
    [self.view addSubview:key];
    _showView .text =[NSString stringWithFormat:@"%@",key.result];//设置显示的结果
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
