//
//  BalanceCell.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/11.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "BalanceCell.h"

@implementation BalanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, kScreenW, 1)];
    line.backgroundColor =kColor(246, 246, 246, 1);
    [self.contentView addSubview:line];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(50, 7, 70, 30)];
    self.name.font = [UIFont systemFontOfSize:14.0];
    self.name.textColor = kColor(78, 78, 78, 1);
    [self.contentView addSubview:self.name];
    
    self.info = [[UILabel alloc]initWithFrame:CGRectMake(self.name.right, 7, 200, 30)];
    self.info.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:self.info];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
