//
//  UIView+MFFrame.h
//  PasswordTextField
//
//  Created by 田明甫 on 2017/8/28.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import <UIKit/UIKit.h>


#define MFScreenBounds [UIScreen mainScreen].bounds
#define MFScreenSize [UIScreen mainScreen].bounds.size
#define MFScreenW [UIScreen mainScreen].bounds.size.width
#define MFScreenH [UIScreen mainScreen].bounds.size.height
#define MF_autoSizeScaleX ([UIScreen mainScreen].bounds.size.width / 750)
#define MF_autoSizeScaleY ([UIScreen mainScreen].bounds.size.height / 1334)
#define MFKeyWindow [UIApplication sharedApplication].windows.firstObject


@interface UIView (MFFrame)


@property (nonatomic, assign) CGFloat mf_height;
@property (nonatomic, assign) CGFloat mf_width;
@property (nonatomic, assign) CGFloat mf_x;
@property (nonatomic, assign) CGFloat mf_y;
@property (nonatomic, assign) CGSize mf_size;
@property (nonatomic, assign) CGFloat mf_centerX;
@property (nonatomic, assign) CGFloat mf_centerY;


@end
