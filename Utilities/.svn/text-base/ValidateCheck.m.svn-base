//
//  ValidateCheck.m
//  IPos
//
//  Created by hisuntech on 11-8-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ValidateCheck.h"

//BOOL isSelectAgreeProtol;
@implementation ValidateCheck

@synthesize Ok;
@synthesize phonenumStr;
@synthesize PHONE_PREFIX;
@synthesize INVALID_CH_CN;
@synthesize INVALID_LOGIN_PWD;
@synthesize INVALID_PAY_PWD;
@synthesize INVALID_CS;
@synthesize LOGIN_PWSSWORD_RULE;


+(BOOL)isValidWith:(NSString*)telNum
{

    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",IsValidOfTelNum];
    return [numberPre evaluateWithObject:telNum];
}
-(id)init{
	self = [super init];
    Ok = @"ok";
    phonenumStr = @"请输入11位中国移动手机号码！";
	
//    1349是电信卫通手机号
	PHONE_PREFIX =[[NSArray alloc] initWithObjects:@"134", @"135", @"136", @"137", @"138", @"139", @"150",
		@"151", @"152", @"157", @"158", @"159",@"182", @"183", @"184", @"187", @"188",@"147", nil];

	
	INVALID_CH_CN =[[NSArray alloc]initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F",
		@"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S",
		@"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"a", @"b", @"c", @"d", @"e", @"f",
		@"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s",
		@"t", @"u", @"v", @"w", @"x", @"y", @"z", @"0", @"1", @"2", @"3", @"4", @"5",
		@"6", @"7", @"8", @"9", @".", @",", @";", @":", @"!", @"@", @"/", @"(", @")",
		@"[", @"]", @"{", @"}", @"|", @"#", @"$", @"%", @"^", @"&", @"<", @">", @"?",
		@"\'", @"+", @"-", @"*", @"\\", @"\"",nil ];
				   
	INVALID_LOGIN_PWD = [ [NSArray alloc] initWithObjects:@" ", @".", @",", @";", @":", @"!",
		@"@", @"/", @"(", @")", @"[", @"]", @"{", @"}", @"|", @"#", @"$", @"%", @"^",
		@"&", @"<", @">", @"?",@ "\'", @"+", @"-",@"*", @"\\", @"\"",nil ];
				   
	INVALID_PAY_PWD = [[NSArray alloc] initWithObjects: @" ", @"A", @"B", @"C", @"D", @"E",
		@"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R",
		@"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"a", @"b", @"c", @"d", @"e",
		@"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r",
		@"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @".", @",", @";", @":", @"!",
		@"@", @"/", @"(", @")", @"[", @"]", @"{", @"}", @"|", @"#", @"$", @"%", @"^",
		@"&", @"<", @">", @"?", @"\'", @"+", @"-", @"*", @"\\", @"\"",nil];
				   
				   
	INVALID_CS= [[NSArray alloc]initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F",
		@"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S",
		@"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"a", @"b", @"c", @"d", @"e", @"f",
		@"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s",
		@"t", @"u", @"v", @"w", @"x", @"y", @"z", @"0", @"1", @"2", @"3", @"4", @"5",
		@"6", @"7", @"8", @"9",nil ];
	LOGIN_PWSSWORD_RULE = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()_+-=[]\\{}|;':,./<>?";
	
	return self;
}
					
	
//判断是否是移动号码
-(BOOL)checkMdnisMobile:(NSString *)Mdn{

    phonenumStr = @"请输入11位中国移动手机号码！";
	if ((Mdn ==nil)||([Mdn length]==0)) {
		return NO;
	}
	if([Mdn length]!=11){
		return NO;
	}
    //    1349是电信卫通手机号
    NSString *tmp=[Mdn substringWithRange:NSMakeRange(0, 4)];
    if ([tmp isEqualToString:@"1349"]) {
        return NO;
    }
    
	NSString *prefix=[Mdn substringWithRange:NSMakeRange(0, 3)];
	for (int i=0; i<[PHONE_PREFIX count]; i++) {

		if([prefix  isEqualToString:[PHONE_PREFIX objectAtIndex:i]]){
			return YES;
		}
		continue;
	}
	return NO;
}

