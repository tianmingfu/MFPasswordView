//
//  UIColor+MFPassword.h
//  PasswordTextField
//
//  Created by 田明甫 on 2017/8/28.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MFPassword)

/**
 *
 *  @param color 从十六进制字符串获取颜色，color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/**
 *  从十六进制字符串获取颜色，color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 *  @param color 十六进制字符串
 *  @param alpha 透明度
 *
 *  @return 返回的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 *  返回一个随机颜色 , 透明度是1
 */
+ (UIColor *)mf_randomColor;


@end
