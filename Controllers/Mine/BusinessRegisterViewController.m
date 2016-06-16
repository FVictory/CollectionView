//
//  BusinessRegisterViewController.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "BusinessRegisterViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface BusinessRegisterViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

{
    NSArray *BussinesMessage;
    
    UIButton * YingYeButton;//营业牌照
    UIButton * ShenFenButton1;//身份正面
    UIButton * ShenFenButton2;//身份反面
    
    UITextField *NameField;//姓名
    UITextField *IDField;//身份证号
    UITextField *MailField;//电子邮箱
    
    
    UITextField *BusinessName;//商户名称
    UITextField *SelectField;//选择省、市
    UITextField *DetailField;//详细地址
    UITextField *RangeField;//经营范围
    UITextField *NumberField;//营业执照号码
    
    
    UITextField *BankField;//开户行
    UITextField *SelectBankField;//选择开户支行省
    UITextField *BankNameFiled;//开户支行名称
    UITextField *AccountField;//结算银行
    UITextField *BankAccountField;//银行账户
    
    
    UIScrollView *scroller;
    

}

@property(nonatomic, strong)UIView *BackView1;//法人信息界面
@property(nonatomic, strong)UIView *BackView2;//商户信息界面
@property(nonatomic, strong)UIView *BackView3;//结算信息界面
@property(nonatomic, strong)UIView *BackView4;//图像界面



@end

@implementation BusinessRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    BussinesMessage = [NSArray arrayWithObjects:@"法人信息",@"商户信息",@"结算信息", nil];
    
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setLeftItemToBack];
    scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH - 64-49)];

    
    [self CreatView];
    [self CreatView1UI];
    [self CreatView2UI];
    [self CreatView3UI];
    [self creatScroller];

    _BackView1.hidden = NO;
    _BackView2.hidden = YES;
    _BackView3.hidden = YES;
    [self creatImage];

}


-(void)creatScroller{
    
    
    
//    scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH - 64-49)];
    scroller.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    scroller.userInteractionEnabled = YES;
    scroller.bounces = NO;
    scroller.scrollEnabled = YES;
    scroller.showsHorizontalScrollIndicator = NO;
    scroller.showsVerticalScrollIndicator = NO;
//    scroller.contentSize = CGSizeMake(kScreenW, kScreenH);
    [self.view addSubview:scroller];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    
}
-(void)CreatView{
    
    _BackView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 134 - 64, kScreenW, kScreenH - 64)];
    _BackView1.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    _BackView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 134 - 64, kScreenW, kScreenH - 64)];
    _BackView2.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    _BackView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 134 - 64, kScreenW, kScreenH - 64)];
    _BackView3.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    self.BackView4 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 134 - 64)];
    self.BackView4.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    
    [scroller addSubview:_BackView3];
    [scroller addSubview:_BackView2];
    [scroller addSubview:_BackView1];
    [scroller addSubview:_BackView4];

    
}

-(void)creatImage
{
    
    for (int i = 0;  i < BussinesMessage.count; i++) {
        
        
        UIImageView *MessageImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        MessageImage.center = CGPointMake((kScreenW -180)/3 + ((kScreenW - 180)/3+60)*i, 20);
        MessageImage.image = [UIImage imageNamed:@"shzcgray_btn"];
        if (_BackView1.hidden == NO) {
            
            if (i == 0) {
                MessageImage.image = [UIImage imageNamed:@"shzc_btn"];
            }
            
        }
        if (_BackView2.hidden == NO) {
            
            if (i < 2) {
                
                MessageImage.image = [UIImage imageNamed:@"shzc_btn"];
            }
            
        }
        if(_BackView3.hidden == NO){
            
            MessageImage.image = [UIImage imageNamed:@"shzc_btn"];
            
            
        }
        
        UIView * MessageView = [[UIView alloc]init];
        if (i < 2) {
            
            MessageView.backgroundColor = [UIColor whiteColor];
            MessageView.frame = CGRectMake((kScreenW -180)/3+ 5+ ((kScreenW - 180)/3+60)*i, 20, (kScreenW - 30)/3, 2);
            
            if (_BackView2.hidden == NO) {
                
                if (i == 0) {
                    
                    MessageView.backgroundColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
                    
                }
                
            }
            if (_BackView3.hidden == NO) {
                
                MessageView.backgroundColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
                
            }
            
            
            [_BackView4 addSubview:MessageView];
        }
        
        
        UILabel *MessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 10)];
        MessageLabel.center = CGPointMake((kScreenW -180)/3 + ((kScreenW - 180)/3+60)*i, 40);
        MessageLabel.font = [UIFont systemFontOfSize:13];
        MessageLabel.text = BussinesMessage[i];
        MessageLabel.textColor = [UIColor colorWithRed:104/255 green:104/255 blue:104/255 alpha:1];
        
        
        [_BackView4 addSubview:MessageImage];
        [_BackView4 addSubview:MessageLabel];
        
    }
    
    
}

