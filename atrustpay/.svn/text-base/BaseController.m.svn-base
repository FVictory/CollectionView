//
//  BaseController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/9.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setLeftItemToBack
{
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleBordered target:self action:@selector(backPop)];
    self.navigationItem.leftBarButtonItem = back;
}

-(void)toastResult:(NSString *) toastMsg{
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:toastMsg
                          message:nil
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}

- (void)backPop
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
