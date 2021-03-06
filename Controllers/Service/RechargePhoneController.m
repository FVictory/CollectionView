//
//  RechargePhoneController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "RechargePhoneController.h"
#import "ValidateCheck.h"

@interface RechargePhoneController ()<UITextFieldDelegate>
{
    UITextField *_phoneFeild;
    UIButton* _tmpBtn;
}
@end

@implementation RechargePhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftItemToBack];
    _tmpBtn = nil;
    self.view.backgroundColor = kColor(246, 246, 246, 1);
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64+10, kScreenW, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 7, 80, 30)];
    nameLabel.text = @"手机号码";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [view addSubview:nameLabel];
    _phoneFeild = [[UITextField alloc]initWithFrame:CGRectMake(nameLabel.right, 7, 180, 30)];
    _phoneFeild.keyboardType = UIKeyboardTypeNumberPad;
    _phoneFeild.font= [UIFont systemFontOfSize:14];
    _phoneFeild.placeholder = @"请输入需要充值的手机号码";
    _phoneFeild.delegate = self;
    [view addSubview:_phoneFeild];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW -30 , 12, 20, 20)];
    imageView.image = [UIImage imageNamed:@"sjcz_lxr_btn"];
    [view addSubview:imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, view.bottom+10, 10, 10);
    [button setBackgroundImage:[UIImage imageNamed:@"sjcz_bccywxz_btn"] forState:UIControlStateNormal];
    button.tag = 100;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *selectLab = [[UILabel alloc]initWithFrame:CGRectMake(button.right+5, view.bottom+5, 120, 20)];
    selectLab.text = @"保存常用充值号码";
    selectLab.tintColor = kColor(246, 246, 246, 1) ;
    selectLab.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:selectLab];
    CGFloat space = (kScreenW-100*3)/4;
    
    for (int i=0;i<3;i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(space+i%3*(100+space), selectLab.bottom+20, 100, 50);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = 101+i;
        if (btn.tag == 101){
            [btn setTitle:@"50元" forState:UIControlStateNormal];
            _tmpBtn = btn;
            btn.selected = YES;
            [btn setBackgroundColor:kColor(255, 184, 42, 1)];
        }
        if (btn.tag == 102){
            [btn setTitle:@"100元" forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor colorWithHexString:@"#949494" withAlpha:1]];
        }
        if (btn.tag == 103){
            [btn setTitle:@"200元" forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor colorWithHexString:@"#949494" withAlpha:1]];
        }
        
        [self.view addSubview:btn];
    }
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(0, selectLab.bottom+70+30, kScreenW, 40);
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    nextButton.backgroundColor =  [UIColor colorWithHexString:@"#009fe9" withAlpha:1];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.tag = 110;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    
}

- (void)btnClick:(UIButton *)sender{
    if (sender.tag == 110) {
        
    }
    if (sender.tag == 100) {
        if (sender.selected) {
            [sender setBackgroundImage:[UIImage imageNamed:@"sjcz_bccywxz_btn"] forState:UIControlStateNormal];
        } else {
            [sender setBackgroundImage:[UIImage imageNamed:@"sjcz_bccy_btn"] forState:UIControlStateNormal];
        }
        sender.selected = !sender.selected;
    }else{
        for (int i = 0; i<3; i++) {
            [_phoneFeild resignFirstResponder];
            BOOL checkPhoneNumMsg = [ValidateCheck isValidWith:_phoneFeild.text];
            if (_phoneFeild.text == nil||[@"" isEqual:_phoneFeild.text]) {
                [self toastResult:@"请输入手机号"];
                return;
            }
            if (checkPhoneNumMsg == NO){
                [self toastResult:@"手机号输入有误"];
                return;
            }
            if (_tmpBtn == nil){
                sender.selected = YES;
                _tmpBtn = sender;
            }
            else if (_tmpBtn !=nil && _tmpBtn == sender){
                sender.selected = YES;
                
            }
            else if (_tmpBtn!= sender && _tmpBtn!=nil){
                _tmpBtn.selected = NO;
                [_tmpBtn setBackgroundColor:[UIColor colorWithHexString:@"#949494" withAlpha:1]];
                sender.selected = YES;
                [sender setBackgroundColor:kColor(255, 184, 42, 1)];
                _tmpBtn = sender;
                
            }
        }
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _phoneFeild) {
        if (string.length == 0) return YES;
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 11) {
            
            return NO;
        }
    }
    return YES;
}
#pragma mark - 判断手机号是否正确
-(BOOL)checkMdn:(NSString *)Mdn{
    
    if ((Mdn ==nil)||([Mdn length]==0)) {
        return NO;
    }
    if([Mdn length]!=11){
        return NO;
    }
    
    NSString *two=[Mdn substringWithRange:NSMakeRange(0, 2)];
    if ([two isEqualToString:@"13"]||
        [two isEqualToString:@"14"]||
        [two isEqualToString:@"15"]||
        [two isEqualToString:@"18"]
        ) {
        return YES;
    }
    
    return NO;
    
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField.text.length > 11) {
        textField.text = [textField.text substringToIndex:11];
    }
}
/**
 *  <#Description#>
 *
 *  @param textField <#textField description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_phoneFeild resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
