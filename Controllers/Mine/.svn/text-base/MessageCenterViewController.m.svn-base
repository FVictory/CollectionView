//
//  MessageCenterViewController.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "MessageCenterViewController.h"
#import "MessageCell.h"
@interface MessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *MessageImage;
    NSArray *MessageName;
    UITableView * MessageTable;
    
}
@end

@implementation MessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    MessageImage = [NSArray arrayWithObjects:@"yhgg_btn",@"shgg_btn", nil];
    MessageName = [NSArray arrayWithObjects:@"用户公告",@"商户公告", nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setLeftItemToBack];
    [self creatTable];
    
}
- (void)creatTable{
    MessageTable= [[UITableView alloc]initWithFrame:CGRectMake(0,64, kScreenW, kScreenH-49) style:UITableViewStylePlain];
    MessageTable.delegate = self;
    MessageTable.dataSource = self;
    MessageTable.scrollEnabled = NO;
    MessageTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    MessageTable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:MessageTable];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
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
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iconCell"];
    if (!cell) {
        cell = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iconCell"];
    }
    cell.name.text = MessageName[indexPath.row];
    cell.headImage.image = [UIImage imageNamed:MessageImage[indexPath.row]];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}






  @end
