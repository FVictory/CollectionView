//
//  CheckStandController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/9.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "CheckStandController.h"
#import "ReferBalanceViewController.h"
#import "SecuritySetCell.h"
#import "ConsumeController.h"

@interface CheckStandController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_table;
}
@property(nonatomic,retain)NSArray *nameArr;
@property(nonatomic,retain)NSArray *imageArr;

@end

@implementation CheckStandController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColor(246, 246, 246, 1);
    self.nameArr = @[@"终端签到",@"消费/收款",@"余额查询",@"电子签购单上传"];
    self.imageArr = @[@"syt_zjqd_btn",@"syt_xfsk_btn",@"syt_yecx_btn",@"syt_dzqg_btn"];
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
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, kScreenH-64-4*44-10)];
    backView.backgroundColor = kColor(246, 246, 246, 1);
    [view addSubview:backView];
    UIImageView * PayBackImage = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenW-150)/2,(kScreenH-64-4*44-10-70)/2, 150, 70)];
    PayBackImage.image = [UIImage imageNamed:@"dplogo_btn"];
    [backView addSubview:PayBackImage];
    
    return view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SecuritySetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iconCell"];
    if (!cell) {
        cell = [[SecuritySetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iconCell"];
    }
    cell.name.text = self.nameArr[indexPath.row];
    cell.headImage.image = [UIImage imageNamed:self.imageArr[indexPath.row]];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        ConsumeController *consume = [[ConsumeController alloc]init];
        consume.title = @"消费";
        [self.navigationController pushViewController:consume animated:YES];
    }else if (indexPath.row == 2){
        ReferBalanceViewController *referBalance = [[ReferBalanceViewController alloc]init];
        referBalance.title = @"余额查询";
        [self.navigationController pushViewController:referBalance animated:YES];
    }else{
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
