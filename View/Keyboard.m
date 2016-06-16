//
//  Keyboard.m
//  atrustpay
//
//  Created by 范胜利 on 15/9/13.
//  Copyright (c) 2015年 itazk. All rights reserved.
//

#import "Keyboard.h"

@interface Keyboard()
{
    BOOL flag;
}
@end

@implementation Keyboard
//初始化，用两层for循环来创建的键盘
-(id)initWithFrame:(CGRect)frame
{
    
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor colorWithHexString:@"#f5f5f5" withAlpha:1];
        //初始化显示的是0
        self.result=[[NSMutableString alloc]initWithFormat:@"￥0.00"];
        flag=YES;
        int width=frame.size.width;
        int height=frame.size.height;
        
        for (int i=0; i<5; i++) {
            for (int j=0; j<3; j++) {
                
                if ((i==4)&&(j==0)) {
                    //这里创建的是按键 0 的按钮，因为按键 0 占了两个，宽度是原先的两倍，并且跳过下一次的按钮创建
                    b=[[UIButton alloc]initWithFrame:CGRectMake(10+5*j+j*((width-20-10)/3), i*((height-20-10)/5)+10+i*5, (width-20)/1.5, (height-20-10)/5)];
                    b.backgroundColor=[UIColor whiteColor];
                    b.tag=(i+1)*10+(j+1);//设置tag的值
//                    [b.layer setBorderWidth:1];//设置边框
                    [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    b.titleLabel.font = [UIFont systemFontOfSize:24];
                    [b setTitle:@"收款" forState:UIControlStateNormal];
                    [b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                    [b setBackgroundColor:[UIColor colorWithHexString:@"#46c76d" withAlpha:1]];
                    [self addSubview:b];
                    j++;
                    continue;
                    
                }
                
                //按钮的创建，按钮的宽高是通过计算得出来的，为了屏幕适配
                b=[[UIButton alloc]initWithFrame:CGRectMake(10+5*j+j*((width-20-10)/3), i*((height-20-10)/5)+10+i*5, (width-20-10)/3, (height-20-10)/5)];
                b.backgroundColor=[UIColor whiteColor];
                b.titleLabel.font = [UIFont systemFontOfSize:30];
//                [b.layer setBorderWidth:1];
                b.tag=(i+1)*10+(j+1);
                [b setTitleColor:[UIColor colorWithHexString:@"#7d7d7d" withAlpha:1] forState:UIControlStateNormal];
                [self addSubview:b];
                
                
                if (j<3&&i<3) {//在这里，为数字按键赋显示的值
                    int num = j+i*3+1;//num 的值可以通过计算得出来，与i、j相关
                    NSString *s=[NSString stringWithFormat:@"%d",num];//把int转成字符串，并给按钮赋值
                    [b setTitle:s forState:UIControlStateNormal];
                    [b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                    //这里为数字按键设置方法、因为数字是一类的，所以都用一个方法
                }
                switch (b.tag) {
                        //这里为其他的功能键设置显示和按键的方法
                    case 41:
                        [b setTitle:@"00" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 42:
                        [b setTitle:@"0" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 43:
                        [b setTitle:@"." forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(decimal:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 53:
                        [b setTitle:@"←" forState:UIControlStateNormal];
                        [b setBackgroundColor:[UIColor colorWithHexString:@"#f0c658" withAlpha:1]];
                        [b addTarget:self action:@selector(clearNum) forControlEvents:UIControlEventTouchDown];
                        break;
                    default:
                        break;
                }
            }
        }
    }
    
    return self;
}

-(void)decimal:(UIButton*)btn
{
    if ([self.result isEqualToString:@""])
    {
        [self.result appendString:@"0."];
    }
    else
    {
        [self.result appendString:@"."];
    }
    
}

//数字按钮的方法
-(void)number:(UIButton*)btn
{
    
    if ([self.result isEqualToString:@"￥0.00"]) {
        [self.result setString:@"￥"];
        //如果初始状态为0，先置空一下，这样做的目的是为了在显示的时候不会开头还带着一个0
    }
    
    //这里的result是可变字符串，这样才可以对自己进行更改，添加
    [self.result appendString:btn.titleLabel.text];
    //把所有的输入拼接起来，得到一个完整的多位数字
    self.num1=[self.result doubleValue];//转成
    
    //这里是取到父视图，通过tag取到label，但是注意一点，，通过tag取到的是视图对象，这里先强制类型转换一下，然后用uilabel对象接收，这样就可以操作者的label对象
    
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.textAlignment = NSTextAlignmentCenter;
    l.text= self.result;
}

-(void)clearNum
{
    //清除按钮
    if ([self.result isEqualToString:@"￥0.00"]) {
        return;
    }
    NSInteger len = self.result.length-1;
    [self.result deleteCharactersInRange:NSMakeRange(len, 1)];
    if (len==1) {
        [self.result setString:@"￥0.00"];
    }
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
    len--;
}


@end
