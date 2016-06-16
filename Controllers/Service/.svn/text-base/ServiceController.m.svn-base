//
//  ServiceController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/9.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "ServiceController.h"
#import "SecuritySetCell.h"
#import "RechargePhoneController.h"
#import "StoreController.h"

@interface ServiceController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_table;
}
@property(nonatomic,retain)NSArray *nameArr;
@property(nonatomic,retain)NSArray *secondNameArr;
@property(nonatomic,retain)NSArray *imageArr;
@property(nonatomic,retain)NSArray *secondImageArr;

@end

@implementation ServiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColor(246, 246, 246, 1);
    self.nameArr = @[@"信用卡还款",@"手机充值",@"商城"];
    self.secondNameArr = @[@"设备匹配"];
    self.imageArr = @[@"fw_xykhk_btn",@"fw_sjcz_btn",@"fw_sc_btn"];
    self.secondImageArr = @[@"fw_sbppk_btn"];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    return 1;
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
    if (section == 1) {
        UIView *view = [[UIView alloc]init];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, kScreenH-64-4*44-10)];
        backView.backgroundColor = kColor(246, 246, 246, 1);
        [view addSubview:backView];
        return view;
    }
    return nil;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SecuritySetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iconCell"];
    if (!cell) {
        cell = [[SecuritySetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iconCell"];
    }
    if (indexPath.section == 0) {
        cell.name.text = self.nameArr[indexPath.row];
        cell.headImage.image = [UIImage imageNamed:self.imageArr[indexPath.row]];
    }else{
        cell.name.text = self.secondNameArr[indexPath.row];
        cell.headImage.image = [UIImage imageNamed:self.secondImageArr[indexPath.row]];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        RechargePhoneController *recharge = [[RechargePhoneController alloc]init];
        recharge.title = @"手机充值";
        [self.navigationController pushViewController:recharge animated:YES];
    }else if (indexPath.row == 2){
        StoreController *store = [[StoreController alloc]init];
        store.title = @"商城";
        [self.navigationController pushViewController:store animated:YES];
    }else{
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
