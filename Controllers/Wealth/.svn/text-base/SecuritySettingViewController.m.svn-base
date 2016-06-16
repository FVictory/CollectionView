//
//  SecuritySettingViewController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "SecuritySettingViewController.h"
#import "SecuritySetCell.h"
#import "ReadNameViewController.h"

@interface SecuritySettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_table;
}
@property(nonatomic,retain)NSArray *nameArr;
@property(nonatomic,retain)NSArray *imageArr;
@end

@implementation SecuritySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftItemToBack];
    self.view.backgroundColor = kColor(246, 246, 246, 1);
    self.nameArr = @[@"修改密码",@"实名认证",@"我的信息查询"];
    self.imageArr = @[@"xgmm_btn",@"smrz_btn",@"xxcx_btn"];
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
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, kScreenH-64-3*44-5)];
    backView.backgroundColor = kColor(246, 246, 246, 1);
    [view addSubview:backView];
    UIImageView * PayBackImage = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenW-150)/2,(kScreenH-64-3*44-5-70)/2, 150, 70)];
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
        ReadNameViewController * readName = [[ReadNameViewController alloc]init];
        readName.title = @"实名认证";
        [self.navigationController pushViewController:readName animated:YES];
    }else{
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