//判断是否是正确手机号码
-(BOOL)checkMdn:(NSString *)Mdn{
    
    phonenumStr = @"请输入正确的11位手机号码！";
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

//校验银行卡号
-(BOOL)checkBankCardNum:(NSString *)cardNo{

    int sum = 0;
    int len = [cardNo length];
    int i = 0;
    
    if (len > 15 && len <= 25) {
        return YES;
    }
    return NO;
    
//    while (i < len) {
//        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(len - 1 - i, 1)];
//        int tmpVal = [tmpString intValue];
//        if (i % 2 != 0) {
//            tmpVal *= 2;
//            if(tmpVal>=10) {
//                tmpVal -= 9;
//            }
//        }
//        sum += tmpVal;
//        i++;
//    }
//    
//    if((sum % 10) == 0)
//        return YES;
//    else
//        return NO;
}


//判断身份证号码
- (BOOL)validateIDCardNumber:(NSString *)value {
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                              options:NSMatchingReportProgress
                                                                range:NSMakeRange(0, value.length)];
            
            [regularExpression release];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                              options:NSMatchingReportProgress
                                                                range:NSMakeRange(0, value.length)];
            
            [regularExpression release];
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return false;
    }
}


-(BOOL)checkCommonService:(NSString *)str{
	if (str == nil) {
		return NO;
	}
	for (int i=0; i<[str length]; i++) {
		BOOL flag=NO;
		for (int j=0; j<[INVALID_CS count]; j++) {
			if([[str substringWithRange:NSMakeRange(i, 1)] isEqualToString:[INVALID_CS objectAtIndex:j]])
				flag = YES;
		}
		if (flag) {
			break;
		}
		if (!flag) {
			return flag;
		}
	}
	return YES;
	

}
-(BOOL)checkCN:(NSString *)str{
	if (str == nil) {
		return NO;
	}
	
	for (int i=0; i<[str length]; i++) {
		for (int j=0; j<[INVALID_CH_CN count]; j++) {
			if([[str substringWithRange:NSMakeRange(i, 1)] isEqualToString:[INVALID_CH_CN objectAtIndex:j]])
				return NO;
		}
	}
	
	return YES;
}


-(BOOL)checkFloatMoney:(NSString *)str{
	if ((str==nil) ||([str length]==0)) {
		return NO;
	}
	
	if ([[str substringWithRange:NSMakeRange(0, 1)] intValue]==46) {
		return NO;
	}
	
	for (int i=0; i<[str length]; i++) {
		int c=[[str substringWithRange:NSMakeRange(i, 1)] intValue];
		if (c==46||(c>=48&&c<=57)) {
			continue;
		}else {
			return NO;
		}

	}
	
	return YES;
}

-(BOOL)checkRMK:(NSString *)str{
	if (str == nil) {
		return NO;
	}
	for (int i=0; i<[str length]; i++) {
		int c = [[str substringWithRange:NSMakeRange(i, 1)] intValue];
		if (c!=35&&c!=37&&c!=38&&c!=42&&c!=60&&c!=62&&c!=94) {
			continue;
		}else {
			return NO;
		}

	}
	return YES;
}

