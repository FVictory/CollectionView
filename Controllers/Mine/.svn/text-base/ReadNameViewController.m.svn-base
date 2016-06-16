//
//  ReadNameViewController.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "ReadNameViewController.h"

@interface ReadNameViewController ()
{

    NSArray *NameArray;
    NSArray *PloceArray;
    UIScrollView *scroller;

}
@end

@implementation ReadNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NameArray = [NSArray arrayWithObjects:@"真实姓名",@"身份证号",@"绑定卡号",@"户       名",@"开户行号",@"地       址",@"账户类型", nil];
    
    PloceArray = [NSArray arrayWithObjects:@"请输入真实姓名",@"请输入详身份证号",@"请输入卡号或者刷卡获取",@"请输入绑定银行卡开户姓名",@"请输入12位所在支行行号",@"请输入机具使用地址", nil];
    [self setLeftItemToBack];
    [self creatScroller];
    [self creatUI];
    
}
-(void)creatScroller{



    scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH)];
    scroller.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    scroller.bounces = NO;
    scroller.pagingEnabled = NO;
    
    [self.view addSubview:scroller];
    
    
}


-(void)creatUI{
    
    
    for (int i = 0; i < NameArray.count; i++) {
        
        UIView * ReadNameView = [[UIView alloc]initWithFrame:CGRectMake(0, 10 + 41 * i, kScreenW, 40)];
        ReadNameView.backgroundColor = [UIColor whiteColor];
        
        
        UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 70, 40)];
        NameLabel.text = NameArray[i];
        NameLabel.textColor = [UIColor colorWithHexString:@"4e4e4e" withAlpha:1];
        NameLabel.textAlignment = NSTextAlignmentLeft;
        NameLabel.font = [UIFont systemFontOfSize:16];
        
        [scroller addSubview:ReadNameView];
        [ReadNameView addSubview:NameLabel];
        
        
        
        if (i == 4) {
            
            UIButton * ChaXunButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [ChaXunButton setTitle:@"查询" forState:UIControlStateNormal];
            [ChaXunButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            ChaXunButton.backgroundColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
            [ChaXunButton addTarget:self action:@selector(ChaXunPress:) forControlEvents:UIControlEventTouchUpInside];
            ChaXunButton.frame = CGRectMake(kScreenW - 80, 0, 80, 40);
            
            [ReadNameView addSubview:ChaXunButton];
            
        }
        
        
        if (i < NameArray.count - 1) {
            
            UITextField * NameText = [[UITextField alloc]initWithFrame:CGRectMake(122, 0, kScreenW - 202, 40)];
            NameText.placeholder = PloceArray[i];
            NameText.font = [UIFont systemFontOfSize:13];
            NameText.textAlignment = NSTextAlignmentLeft;
            NameText.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
            [ReadNameView addSubview:NameText];
            
        }else
        {
            
            NSArray * NameCategary = [NSArray arrayWithObjects:@"对私",@"对公", nil];
            
            for(int i = 0; i < NameCategary.count; i++){
            
                UIButton * CategaryButton = [UIButton buttonWithType:UIButtonTypeCustom];
                CategaryButton.frame = CGRectMake(122 + 50*i, 12, 16, 16);
                [CategaryButton setImage:[UIImage imageNamed:@"CheckBox_btn"] forState:UIControlStateNormal];
                [CategaryButton setImage:[UIImage imageNamed:@"CheckBoxxz_btn"] forState:UIControlStateSelected];
                CategaryButton.tag = 100 + i;
                [CategaryButton addTarget:self action:@selector(CategaryPress:) forControlEvents:UIControlEventTouchUpInside];
                CategaryButton.selected = NO;
                
                
                
                UILabel *CategaryLable = [[UILabel alloc]initWithFrame:CGRectMake(138 + i * 50, 0, 40, 40)];
                CategaryLable.text = NameCategary[i];
                CategaryLable.textAlignment = NSTextAlignmentLeft;
                CategaryLable.textColor =[UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                CategaryLable.font = [UIFont systemFontOfSize:13];
                
                [ReadNameView addSubview:CategaryButton];
                [ReadNameView addSubview:CategaryLable];
            }
            
            
        }
        
        
    }
    
    UIButton * deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.frame = CGRectMake(30, 24 + 41 * 7, 20, 20);
    [deleteButton setImage:[UIImage imageNamed:@"bccyx_btn"] forState:UIControlStateNormal];
    [deleteButton setImage:[UIImage imageNamed:@"bccy_btn"] forState:UIControlStateSelected];
    deleteButton.selected = NO;
    [deleteButton addTarget:self action:@selector(DeletePress:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILabel * deletegaLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 15 + 41 * 7, kScreenW - 40  , 40)];
    deletegaLabel.text = @"我已阅读并同意<信托付使用协议>";
    deletegaLabel.font = [UIFont systemFontOfSize:13];
    deletegaLabel.textColor = [UIColor colorWithHexString:@"4e4e4e" withAlpha:1];
    deletegaLabel.textAlignment = NSTextAlignmentLeft;
    
    
    UIButton * NextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NextButton.backgroundColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    [NextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [NextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextButton.frame = CGRectMake(0, 24 + 41 * 8, kScreenW, 40);
    [NextButton addTarget:self action:@selector(NextPress:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.view.frame.size.height < NextButton.bottom + 64 ) {
        
        scroller.contentSize = CGSizeMake(kScreenW,NextButton.bottom + 84 - kScreenH );
        
        
    }
    
    
    [scroller addSubview:deleteButton];
    [scroller addSubview:deletegaLabel];
    [scroller addSubview:NextButton];
    
}

//类型按钮

-(void)CategaryPress:(UIButton *)sender{
    
    if (sender.selected == NO) {
        
        sender.selected = YES;
    }else
    {
    
        sender.selected = NO;
    }
    

}

//协议
-(void)DeletePress:(UIButton *)sender{

    if (sender.selected == NO) {
        
        sender.selected = YES;
        
    }
    else
    {
        sender.selected = NO;
    }
    

}
//下一步按钮
-(void)NextPress:(UIButton *)sender{



}
//查询按钮
-(void)ChaXunPress:(UIButton *)sender{


}
@end
