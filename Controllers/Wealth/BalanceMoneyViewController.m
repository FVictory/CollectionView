//
//  BalanceMoneyViewController.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/14.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "BalanceMoneyViewController.h"
#import "BalanceMonCell.h"
@interface BalanceMoneyViewController ()<UITableViewDelegate,UITableViewDataSource,CardButtonDelegate>
{
    UITableView *BalanceTable;


}
@end

@implementation BalanceMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setLeftItemToBack];
    [self createUI];

}
-(void)createUI{

    BalanceTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH - 49) style:UITableViewStyleGrouped];
    
    BalanceTable.dataSource = self;
    BalanceTable.delegate = self;
    
    BalanceTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    BalanceTable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:BalanceTable];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"Balance";
    
    BalanceMonCell * cell = [tableView dequeueReusableCellWithIdentifier:string];

    if (cell == nil) {
        
        cell = [[BalanceMonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.CardDelegate = self;
    }
    
    if (indexPath.section == 0) {
        
        cell.SecondeView.hidden = YES;
        cell.NumberLabel.hidden = YES;
        
        cell.StatusLabel.hidden = YES;
        cell.Normallabel.hidden = YES;
        cell.TimeLabel.hidden = YES;
        cell.TimerLabel.hidden = YES;
        cell.CardNumberlabel.hidden = YES;
        cell.firstView.hidden = YES;
        cell.SecondeView.hidden = YES;
        cell.CardImage.hidden = YES;
        cell.arrowImage.hidden = YES;
        cell.CardButton.hidden = YES;
        
    }else if (indexPath.section == 1){
        
        cell.backImage.hidden = YES;
        cell.MoneyLabel.hidden = YES;
        cell.AccountImage.hidden = YES;
        cell.AccountLabel.hidden = YES;
        cell.AccountMoneyLabel.hidden = YES;
        cell.MoneyLabel.hidden = YES;
        cell.BalanceLabel.hidden = YES;
        
        cell.NumberLabel.hidden = NO;
        

        cell.StatusLabel.hidden = YES;
        cell.Normallabel.hidden = YES;
        cell.TimeLabel.hidden = YES;
        cell.TimerLabel.hidden = YES;
        cell.CardNumberlabel.hidden = YES;
        cell.firstView.hidden = YES;
        cell.SecondeView.hidden = YES;
        cell.CardImage.hidden = YES;
        cell.arrowImage.hidden = YES;
        cell.CardButton.hidden = YES;
        
        
    }else{
    
        cell.backImage.hidden = YES;
        cell.MoneyLabel.hidden = YES;
        cell.AccountImage.hidden = YES;
        cell.AccountLabel.hidden = YES;
        cell.AccountMoneyLabel.hidden = YES;
        cell.MoneyLabel.hidden = YES;
        cell.BalanceLabel.hidden = YES;
        
        
        cell.NumberLabel.hidden = YES;
        
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 140;
    }else if (indexPath.section == 1){
    
        return 70;
    }else
    {
        return 140;
    }


}

//点击银行卡进入下一个界面

-(void)CardBuutnClick
{
    NSLog(@"进入");

}

@end