-(void)CreatView1UI{
    
    
    NSArray *BussinesName = [NSArray arrayWithObjects:@"姓       名",@"身份证号",@"电子邮箱", nil];
    NSArray *BussinesPloce = [NSArray arrayWithObjects:@"输入商户真实姓名",@"输入商户身份证号",@"输入常用电子邮箱", nil];
    
    for(int i = 0; i < BussinesName.count; i++){
        
        UIView * BussinesView = [[UIView alloc]initWithFrame:CGRectMake(0, 43 * i, kScreenW, 40)];
        BussinesView.backgroundColor = [UIColor whiteColor];
        BussinesView.tag = 1100 + i;
        
        UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 70, 40)];
        NameLabel.text = BussinesName[i];
        NameLabel.textColor = [UIColor colorWithHexString:@"4e4e4e" withAlpha:1];
        NameLabel.textAlignment = NSTextAlignmentLeft;
        NameLabel.font = [UIFont systemFontOfSize:16];
        
        [_BackView1 addSubview:BussinesView];
        [BussinesView addSubview:NameLabel];
        
        
        switch (i) {
            case 0:
            {
                NameField = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, kScreenW - 100, 40)];
                NameField.placeholder = BussinesPloce[i];
                NameField.font = [UIFont systemFontOfSize:13];
                NameField.textAlignment = NSTextAlignmentLeft;
                NameField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:NameField];

            }
                break;
                
            case 1:
            {
                IDField = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, kScreenW - 100, 40)];
                IDField.placeholder = BussinesPloce[i];
                IDField.font = [UIFont systemFontOfSize:13];
                IDField.textAlignment = NSTextAlignmentLeft;
                IDField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:IDField];
            }
                break;
            case 2:
            {
            
                MailField = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, kScreenW - 100, 40)];
                MailField.placeholder = BussinesPloce[2];
                MailField.font = [UIFont systemFontOfSize:13];
                MailField.textAlignment = NSTextAlignmentLeft;
                MailField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:MailField];
            
            }
            default:
                break;
        }
        
        
        
    }
    
    
    NSArray * PictoreName = [NSArray arrayWithObjects:@"请拍摄身份证正面",@"请拍摄身份证反面", nil];
    for(int i = 0;i < PictoreName.count; i++){
        
        UILabel * ShenFenLabel = [[UILabel alloc]initWithFrame:CGRectMake((30 +150*i)*ProportionW ,  43*3 + 18 , 120, 10)];
        ShenFenLabel.text = PictoreName[i];
        ShenFenLabel.textColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
        ShenFenLabel.font = [UIFont systemFontOfSize:13];
    
        
        [_BackView1 addSubview:ShenFenLabel];
    }
    
    
    ShenFenButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    ShenFenButton1.frame = CGRectMake(30,  43*3 + 38, 120, 60);
    ShenFenButton1.tag = 150;
    [ShenFenButton1 setImage:[UIImage imageNamed:@"ps_btn"] forState:UIControlStateNormal];
    [ShenFenButton1 addTarget:self action:@selector(ShenFenPress:) forControlEvents:UIControlEventTouchUpInside];
    [_BackView1 addSubview:ShenFenButton1];
    
    
    
    ShenFenButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    ShenFenButton2.frame = CGRectMake(180,  43*3 + 38, 120, 60);
    ShenFenButton2.tag = 151;
    [ShenFenButton2 setImage:[UIImage imageNamed:@"ps_btn"] forState:UIControlStateNormal];
    [ShenFenButton2 addTarget:self action:@selector(ShenFenPress:) forControlEvents:UIControlEventTouchUpInside];
    [_BackView1 addSubview:ShenFenButton2];
    
    
    
    UIButton * NextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NextButton.frame = CGRectMake(0, 250,kScreenW, 40);
    [NextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [NextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextButton.backgroundColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    [NextButton addTarget:self action:@selector(NextPress:) forControlEvents:UIControlEventTouchUpInside];
    [_BackView1 addSubview:NextButton];
}

-(void)CreatView2UI{
    
    
    NSArray *BusessMessArr = [NSArray arrayWithObjects:@"商户名称",@"选择省、市名称",@"详细地址",@"经营范围",@"营业执照号码", nil];
    NSArray *BuserPlaceArr = [NSArray arrayWithObjects:@"输入商户名称",@"选择省、市名称",@"输入详细地址",@"输入经营范围",@"输入营业执照号码", nil];
    
    for(int i = 0; i < BusessMessArr.count; i++){
        
        UIView * BussinesView = [[UIView alloc]initWithFrame:CGRectMake(0, 43 * i, kScreenW, 40)];
        BussinesView.backgroundColor = [UIColor whiteColor];
        BussinesView.tag = 1103+i;
        
        UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
        NameLabel.text = BusessMessArr[i];
        NameLabel.textColor = [UIColor colorWithHexString:@"4e4e4e" withAlpha:1];
        NameLabel.textAlignment = NSTextAlignmentRight;
        NameLabel.font = [UIFont systemFontOfSize:16];
        
        [_BackView2 addSubview:BussinesView];
        [BussinesView addSubview:NameLabel];
        
        
        
        switch (i) {
            case 0:
            {
                BusinessName = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                BusinessName.placeholder = BuserPlaceArr[0];
                BusinessName.font = [UIFont systemFontOfSize:13];
                BusinessName.textAlignment = NSTextAlignmentLeft;
                BusinessName.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:BusinessName];

            
            }
                break;
            case 1:
            {
                SelectField= [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                SelectField.placeholder = BuserPlaceArr[1];
                SelectField.font = [UIFont systemFontOfSize:13];
                SelectField.textAlignment = NSTextAlignmentLeft;
                SelectField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
            
                [BussinesView addSubview:SelectField];

            }
                break;
            case 2:
            {
                DetailField = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                DetailField.placeholder = BuserPlaceArr[2];
                DetailField.font = [UIFont systemFontOfSize:13];
                DetailField.textAlignment = NSTextAlignmentLeft;
                DetailField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:DetailField];

            
            }
                break;
                
            case 3:
            {
            
                RangeField = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                RangeField.placeholder = BuserPlaceArr[3];
                RangeField.font = [UIFont systemFontOfSize:13];
                RangeField.textAlignment = NSTextAlignmentLeft;
                RangeField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:RangeField];

            }
                break;
            case 4:
            {
                NumberField = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                NumberField.placeholder = BuserPlaceArr[4];
                NumberField.font = [UIFont systemFontOfSize:13];
                NumberField.textAlignment = NSTextAlignmentLeft;
                NumberField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:NumberField];

            
            
            }
                break;
            default:
                break;
        }
        
        
        
    }
    
    
    UILabel *YingYeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 10)];
    YingYeLabel.center = CGPointMake(kScreenW/2, 230);
    YingYeLabel.text = @"请拍摄营业执照正面";
    YingYeLabel.textColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    YingYeLabel.font = [UIFont systemFontOfSize:13];
    
    
    YingYeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    YingYeButton.frame =   CGRectMake(0, 0, 120, 60);
    YingYeButton.center = CGPointMake(kScreenW/2, 270);
    YingYeButton.tag = 152;
    [YingYeButton setImage:[UIImage imageNamed:@"ps_btn"] forState:UIControlStateNormal];
    [YingYeButton addTarget:self action:@selector(ShenFenPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [_BackView2 addSubview:YingYeLabel];
    [_BackView2 addSubview:YingYeButton];
    
    UIButton * NextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NextButton.frame = CGRectMake(0, 320,kScreenW, 40);
    [NextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [NextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextButton.backgroundColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    [NextButton addTarget:self action:@selector(NextPress:) forControlEvents:UIControlEventTouchUpInside];
    [_BackView2 addSubview:NextButton];
    

    _BackView2.frame = CGRectMake(0, 70, kScreenW, NextButton.bottom);
    if (_BackView2.bottom > kScreenH - 64- 49 - 70) {
        
        scroller.contentSize = CGSizeMake(kScreenW, _BackView2.bottom + 20);
        
        
        
        
    }
    
    
    
}

-(void)CreatView3UI{
    

    NSArray *BuserPlaceArr3 = [NSArray arrayWithObjects:@"选择结算账户开户行",@"选择开户支行省、市名称",@"输入开户支行名称",@"输入结算银行账户名称,即银行卡绑定的姓名",@"输入银行账户", nil];
    NSArray *BusesMessArr3 = [NSArray arrayWithObjects:@"开户行",@"开户支行省市名称",@"开户支行名称",@"结算银行",@"银行账户", nil];
    
    for(int i = 0; i < BuserPlaceArr3.count; i++){
        
        UIView * BussinesView = [[UIView alloc]initWithFrame:CGRectMake(0, 43 * i, kScreenW, 40)];
        BussinesView.backgroundColor = [UIColor whiteColor];
        BussinesView.tag = 1108+i;
        
        UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
        NameLabel.text = BusesMessArr3[i];
        NameLabel.textColor = [UIColor colorWithHexString:@"4e4e4e" withAlpha:1];
        NameLabel.textAlignment = NSTextAlignmentRight;
        NameLabel.font = [UIFont systemFontOfSize:16];
        
       
        
        [_BackView3 addSubview:BussinesView];
        [BussinesView addSubview:NameLabel];
        
        
        
        switch (i) {
            case 0:
            {
                BankField= [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                BankField.placeholder = BuserPlaceArr3[0];
                BankField.font = [UIFont systemFontOfSize:13];
                BankField.textAlignment = NSTextAlignmentLeft;
                BankField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:BankField];

            
            }
                break;
            case 1:
            {
                SelectBankField = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                SelectBankField.placeholder = BuserPlaceArr3[1];
                SelectBankField.font = [UIFont systemFontOfSize:13];
                SelectBankField.textAlignment = NSTextAlignmentLeft;
                SelectBankField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:SelectBankField];

            }
                break;
            case 2:
            {
                BankNameFiled = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                BankNameFiled.placeholder = BuserPlaceArr3[2];
                BankNameFiled.font = [UIFont systemFontOfSize:13];
                BankNameFiled.textAlignment = NSTextAlignmentLeft;
                BankNameFiled.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:BankNameFiled];

            
            }
                break;
            case 3:
            {
                AccountField = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                AccountField.placeholder = BuserPlaceArr3[3];
                AccountField.font = [UIFont systemFontOfSize:13];
                AccountField.textAlignment = NSTextAlignmentLeft;
                AccountField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:AccountField];

            }
                break;
            case 4:
            {
                BankAccountField = [[UITextField alloc]initWithFrame:CGRectMake(130, 0, kScreenW - 130, 40)];
                BankAccountField.placeholder = BuserPlaceArr3[4];
                BankAccountField.font = [UIFont systemFontOfSize:13];
                BankAccountField.textAlignment = NSTextAlignmentLeft;
                BankAccountField.textColor = [UIColor colorWithRed:151/255 green:151/255 blue:151/255 alpha:1];
                [BussinesView addSubview:BankAccountField];

            
            }
                break;
            default:
                break;
        }
        
        
        
    }
    
    UIButton * NextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NextButton.frame = CGRectMake(0, 250,kScreenW, 40);
    NextButton.tag = 902;
    [NextButton setTitle:@"提交审核" forState:UIControlStateNormal];
    [NextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextButton.backgroundColor = [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    [NextButton addTarget:self action:@selector(NextPress:) forControlEvents:UIControlEventTouchUpInside];
    [_BackView3 addSubview:NextButton];
    
    
    
//    _BackView3.frame = CGRectMake(0, 70, kScreenW, NextButton.bottom);
//    if (_BackView3.bottom > kScreenH - 64- 49 - 70) {
//        
//        scroller.contentSize = CGSizeMake(kScreenW, _BackView3.bottom + 20);
//        
//    }

    
}




//点击下一步
-(void)NextPress:(UIButton *)sender{
    
    if (_BackView1.hidden == NO) {
        _BackView1.hidden = YES;
        _BackView2.hidden = NO;
        _BackView3.hidden = YES;
        
        for (UIView *v in self.BackView4.subviews) {
            [v removeFromSuperview];
        }
        [self creatImage];
        return;
    }
    if (_BackView2.hidden == NO)
    {
    
        _BackView1.hidden = YES;
        _BackView2.hidden = YES;
        _BackView3.hidden = NO;
        for (UIView *v in self.BackView4.subviews) {
            [v removeFromSuperview];
        }
        [self creatImage];

        
        return;
    
    }
    if (_BackView3.hidden == NO) {
        
        
        
        return;
    }
    
    
    
    
}

// 拍摄身份证
-(void)ShenFenPress:(UIButton *)sender{
    
    
    if(sender.tag == 150){
    
        [self addCarema];
        
        
    }else if (sender.tag == 151){
    
        [self addCarema];
    }else if (sender.tag == 152){
    
    
        [self addCarema];
    }
    
    
    
}

-(void)addCarema{
    //判断是否可以打开相机，模拟器此功能无法使用

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
            
            //无权限
            //如果没有提示用户
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"请在系统设置拍照权限" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [alert show];
            
            
        }else{
        
        
            UIImagePickerController * picker = [[UIImagePickerController alloc]init];
            picker.delegate = self;
            //摄像头
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:nil];
        }
        
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"你没有摄像头" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
    
        [alert show];
    }
    


}

#pragma mark -UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

        
        
    }];




}

//返回
-(void)backPop{
    
    if (_BackView1.hidden == NO) {
        
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    if (_BackView2.hidden == NO) {
        
        _BackView1.hidden = NO;
        _BackView2.hidden = YES;
        _BackView3.hidden  = YES;
        
        for (UIView *v in self.BackView4.subviews) {
            [v removeFromSuperview];
        }
        [self creatImage];

        
        return;
        
    }
    if (_BackView3.hidden == NO) {
        
        _BackView1.hidden = YES;
        _BackView2.hidden = NO;
        _BackView3.hidden  = YES;
        
        for (UIView *v in self.BackView4.subviews) {
            [v removeFromSuperview];
        }
        [self creatImage];

        
        return;
        
    }
    
    
}


@end
