//
//  PurseViewController.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/10.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "PurseViewController.h"
#import "MoreCell.h"
#import "PurseHeaderReusableView.h"
#import "PurseFooterReusableView.h"
#import "BalanceMoneyViewController.h"
@interface PurseViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionView *_collection;
    MoreCell *_cell;
}

@property(nonatomic,retain)NSArray *headImageArr;
@property(nonatomic,retain)NSArray *nameArr;

@end

@implementation PurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColor(246, 246, 246, 1);
    [self setLeftItemToBack];
    [self loadData];
    [self createCollection];
}

- (void)loadData{
    self.headImageArr = @[@"qb_ye_btn",@"qb_yhkgl_btn",@"qb_zzhk_btn",@"qb_zhcz_btn",@"qb_zhtx_btn",@"qb_yelc_btn"];
    self.nameArr = @[@"余额",@"银行卡管理",@"转账汇款",@"账户充值",@"账户提现",@"余额理财"];
}

- (void)createCollection{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,kScreenW,kScreenH-64)collectionViewLayout:layout];
    _collection.dataSource = self;
    _collection.delegate = self;
    _collection.backgroundColor = [UIColor whiteColor];
    [_collection registerClass:[MoreCell class] forCellWithReuseIdentifier:@"purse"];
    [self.view addSubview:_collection];
    //注册footerView Nib的view需要继承UICollectionReusableView
    [_collection registerClass:[PurseFooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    [_collection registerClass:[PurseHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    _collection.showsVerticalScrollIndicator = NO;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"purse" forIndexPath:indexPath];
    _cell.middle.text = self.nameArr[indexPath.row];
    _cell.logo.image = [UIImage imageNamed:[self.headImageArr objectAtIndex:indexPath.row]];
    return _cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    PurseFooterReusableView *footer = nil;
    PurseHeaderReusableView *header = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        footer = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"Footer"   forIndexPath:indexPath];
        return footer;
    }else{
        header = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"header"   forIndexPath:indexPath];
        return header;
    }
}

////返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    CGSize size={0,10};
    return size;
}

//返回头footerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    
    CGSize size={kScreenW,kScreenH - kScreenW/2-64-10};
    return size;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(kScreenW/4, kScreenW/4);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)sectio{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
     [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        BalanceMoneyViewController *Balance = [[BalanceMoneyViewController alloc]init];
        Balance.title = @"账户余额";
        [self.navigationController pushViewController:Balance animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
