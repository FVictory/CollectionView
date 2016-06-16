//
//  ReferBalanceViewController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "ReferBalanceViewController.h"
#import "BalanceCell.h"

@interface ReferBalanceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_table;
}
@property(nonatomic,retain)NSArray *nameArr;

@end

@implementation ReferBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftItemToBack];
    self.view.backgroundColor = kColor(246, 246, 246, 1);
    self.nameArr = @[@"查询卡号:",@"账户余额:"];
    
    [self createUI];
}

- (void)createUI{
    _table= [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenW, kScreenH-64+49) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.scrollEnabled = NO;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, 44)];
    backView.backgroundColor = kColor(246, 246, 246, 1);
    [view addSubview:backView];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((kScreenW-100*ProportionW)/2, 7, 100*ProportionW, 30)];
    label.text = @"交易成功!";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = kColor(0, 180, 72, 1);
    [backView addSubview:label];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = kColor(246, 246, 246, 1);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.userInteractionEnabled = YES;
    button.frame = CGRectMake(0, 10, kScreenW, 30);
    [button setTitle:@"确认" forState:UIControlStateNormal];
    button.backgroundColor =  [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return view;
}

- (void)btnClick:(UIButton *)sender{
    
    NSLog(@"确认");
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BalanceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iconCell"];
    if (!cell) {
        cell = [[BalanceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iconCell"];
    }
    if (indexPath.row == 0) {
        cell.info.text = @"6224**********4526";
        cell.info.textColor = [UIColor blackColor];
    }else{
        cell.info.text = @"2000.00元";
        cell.info.textColor = [UIColor colorWithHexString:@"#69bfee" withAlpha:1];
    }
    cell.name.text = self.nameArr[indexPath.row];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
