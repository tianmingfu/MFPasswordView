//
//  MFPasswordInputView.h
//  PasswordTextField
//
//  Created by 田明甫 on 2017/8/28.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MFPassWordInputDelegate <NSObject>

- (void)passwordInputView:(UIView *)inputView inputPassword:(NSString *)password passwordLenth:(NSInteger)lenth;

@end

@interface MFPasswordInputView : UIView
/**
 *  密码长度 默认6
 */
@property (nonatomic , assign ) NSUInteger passwordLength;

/**
 *  grid line color 默认紫色
 */
@property (nonatomic , strong) UIColor  *gridLineColor;
/**
 *  grid line width 默认1.0f
 */
@property (nonatomic , assign) CGFloat  gridLineWidth;
/**
 *  dot color 默认紫色
 */
@property (nonatomic , strong) UIColor  *dotColor;
/**
 *  dot width 默认12.0f
 */
@property (nonatomic , assign) CGFloat  dotWidth;

/**
 *  用户当前输入的密码个数 , 设置这个值,可以修改圆点显示
 */
@property (nonatomic , assign) NSInteger inputCount;



@property(nonatomic, weak) id<MFPassWordInputDelegate> delegate;
/**
 *  快速创建对象,
 *
 *  @param passwordLength 密码长度,默认6位
 *
 *  @return XLPasswordInputView实例对象
 */
+ (instancetype)passwordInputViewWithPasswordLength:(NSInteger)passwordLength;

@end
