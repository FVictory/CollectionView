//
//  WealthController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/9.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "WealthController.h"
#import "MaintCell.h"
#import "MoreCell.h"
#import "FooterReusableView.h"
#import "NextFooterView.h"
#import "HeaderReusableView.h"
#import "GatheringViewController.h"
#import "SystemManageController.h"
#import "PurseViewController.h"
#import "AccountBookViewController.h"
#import "MinePayViewController.h"
#import "AccountDrawViewController.h"
#import "NewsCenterViewController.h"
#import "RechargeViewController.h"
#import "MoreViewController.h"
#import "SecuritySettingViewController.h"

@interface WealthController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionView *_collection;
    MoreCell *_cell;
}
@property(nonatomic,retain)NSArray *fristImageArr;
@property(nonatomic,retain)NSArray *secondeImageArr;
@property(nonatomic,retain)NSArray *fristNameArr;
@property(nonatomic,retain)NSArray *secondNameArr;

@end

@implementation WealthController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"信托付"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    [self createCollection];
}

- (void)loadData{
    self.fristImageArr = @[@"home_sk_btn",@"home_qianbao_btn",@"home_zb_btn",@"home_wdzf_btn",@"home_zhtx_btn",@"home_xxzx_btn"];
    self.secondeImageArr = @[@"home_xtgl_btn",@"home_aqsz_btn",@"home_zhcz_btn",@"home_gd_btn"];
    self.fristNameArr = @[@"收款",@"钱包",@"账本",@"我的支付",@"账户提现",@"消息中心"];
    self.secondNameArr = @[@"系统管理",@"安全设置",@"账户充值",@"更多"];
}

- (void)createCollection{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,kScreenW,kScreenH-64)collectionViewLayout:layout];
    _collection.dataSource = self;
    _collection.delegate = self;
    _collection.backgroundColor = [UIColor whiteColor];
    [_collection registerClass:[MaintCell class] forCellWithReuseIdentifier:@"ID"];
    [_collection registerClass:[MoreCell class] forCellWithReuseIdentifier:@"More"];
    [self.view addSubview:_collection];
    //注册footerView Nib的view需要继承UICollectionReusableView
    [_collection registerClass:[FooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    [_collection registerClass:[NextFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"NectFooter"];
    [_collection registerClass:[HeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    _collection.showsVerticalScrollIndicator = NO;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MaintCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
        cell.middle.text = self.fristNameArr[indexPath.row];
        cell.logo.image = [UIImage imageNamed:[self.fristImageArr objectAtIndex:indexPath.row]];
        return cell;
    }
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"More" forIndexPath:indexPath];
    _cell.middle.text = self.secondNameArr[indexPath.row];
    _cell.logo.image = [UIImage imageNamed:[self.secondeImageArr objectAtIndex:indexPath.row]];
    return _cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            GatheringViewController *gathering = [[GatheringViewController alloc]init];
            gathering.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:gathering animated:YES];
        }else if (indexPath.row == 1){
            PurseViewController *purse = [[PurseViewController alloc]init];
            purse.hidesBottomBarWhenPushed = YES;
            purse.title = @"钱包";
            [self.navigationController pushViewController:purse animated:YES];
        }else if (indexPath.row == 2){
            AccountBookViewController *accountBook = [[AccountBookViewController alloc]init];
            accountBook.title = @"账本";
            accountBook.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:accountBook animated:YES];
        }else if (indexPath.row == 3){
            MinePayViewController *minePay = [[MinePayViewController alloc]init];
            minePay.title = @"我的支付";
            minePay.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:minePay animated:YES];
        }else if (indexPath.row == 4){
            AccountDrawViewController *accountDraw = [[AccountDrawViewController alloc]init];
            accountDraw.title =@"账户提现";
            accountDraw.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:accountDraw animated:YES];
        }else {
            NewsCenterViewController *news = [[NewsCenterViewController alloc]init];
            news.title = @"消息中心";
            news.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:news animated:YES];
        }
        
    }else{
        if (indexPath.row == 0) {
            SystemManageController *system = [[SystemManageController alloc]init];
            system.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:system animated:YES];
        }else if (indexPath.row == 1){
            SecuritySettingViewController *security = [[SecuritySettingViewController alloc]init];
            security.title = @"安全设置";
            security.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:security animated:YES];
        }else if (indexPath.row == 2){
            RechargeViewController *recharge = [[RechargeViewController alloc]init];
            recharge.title = @"账户充值";
            recharge.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:recharge animated:YES];
        }else{
            MoreViewController *more = [[MoreViewController alloc]init];
            more.title = @"更多";
            more.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:more animated:YES];
        }
    }
    
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FooterReusableView *footer = nil;
        HeaderReusableView *header = nil;
        if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
            footer = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"Footer"   forIndexPath:indexPath];
            return footer;
        }else{
            
            header = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"header"   forIndexPath:indexPath];
            return header;
        }
        
    }else{
        NextFooterView *view = nil;
        if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
            view = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"NectFooter"  forIndexPath:indexPath];
        }
        return view;
    }
}

////返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        CGSize size={kScreenW,AD_SCROLLVIEW_HEIGHT};
        return size;
    }
    CGSize size={0,0};
    return size;
}

//返回头footerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        CGSize size={kScreenW,70*proportionHeight};
        return size;
    }
    CGSize size={kScreenW,10*proportionHeight};
    return size;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenW/3.0, kScreenW/3.0);
    }
    return CGSizeMake(kScreenW/4, kScreenW/4);
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)sectio{
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
