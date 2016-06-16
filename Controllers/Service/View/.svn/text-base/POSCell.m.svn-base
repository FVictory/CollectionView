//
//  POSCell.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/14.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "POSCell.h"

@implementation POSCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 120, 120)];
    self.headImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.headImageView];
    self.arrow = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-30, 65, 10, 10)];
    self.arrow.image =[UIImage imageNamed:@"aqenter_btn"];
    [self.contentView addSubview:self.arrow];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.headImageView.right+10, self.headImageView.top, 200, 20)];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:15];
    self.nameLabel.textColor = kColor(55, 55, 55, 1);
    [self.contentView addSubview:self.nameLabel];
    
    self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.headImageView.right+10, self.nameLabel.bottom, kScreenW -self.headImageView.right-10-10-30, 70)];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.textColor = kColor(95, 95, 95, 1);
    self.detailLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.detailLabel];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.detailLabel.left, self.detailLabel.bottom, 150, 30)];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.font = [UIFont systemFontOfSize:18];
    self.priceLabel.textColor = [UIColor colorWithHexString:@"#69bfee" withAlpha:1];
    [self.contentView addSubview:self.priceLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
