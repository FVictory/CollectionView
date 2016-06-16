//
//  GuideController.m
//  ktx
//
//  Created by allen on 15/6/25.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "GuideController.h"

@interface GuideController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollerView;

@end

@implementation GuideController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    UIView *backView =[[UIView alloc]initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor whiteColor];
    backView.userInteractionEnabled = YES;
    [self.view addSubview:backView];
    self.scrollerView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    BOOL isBeforeIphone5 = (kScreenH/ kScreenW < 1.7)?YES:NO;
    NSMutableArray *imageNameArr = [NSMutableArray array];
    for (int i = 0; i < GuidItemCount; i++) {
        NSString *imageName;
        if (isBeforeIphone5){
            imageName =[ NSString stringWithFormat:@"guide_%d",i+1];
        }else{
            imageName =[ NSString stringWithFormat:@"guide_%d_568",i+1];
        }
        [imageNameArr addObject:imageName];
    }
    for (int i = 0; i < imageNameArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenW, 0, kScreenW, kScreenH)];
        imageView.image = [UIImage imageNamed:[imageNameArr objectAtIndex:i]];
        
        if (i == imageNameArr.count - 1) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake((kScreenW - 134)/2, kScreenH - (isBeforeIphone5 ? 122: 135 * ProportionH), 134, 30);
            [button setBackgroundColor:[UIColor redColor]];
            [button setImage:[UIImage imageNamed:@"ty"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"ty_selected"] forState:UIControlStateHighlighted];
            
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            button1.frame = self.view.bounds;
            [button1 addTarget:self action:@selector(postLogin) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button1];
        }
        
        self.scrollerView.pagingEnabled = YES;
        self.scrollerView.scrollEnabled = YES;
        self.scrollerView.contentSize = CGSizeMake(kScreenW*imageNameArr.count, kScreenH);
        
        [self.scrollerView addSubview:imageView];
        self.scrollerView.delegate = self;
        imageView.userInteractionEnabled = YES;
    }
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    self.scrollerView.bounces = NO;
    [backView addSubview:self.scrollerView];
    
}

- (void)postLogin
{
    [[NSNotificationCenter defaultCenter] postNotificationName:GuideFinshPicture object:nil];
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    [def setObject:@"HAS" forKey:@"INSTALL"];
    [def synchronize];
}

@end
