//
//  MineController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/9.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "MineController.h"
#import "SecuritySettingViewController.h"
#import "MessageCenterViewController.h"
#import "StoreViewController.h"
#import "SystemManageViewController.h"
#import "MineCell.h"

@interface MineController ()<UITableViewDataSource,UITableViewDelegate,quitBtnDelegate>

{
    UITableView *MineTable;
    NSArray * imagearray;
    NSArray * testarray;
}

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    imagearray = [NSArray arrayWithObjects:@"dp_btn",@"aqsz_btn",@"xtgl_btn" ,@"xxzx_btn",nil];
    testarray = [NSArray arrayWithObjects:@"店铺",@"安全设置",@"系统管理",@"消息中心", nil];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    [self CreatItem];
    [self CreatTable];
}

-(void)CreatTable{
    
    MineTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, kScreenW, kScreenH - 64) style:UITableViewStyleGrouped];
    MineTable.delegate = self;
    MineTable.dataSource = self;
    MineTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    MineTable.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:MineTable];
    
    
}

-(void)CreatItem{
    
    UIBarButtonItem *Sign= [[UIBarButtonItem alloc]initWithTitle:@"签到" style:UIBarButtonItemStylePlain target:self action:@selector(SignItem)];
    self.navigationItem.rightBarButtonItem = Sign;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        
        return 5;
    }else
    {
        return 1;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * string = @"MineCell";
    
    MineCell * cell = [tableView dequeueReusableCellWithIdentifier:string];
    
    if (cell == nil) {
        
        cell = [[MineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        cell.name.hidden = YES;
        cell.headImage.hidden = YES;
        cell.arrow.hidden = YES;
        cell.quitBtn.hidden = YES;
        cell.backImage.hidden = NO;
        cell.TouImage.hidden = NO;
        cell.line.hidden  = YES;
    }else if (indexPath.section == 1){
        
        cell.quitBtn.hidden  = NO;
        cell.arrow.hidden = YES;
        cell.headImage.hidden = YES;
        cell.name.hidden = YES;
        cell.backImage.hidden = YES;
        cell.TouImage.hidden = YES;
        cell.gestureImage.hidden = YES;

        
    }else
    {
        
        cell.quitBtn.hidden  = YES;
        cell.arrow.hidden = NO;
        cell.headImage.hidden = NO;
        cell.name.hidden = NO;
        cell.backImage.hidden = YES;
        cell.TouImage.hidden = YES;
        cell.gestureImage.hidden = YES;

        
        cell.name.text = testarray[indexPath.row -1];
        cell.headImage.image = [UIImage imageNamed:imagearray[indexPath.row - 1]];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row > 0) {
        
        if (indexPath.row == 1) {
            
            StoreViewController * store = [[StoreViewController alloc]init];
            store.title = @"店铺";
            [self.navigationController pushViewController:store animated:YES];
            
        }else if (indexPath.row == 2){
            
            SecuritySettingViewController * security = [[SecuritySettingViewController alloc]init];
            security.title = @"安全设置";
            security.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:security animated:YES];
            
            
        }else if (indexPath.row == 3){
            SystemManageViewController *systeManage = [[SystemManageViewController alloc]init];
            systeManage.title = @"系统管理";
            [self.navigationController pushViewController:systeManage animated:YES];
            
        }else
        {
            MessageCenterViewController *message =[[MessageCenterViewController alloc]init];
            message.title = @"消息中心";
            [self.navigationController pushViewController:message animated:YES];
            
            
        }
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 120;
    }else
    {
        return 44;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    
    
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 0.01;
}

//退出
-(void)quitClick{
    
    
    
    
}

//签到
-(void)SignItem{
    
    
    
}



@end