//判断输入金额是否小于零
-(BOOL)checkMoney:(NSString *)money{
	if ([self checkFloatMoney:money]) {
		if ([money floatValue]>0) {
			if ([[money substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
				if ([[money substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"0."])  {
					return YES;
				}
				return NO;
			}
			if ([[money substringWithRange:NSMakeRange([money length], 1)] isEqualToString:@"."]) {
				return NO;
			}
			return YES;
		}else {
			return NO;
		}

	}else {
		return NO;
	}

}

//判断是否为数字
-(BOOL)checkNum:(NSString *)str{
	if (str == nil ||[str length]==0) {
		return NO;
	}

	for (int i=0; i<[str length]; i++) {
	//char c=(char)[[str substringWithRange:NSMakeRange(i, 1)] UTF8String];
		unsigned char c = [str characterAtIndex:i];
		if (c>=48&&c<=57) {
			continue;
		}else {
			return NO;
		}

	}
	return YES;
}

//验证登录秘密
-(BOOL)checkLoginPassword:(NSString *)str{
	if (str == nil ||[str length]==0) {
		return NO;
	}
	for (int i=0; i<[str length]; i++) {
		if (NSEqualRanges([LOGIN_PWSSWORD_RULE rangeOfString:[str substringWithRange:NSMakeRange(i, 1)]],NSMakeRange(NSNotFound, 0))) {
			return NO;
		}

	}
	return YES;
}

//验证登录信息

-(NSString *)checkLogin:(NSString *)phoneNumber password:(NSString *)password{
	if (phoneNumber ==  nil ||[phoneNumber length]==0) {
		return @"请输入手机号码！";
	}else if(![self checkMdn:phoneNumber]) {
		 return phonenumStr;
	}else if (![self checkNum:phoneNumber]) {
		return @"手机号码存在非法字符！";
	}else if (password == nil || [password length]==0) {
		return @"请输入支付密码";
	}else if ([password length]<6) {
		return @"支付密码位数不足！";
	}else if ([password length]>6) {
		return @"支付密码位数超过6位";
	}

	return Ok;

}


-(NSString *)checkSMSMdn:(NSString *)phoneNumber isSelectAgreeProtol:(BOOL)isSelectAgreeProtol{
    NSLog(@"begin check msm dn ======== %@",phoneNumber);
	if (phoneNumber == nil || [phoneNumber length]==0) {
		return @"请输入手机号码！";
	}else if (![self checkMdn:phoneNumber]) {
		return phonenumStr;
	}else if (![self checkNum:phoneNumber]) {
		return @"手机号码存在非法字符！";
	}else if (!isSelectAgreeProtol) {
		return @"请查看并选择同意开户协议，再获取短信验证码。";
	}
	return Ok;
}


-(NSString *)checkRegisterFirst:(NSString *)phoneNumber SMSCode:(NSString *)SMSCode checkFlag:(BOOL)checkFlag{
	if (phoneNumber == nil || [phoneNumber length]==0) {
		return @"请输入手机号码";
	}else if (![self checkMdn:phoneNumber]) {
        return  phonenumStr;
	}else if (SMSCode == nil||[SMSCode length]!=6) {
		return @"请输入6位短信验证码！";
	}else if (!checkFlag) {
		return @"请查看并同意开户协议，再申请注册。";
	}
	return Ok;
	
}

-(NSString *)checkRegisterSecForLoginPwd:(NSString *)setLoginPassword resetLoginPassword:(NSString *)resetLoginPassword{

	if ([setLoginPassword length]<6||[setLoginPassword length]>16) {
		return @"输入6－16位的登录密码！";
	}else if (![setLoginPassword isEqualToString:resetLoginPassword]) {
		return @"两次输入的登录密码不同，请重新输入！";
	}else if (![self checkLoginPassword:setLoginPassword]) {
		return @"登录密码是6－16位数字，字母，字符组合";
	}
	return Ok;
}


-(NSString *)checkRegisterSecForPayPwd:(NSString *)setPayPassword resetPayPassword:(NSString *)resetPayPassword{
	if ([setPayPassword length]!=6) {
		return @"输入6位数字的支付密码";
	}else if (![setPayPassword isEqualToString:resetPayPassword]) {
		return @"两次输入的支付密码不同，请重新输入";
	}else if (![self checkNum:setPayPassword]) {
		return @"支付密码为6位纯数字";
	}
	return Ok;
}


+(NSString *) checkIDNoForCreaditCard:(NSString*) idNo {
    if ([idNo length] != 18) {
        return @"身份证号码位数错误。";
    }
    
    int mm = 0;
    int gg[18] = {0};
    
    NSString* M = idNo;
    
    int xx[] = { 2, 4, 8, 5, 10, 9, 7, 3, 6, 1, 2, 4, 8, 5, 10, 9, 7 };
    char yy[] = { '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' };
    
    for (int i = 1; i < 18; i++) {
        int j = 17 - i;
        NSRange rng = NSMakeRange(j, 1);       
        gg[i-1] = [[M substringWithRange:rng]intValue];
        
    }
    
    for (int i = 0; i < 17; i++) {
        mm += xx[i] * gg[i];
    }
    mm = mm % 11;
    char c = [M characterAtIndex:17];
    
    if (c == yy[mm]) {
        return @"ok";
    }
    else {
        return @"身份证号码有误";
    }
}

//邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


-(void)dealloc{
	[Ok release];
	[PHONE_PREFIX release];
	[INVALID_CH_CN release];
	[INVALID_LOGIN_PWD release];
	[INVALID_PAY_PWD release];
	[INVALID_CS release];
	[LOGIN_PWSSWORD_RULE release];
    [super dealloc];

}

@end
