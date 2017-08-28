//
//  UIView+MFFrame.m
//  PasswordTextField
//
//  Created by 田明甫 on 2017/8/28.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "UIView+MFFrame.h"

@implementation UIView (MFFrame)


- (CGSize)mf_size
{
    return self.frame.size;
}

- (void)setMf_size:(CGSize)mf_size
{
    CGRect frame = self.frame;
    frame.size = mf_size;
    self.frame = frame;
}

- (CGFloat)mf_width
{
    return self.frame.size.width;
}

- (void)setMf_width:(CGFloat)mf_width
{
    CGRect rect = self.frame;
    rect.size.width = mf_width;
    self.frame = rect;
}

- (CGFloat)mf_height
{
    return self.frame.size.height;
}

- (void)setMf_height:(CGFloat)mf_height
{
    CGRect rect = self.frame;
    rect.size.height = mf_height;
    self.frame = rect;
}

- (CGFloat)mf_x
{
    return self.frame.origin.x;
}

- (void)setMf_x:(CGFloat)mf_x
{
    CGRect rect = self.frame;
    rect.origin.x = mf_x;
    self.frame = rect;
}

- (CGFloat)mf_y
{
    return self.frame.origin.y;
}

- (void)setMf_y:(CGFloat)mf_y
{
    CGRect rect = self.frame;
    rect.origin.y = mf_y;
    self.frame = rect;
}

- (CGFloat)mf_centerX
{
    return self.center.x;
}

- (void)setMf_centerX:(CGFloat)mf_centerX
{
    CGPoint point = self.center;
    point.x = mf_centerX;
    self.center = point;
}

- (CGFloat)mf_centerY
{
    return self.center.y;
}

- (void)setMf_centerY:(CGFloat)mf_centerY
{
    CGPoint point = self.center;
    point.y = mf_centerY;
    self.center = point;
}


@end
