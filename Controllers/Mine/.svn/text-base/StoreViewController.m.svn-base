//
//  StoreViewController.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "StoreViewController.h"
#import "BusinessRegisterViewController.h"
#import "StoreCell.h"

@interface StoreViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * imagearray;
    NSArray * testarray;
    UITableView *StoreTable;
    
}
@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    imagearray = [NSArray arrayWithObjects:@"xgmm_btn",@"zlcx_btn",@"zlsc_btn" ,@"zlxg_btn",nil];
    testarray = [NSArray arrayWithObjects:@"商户注册申请",@"商户资料查询",@"商户资料上传",@"商户资料修改", nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setLeftItemToBack];
    [self creatUI];
}

-(void)creatUI{

    StoreTable= [[UITableView alloc]initWithFrame:CGRectMake(0,64, kScreenW, kScreenH-49) style:UITableViewStylePlain];
    StoreTable.delegate = self;
    StoreTable.dataSource = self;
    StoreTable.scrollEnabled = NO;
    StoreTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    StoreTable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:StoreTable];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
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
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, kScreenH-64-4*44-5)];
    backView.backgroundColor = kColor(246, 246, 246, 1);
    [view addSubview:backView];
    UIImageView * PayBackImage = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenW-150)/2,(kScreenH-64-4*44-5-70)/2, 150, 70)];
    PayBackImage.image = [UIImage imageNamed:@"dplogo_btn"];
    [backView addSubview:PayBackImage];
    
    return view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iconCell"];
    if (!cell) {
        cell = [[StoreCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iconCell"];
    }
    cell.name.text = testarray[indexPath.row];
    cell.headImage.image = [UIImage imageNamed:imagearray[indexPath.row]];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        BusinessRegisterViewController *Business = [[BusinessRegisterViewController alloc]init];
        Business.title = @"商户注册";
        
        [self.navigationController pushViewController:Business animated:YES];
        
    }


}

@end
