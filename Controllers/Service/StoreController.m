//
//  StoreController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/14.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "StoreController.h"
#import "UIButton+Btn.h"
#import "POSCell.h"

@interface StoreController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_nameArr;
    UITableView *_table;
    UIView *_topView;
    NSString *_type;
    
}

@end

@implementation StoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftItemToBack];
    _nameArr = @[@"POS机",@""];
    [self createTopView];
    [self createTab];
}

- (void)createTab{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, _topView.bottom, kScreenW, kScreenH - _topView.bottom) style:UITableViewStylePlain];
    _table.dataSource = self;
    _table.delegate =self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self setExtraCellLineHidden:_table];
    [self.view addSubview:_table];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(void)viewDidLayoutSubviews
{
    if ([_table respondsToSelector:@selector(setSeparatorInset:)]) {
        [_table setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([_table respondsToSelector:@selector(setLayoutMargins:)]) {
        [_table setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 140;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = kColor(239,239,239,1);
    return line;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = kColor(239,239,239,1);
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 1)];
    line.backgroundColor = kColor(239,239,239,1);
    [view addSubview:line];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    POSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"POSCell"];
    if (!cell) {
        cell = [[POSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"POSCell"];
    }

    cell.nameLabel.text = @"MATE手机POS机第三代";
    cell.detailLabel.text = @"MATE手机POS机第三代/收款宝/刷卡宝支持手机/平板 支付移动信用卡收款刷卡器 即付宝0.49%/35费率－音频版";
    cell.priceLabel.text = @"￥299.00";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)createTopView{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, 64)];
    _topView.backgroundColor = kColor(246,246,246,1);
    [self.view addSubview:_topView];
    for (int i =0 ; i<2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(15+i*(kScreenW-30-10)/2+i*10, 10, (kScreenW-30-10)/2, 44);
        [button btn:_nameArr[i] select:NO];
        if (i == 0) {
            [button btn:_nameArr[i] select:YES];
        }
        button.tag = 100+i;
//        [button addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:button];
    }
}

- (void)btnDown:(UIButton *)sender{
    
    for (int i = 0 ; i < _nameArr.count; i++) {
        UIButton *btnDown = (UIButton*)[_topView viewWithTag:100+i];
        [btnDown btn:_nameArr[i] select:NO];
    }
    [sender btn:_nameArr[sender.tag-100] select:YES];
    if (sender.tag == 100) {
        
    }else{
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
