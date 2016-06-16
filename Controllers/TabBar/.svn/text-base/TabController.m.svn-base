//
//  TabController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/9.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "TabController.h"
#import "CheckStandController.h"
#import "MineController.h"
#import "ServiceController.h"
#import "WealthController.h"
#import "GuideController.h"
#import "LoginController.h"

@interface TabController ()

@property (nonatomic,strong) GuideController *guideView;
@property (nonatomic,assign) BOOL firstInstall;

@end

@implementation TabController

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    if (self.firstInstall) {
        self.guideView = [[GuideController alloc]init];
        [self.view addSubview:self.guideView.view];
    }else{
        [self judgeGestureOrLogin];
    }
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:GuideFinshPicture object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ChangeIndex object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(guidePictureFinished) name:GuideFinshPicture object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeIndex) name:ChangeIndex object:nil];
    [self isFirstInstall];
    [self createTabBar];
}

- (void)guidePictureFinished
{
    self.firstInstall = NO;
    [UIView animateWithDuration:0.3 animations:^{
        [self.guideView.view removeFromSuperview];
        [self showLogin];
    } completion:^(BOOL finished) {
    }];
}

- (void)showLogin{
    LoginController *login =[[LoginController alloc]init];
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:login];
    [self presentViewController:nc animated:YES completion:^{
        
    }];
}

- (void)judgeGestureOrLogin{
    if (![UserModel sharedModel].isShow) {
        if ([self hasGesture]) {
            [self showGestureView];
        }else{
            [self showLogin];
        }
    }
}

- (void)showGestureFromLaunch
{
    if (![UserModel sharedModel].isShow) {
        if ([self hasGesture]) {
            [self showGestureView];
        }else{
            [self showLogin];
        }
    }
}

#pragma 手势密码
- (BOOL)hasGesture{
    
    if ([UserModel sharedModel].userId == nil || [[UserModel sharedModel].userId isEqualToString:@""]) {
        return  NO;
    }
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *gesKey = [NSString stringWithFormat:@"%@Gesture",[UserModel sharedModel].userId];
    NSString *gesPassword = [def objectForKey:gesKey];
    if ([gesPassword isEqualToString:@""]||gesPassword == nil) {
        return NO;
    }
    return YES;
}

#pragma mark -显示手势界面
- (void)showGestureView{
//    GesturePasswordViewController *ges = [[GesturePasswordViewController alloc]initWithGesterType:GesturePasswordTypeNormal];
//    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:ges];
//    [self presentViewController:nc animated:NO completion:^{
//        [UserModel sharedModel].isNeedAlert = YES;
//    }];
}


#pragma mark 引导页相关
- (void)isFirstInstall{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *install = [def objectForKey:@"INSTALL"];
    if ([install isEqualToString:@"HAS"]) {
        self.firstInstall = NO;
    }else{
        self.firstInstall = YES;
    }
    [def synchronize];
}

- (void)changeIndex
{
    self.selectedIndex = 0;
}

- (void)createTabBar{
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#69bfee" withAlpha:1],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName : [UIColor whiteColor]
                                                        }forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName : [UIColor blackColor]
                                                        }forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#69bfee" withAlpha:1]
                                                        }forState:UIControlStateSelected];
    //财富
    WealthController*wealth=[[WealthController alloc]init];
    //我
    MineController*mine=[[MineController alloc]init];
    //收银台
    CheckStandController*checkStand=[[CheckStandController alloc]init];
    //服务
    ServiceController*service=[[ServiceController alloc]init];
    NSMutableArray *vcArr = [NSMutableArray arrayWithObjects:wealth,mine,checkStand,service,nil];
    
    NSArray *titleArr = @[WEALTH,MINE,CHECKSTAND,SERVICE];
    NSArray *picArr = @[@"cfgray_btn",@"mygray_btn",@"sytgray_btn",@"fwgray_btn"];
    NSArray *selectPicArr = @[@"cf_btn",@"my_btn",@"syt_btn",@"fw_btn"];
    for (int i = 0; i < vcArr.count; i++) {
        UIViewController *vc = vcArr[i];
        vc.title = titleArr[i];
        UINavigationController *nc =[[UINavigationController alloc]initWithRootViewController:vc];
        [nc.tabBarItem setImage:[[UIImage imageNamed:picArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [nc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectPicArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vcArr replaceObjectAtIndex:i withObject:nc];
    }
    self.viewControllers = vcArr;
    
    
    self.tabBar.backgroundColor=[UIColor whiteColor];
    self.tabBar.barTintColor= [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
