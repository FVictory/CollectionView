//
//  MessageCell.m
//  atrustpay
//
//  Created by qiuqiu on 15/9/14.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell



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
    
    self.headImage =[[UIImageView alloc]initWithFrame:CGRectMake(20, 12, 20, 20)];
    [self.contentView addSubview:self.headImage];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(self.headImage.right+10, 7, 120, 30)];
    self.name.font = [UIFont systemFontOfSize:15.0];
    self.name.textColor = kColor(78, 78, 78, 1);
    [self.contentView addSubview:self.name];
    
    self.arrow = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-10-20, 17, 10, 10)];
    self.arrow.image =[UIImage imageNamed:@"aqenter_btn"];
    [self.contentView addSubview:self.arrow];
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
