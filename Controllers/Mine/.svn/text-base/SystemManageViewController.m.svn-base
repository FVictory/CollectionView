//
//  SystemManageViewController.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "SystemManageViewController.h"
#import "SystemCenterCell.h"
@interface SystemManageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * imagearray;
    NSArray * testarray;
    UITableView *Systemtable;
}
@end

@implementation SystemManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    imagearray = [NSArray arrayWithObjects:@"xtgl_sbpp_btn",@"xtgl_bbjc_btn",@"xtgl_lxkf_btn" ,@"xtgl_cybz_btn",nil];
    testarray = [NSArray arrayWithObjects:@"设备匹配",@"版本检查及下载",@"联系客服",@"常用帮助", nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setLeftItemToBack];
    [self creatTable];
}
-(void)creatTable{

    Systemtable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH - 49) style:UITableViewStylePlain];
    
    Systemtable.delegate = self;
    Systemtable.dataSource = self;
    Systemtable.scrollEnabled = NO;
    Systemtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    Systemtable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:Systemtable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return imagearray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * string = @"System";
    
    SystemCenterCell * cell = [tableView dequeueReusableCellWithIdentifier:string ];
    
    
    if (cell == nil) {
        cell = [[SystemCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    
    cell.headImage.image = [UIImage imageNamed:imagearray[indexPath.row]];
    cell.name.text = testarray[indexPath.row];
    
    
    if (indexPath.row == 1) {
        
        cell.NumberLabel.text = @"1.21";
    
    }
    if (indexPath.row == 2) {
        cell.NumberLabel.text = @"111111111";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    



}

@end
