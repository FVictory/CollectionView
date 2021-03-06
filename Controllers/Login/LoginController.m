//
//  LoginController.m
//  atrustpay
//
//  Created by い大雄 on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "LoginController.h"
#import "UIColor+YUColor.h"

@interface LoginController ()

@end

@implementation LoginController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"登录";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
- (void)createUI{
    
    CGFloat y =  0.0;
    // logo
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
    UIImageView * logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dlogo_btn"]];
    logo.center = CGPointMake(kScreenW/2.0, 120);
    [self.view addSubview:logo];
    //
    NSArray * arrayLable = @[@"账号：",@"密码："];
    NSArray * phArr = @[@"请输入手机号",@"请输入密码"];
    for (int i =0 ; i <  arrayLable.count; i++) {
        UIImageView * img = [[UIImageView alloc]initWithImage:[Tools createImageWithColor:[UIColor whiteColor]]];
        img.frame = CGRectMake(20,logo.bottom+30+i*50 , kScreenW - 40, 40);
        img.clipsToBounds = YES;
        img.layer.cornerRadius = 5;
        img.userInteractionEnabled = YES;
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 50, 30)];
        lable.text = arrayLable[i];
        lable.font = [UIFont systemFontOfSize:16];
        lable.textColor = [UIColor colorWithHexString:@"#a0a0a0"];
        [img addSubview:lable];
        UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(lable.right, 5, img.width-lable.right-10, 30)];
        textField.placeholder = phArr[i];
        textField.font = [UIFont systemFontOfSize:15];
        [img addSubview:textField];
       
        [self.view addSubview:img];
        if (i == 1) {
            y = img.bottom;
        }
    };
    
    NSArray * btnArr = @[@"快速注册",@"忘记密码？"];
    for (int i = 0; i < btnArr.count; i++) {
        UIButton * btn = [UIButton  buttonWithType:UIButtonTypeCustom];
        btn.tag = 1000 + i;
        [btn setTitle:btnArr[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(5+i*(kScreenW-110), y+5, 100, 30) ;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor colorWithHexString:@"#009fe9" withAlpha:1] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        if (i == 1) {
            [btn setTitleColor:[UIColor colorWithHexString:@"#686868" withAlpha:1] forState:UIControlStateNormal];
            y = btn.bottom;
        }
        [btn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    };
    
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    [login setTitle:@"登录" forState:UIControlStateNormal];
    login.frame = CGRectMake(20, y+10, kScreenW-40, 45);
    login.titleLabel.font = [UIFont systemFontOfSize:15];
    login.backgroundColor = [UIColor colorWithHexString:@"#009ee6"];
    [login setTitleColor:[UIColor colorWithHexString:@"#FFFFFF" withAlpha:1] forState:UIControlStateNormal];
    [login addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    login.tag = 1002;
    [self.view addSubview:login];
    
}

- (void)btnTapped:(UIButton *)sender{
    
    switch (sender.tag) {
        case 1000:
           
            break;
            
        case 1001:
            
            break;
            
        case 1002:
            [UserModel sharedModel].isShow = YES;
            [self goToMainView];
            break;
            
        default:
            break;
    }
}

#pragma mark 跳转到主页面
-(void)goToMainView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:ChangeIndex object:nil];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
