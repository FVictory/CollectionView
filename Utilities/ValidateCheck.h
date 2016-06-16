//
//  ValidateCheck.h
//  IPos
//
//  Created by hisuntech on 11-8-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



@interface ValidateCheck : NSObject {
    NSString *phonenumStr;
    NSString *Ok;
	NSArray *PHONE_PREFIX;
	NSArray *INVALID_CH_CN;
	NSArray *INVALID_LOGIN_PWD;
	NSArray *INVALID_PAY_PWD;
	NSArray *INVALID_CS;
	NSString *LOGIN_PWSSWORD_RULE;
	
}
@property (nonatomic,retain) NSString *phonenumStr;
@property (nonatomic,retain) NSString *Ok;
@property (nonatomic,retain) NSArray *PHONE_PREFIX;
@property (nonatomic,retain) NSArray *INVALID_CH_CN;
@property (nonatomic,retain) NSArray *INVALID_LOGIN_PWD;
@property (nonatomic,retain) NSArray *INVALID_PAY_PWD;
@property (nonatomic,retain) NSArray *INVALID_CS;
@property (nonatomic,retain) NSString *LOGIN_PWSSWORD_RULE;


/**
 校验手机号码是否正确
 @return Bool
 */
+(BOOL)isValidWith:(NSString*)telNum;
//+(ValidateCheck *)shareSingleton;
//判断是否是移动号码
-(BOOL)checkMdnisMobile:(NSString *)Mdn;
//判断是否是正确的手机号码
-(BOOL)checkMdn:(NSString *)Mdn;
-(BOOL)checkCommonService:(NSString *)str;
-(BOOL)checkCN:(NSString *)str;
-(BOOL)checkFloatMoney:(NSString *)str;
-(BOOL)checkRMK:(NSString *)str;
-(BOOL)checkMoney:(NSString *)money;
-(BOOL)checkNum:(NSString *)str;
-(BOOL)checkLoginPassword:(NSString *)str;
//校验身份证号
- (BOOL)validateIDCardNumber:(NSString *)value;
//校验银行卡号
-(BOOL)checkBankCardNum:(NSString *)cardNo;
//邮箱
+ (BOOL)validateEmail:(NSString *)email;


-(NSString *)checkLogin:(NSString *)phoneNumber password:(NSString *)password;
-(NSString *)checkSMSMdn:(NSString *)phoneNumber isSelectAgreeProtol:(BOOL)isSelectAgreeProtol;
-(NSString *)checkRegisterFirst:(NSString *)phoneNumber SMSCode:(NSString *)SMSCode checkFlag:(BOOL)ckeckFlag;
-(NSString *)checkRegisterSecForLoginPwd:(NSString *)setLoginPassword resetLoginPassword:(NSString *)resetLoginPassword;
-(NSString *)checkRegisterSecForPayPwd:(NSString *)setPayPassword resetPayPassword:(NSString *)resetPayPassword;
//校验身份证号
+(NSString *) checkIDNoForCreaditCard:(NSString*) idNo;
@end
