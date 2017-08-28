//
//  PowerEnterUITextField.h
//  PowerEnterUITextField
//
//  Created by 刘旺 on 14-12-30.
//  Copyright 2014年 科蓝公司. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class PowerEnterUITextField;
typedef void(^DoneButtonAction)(PowerEnterUITextField *powerEnterUITextField);
typedef void(^InputContentsChanged) (PowerEnterUITextField *powerEnterUITextField);

typedef enum {
    Landscape=0,    //横着
    All,            //全支持
    Portrait        //竖着
}Orientation;

typedef enum {
    Full=0,               //全键盘
       Number              //数字键盘
}PasswordKeyboardType;  //密码键盘类型


typedef enum {
    DefaultPassword=0,            //默认密码
    PinPassword,                 //Pin密码(Pin密码校验platformPublicKey是否为空，为空返回－5)
    AllPassword
}ValueType;                     //密码类型

typedef enum {
    PopupBtn=0,
    HighlightBtn,
    NoEffect
}KeyboardBtnEffectType;

typedef enum {
    defaultPin = 0,
    PinFormat,
    PinFormatWithAcc
}X98Tpye;

@class Keyboard;
@interface PowerEnterUITextField : UITextField
{
    DoneButtonAction doneButtonAction;
    InputContentsChanged inputContentsChanged;
    ValueType valueType;
    PasswordKeyboardType passwordKeyboardType;      //键盘类型
    BOOL isRoundam;                                 //是否是乱序随机键盘
    BOOL isSound;                                   //是否播放按键声音（默认是播放键盘声音）
    BOOL isVibration;                               //是否开启按键震动（默认是关闭键盘震动）
    KeyboardBtnEffectType isHighlightKeybutton;     //是否开启按键加亮
    X98Tpye x98Type;
    
    int maxLength;                                  //键盘输入最大长度
    int minLength;                                  //键盘输入最小长度
    NSString *accountNum;                           //主账号
    NSString *accepts;                              //输入规则（正则表达式）
    NSString *timestamp;                            //时间戳
    NSString *setCalcFactor;                        //重放因子
    NSString *value;                                //密码密文
    NSString *account;
    NSString *price;
    NSString *pinValue;                             //密码密文
    NSString *plaintext;                            //密码明文
    NSString *ciphertext;                           //明文密文
    NSString *SM2PublicKey;                            //国密公钥
    NSString *platformPublicKey;                    //平台密钥匙
    NSString *codeMap;                                  //映射
    NSString *appPlatformPublicKey;                 //应用平台公钥
    NSString *desKey;                 //应用平台公钥
    Orientation orientation;
    
    Keyboard *keyboard;
}
@property (nonatomic, copy) DoneButtonAction doneButtonAction;
@property (nonatomic, copy) InputContentsChanged inputContentsChanged;
@property (nonatomic, assign) PasswordKeyboardType passwordKeyboardType;
@property (nonatomic, assign) ValueType valueType;

//针对新版iPad键盘的属性（实际的方向控制根据UIViewController和项目设定来进行控制）
//（Landscape为横屏，用在横屏的UIViewController中，横屏为默认属性，默认iPad键盘为横屏）
//（All为全部支持，用在方向自适应的UIViewController中）
//（Portrait为竖屏，用在竖屏的UIViewController中）
@property (nonatomic, assign) Orientation orientation;
@property (nonatomic, assign) X98Tpye x98Type;
@property (nonatomic, assign) BOOL isRoundam;
@property (nonatomic, assign) BOOL isSound;
@property (nonatomic, assign) BOOL isVibration;
@property (nonatomic, assign) KeyboardBtnEffectType isHighlightKeybutton;
@property (nonatomic, assign) int maxLength;
@property (nonatomic, assign) int minLength;
@property (nonatomic, copy) NSString *accountNum;
@property (nonatomic, copy) NSString *accepts;
@property (nonatomic, copy) NSString *timestamp;
@property (nonatomic, copy) NSString *setCalcFactor;
@property (nonatomic, copy) NSString *SM2PublicKey;
@property (nonatomic, copy) NSString *platformPublicKey;
@property (nonatomic, copy) NSString *codeMap;    //映射
@property (nonatomic, copy) NSString *appPlatformPublicKey;
@property (nonatomic, copy) NSString *desKey;
@property (nonatomic, copy,getter=getValue) NSString *value;
@property (nonatomic, copy,getter=getPinValue) NSString *pinValue;
@property (nonatomic, copy) NSString *plaintext;
@property (nonatomic, copy,getter=getPlainValue) NSString *ciphertext;
/**
 * 密码校验
 */
-(void)closeKeyboard;
-(int)verify;
-(int)numberdegree;
-(NSString *)getPasswordDigest;
-(int)checkPswdContents;
-(void)changeKeyboard;
-(void)initialization;
-(void)clear;
-(NSString*)getEncryptData:(NSString*)timestamp:(NSString*)text;
//#endif

@end
