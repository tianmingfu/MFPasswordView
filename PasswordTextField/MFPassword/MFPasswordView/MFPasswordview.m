//
//  MFPasswordview.m
//  PasswordTextField
//
//  Created by 田明甫 on 2017/8/28.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "MFPasswordview.h"
#import "PowerEnterUITextField.h"
#import "UIView+MFFrame.h"
#import "UIColor+MFPassword.h"
#import "MFPasswordInputView.h"
#define kPasswordLenght 6

@interface MFPasswordview ()<MFPassWordInputDelegate>
/**
 *  背景视图
 */
@property (nonatomic , strong) UIView *backgroundView;
/**
 *  密码输入视图容器视图
 */
@property (nonatomic , strong) UIView  *inputContainerView;

/**
 *  密码输入视图
 */
@property (nonatomic , strong) MFPasswordInputView  *passwordInputView;

/**
 *  忘记密码label
 */
@property (nonatomic , weak) UILabel *forgetPasswordLabel;


///**
// 提交中
// */
//@property (nonatomic, strong) UIImageView *imgRotation;
//@property (nonatomic, strong) UILabel *lblMessage;
//

@end

@implementation MFPasswordview



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initial];
    }
    return self;
}

- (void)initial {
    
    
    self.backgroundView = ({
        UIView *tempView = [[UIView alloc] init];
        tempView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3f];
        [self addSubview:tempView];
        [tempView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCloseButton)]];
        tempView;
    });
    self.inputContainerView = ({
        UIView *tempView = [[UIView alloc] init];
        tempView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        [self addSubview:tempView];
        tempView.frame = CGRectMake(0, MFScreenH, MFScreenW, MFScreenW * 0.6 + 820*MF_autoSizeScaleY);
        tempView;
    });
    
    UILabel *titleLabel = ({
        UILabel *tempLabel = [[UILabel alloc] init];
        tempLabel.backgroundColor = [UIColor clearColor];
        tempLabel.text = @"输入密码";
        tempLabel.numberOfLines = 1;
        tempLabel.textColor = TmfColor(@"#445c95");
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.font = TmfSetFont(16);
        [tempLabel sizeToFit];
        tempLabel.mf_centerX = MFScreenW * 0.5;
        tempLabel.mf_centerY = 90 * MF_autoSizeScaleY * 0.5;
        tempLabel;
    });
    [self.inputContainerView addSubview:titleLabel];
    

    UIView *separateView = ({
        UIView *tempView = [[UIView alloc] init];
        tempView.backgroundColor = [UIColor clearColor];
        tempView.frame = CGRectMake(0, 90 * MF_autoSizeScaleY, MFScreenW, 0.5);
        tempView.backgroundColor = TmfColor(@"#dddddd");
        tempView;
    });
    [self.inputContainerView addSubview:separateView];

    
    UIButton *closeButton = ({
        UIButton *button = [[UIButton alloc] init];
        
       
        [button setImage:[UIImage imageNamed:@"XLPasswordView.bundle/payment_shutdown"] forState:UIControlStateNormal];
        button.mf_x = 0;
        button.mf_y = 0;
        button.mf_width = 50;
        button.mf_height = 90 * MF_autoSizeScaleY;
        [button addTarget:self action:@selector(clickCloseButton) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self.inputContainerView addSubview:closeButton];



    self.passwordInputView = ({
       
        MFPasswordInputView *inputView = [MFPasswordInputView passwordInputViewWithPasswordLength:kPasswordLenght];
        inputView.delegate = self;
        CGFloat gridWidth = 115 * MF_autoSizeScaleX;
        inputView.gridLineColor = TmfColor(@"#aab3c8");
        inputView.gridLineWidth = 1;
        inputView.dotColor = [UIColor colorWithHexString:@"ccccce"];
        inputView.dotWidth = 12;
        inputView.mf_width = kPasswordLenght * gridWidth;
        inputView.mf_height = 90*MF_autoSizeScaleX;
        inputView.mf_centerX = MFScreenW * 0.5;
        inputView.mf_y = 150 * MF_autoSizeScaleY;

        inputView;
    
    });
    [self.inputContainerView addSubview:self.passwordInputView];
    
    
    
    UILabel *forgetPasswordLabel = ({
        UILabel *tempLabel = [[UILabel alloc] init];
        tempLabel.backgroundColor = [UIColor clearColor];
        tempLabel.text = @"忘记密码?";
        tempLabel.userInteractionEnabled = YES;
        tempLabel.numberOfLines = 1;
        tempLabel.textColor = TmfColor(@"#aab3c8");
        tempLabel.textAlignment = NSTextAlignmentRight;
        tempLabel.font = TmfSetFont(13);
        tempLabel.mf_height = 40;
        tempLabel.mf_width = 106;
        tempLabel.backgroundColor = [UIColor clearColor];

        
        tempLabel.mf_y = CGRectGetMaxY(self.passwordInputView.frame) + 3;
        tempLabel.mf_x = CGRectGetMaxX(self.passwordInputView.frame)- tempLabel.mf_width;
        [tempLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickForgetPasswordLabel)]];
        tempLabel;
    });
    self.forgetPasswordLabel = forgetPasswordLabel;
    [self.inputContainerView addSubview:forgetPasswordLabel];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundView.frame = self.bounds;
}

/**
 *  展示
 *
 *  @param view 添加到的目的视图
 */
- (void)showPasswordInView:(UIView *)view
{
    self.frame = MFKeyWindow.bounds;
    if (view == nil) {
        [MFKeyWindow addSubview:self];
    } else {
        [view addSubview:self];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5f];
        self.inputContainerView.mf_y = MFScreenH-820*MF_autoSizeScaleY;
    } completion:^(BOOL finished) {
        
    }];
}

/**
 *  点击忘记密码
 */
- (void)clickForgetPasswordLabel
{
//    if ([self.delegate respondsToSelector:@selector(passwordViewClickForgetPassword:)]) {
//        [self.delegate passwordViewClickForgetPassword:self];
//    }
}

/**
 退出密码键盘视图
 */
- (void)clickCloseButton {
    
    [self hidePasswordView];

}

/**
 *  隐藏
 */
- (void)hidePasswordView
{
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3f];
        self.inputContainerView.mf_y = MFScreenH;
    } completion:^(BOOL finished) {
        self.backgroundView = nil;
        [self removeFromSuperview];
    }];
}

- (void)drawRect:(CGRect)rect {
    
}
#pragma mark - =========MFPassWordInputDelegate =========

- (void)passwordInputView:(UIView *)inputView inputPassword:(NSString *)password passwordLenth:(NSInteger)lenth{
    
    
    if (lenth==kPasswordLenght) {
        
        [self.forgetPasswordLabel removeFromSuperview];
        [self.passwordInputView removeFromSuperview];
        
        
        
    }
    
    
}

//
//- (UIImageView *)imgRotation {
//    if (_imgRotation == nil) {
//        _imgRotation = [[UIImageView alloc] init];
//        _imgRotation.image = IMAGE(@"password_loading_a");
//        [_imgRotation sizeToFit];
//        _imgRotation.hidden = YES;
//    }
//    return _imgRotation;
//}
//
//- (UILabel *)lblMessage {
//    if (_lblMessage == nil) {
//        _lblMessage = [[UILabel alloc] init];
//        _lblMessage.text = @"支付中...";
//        _lblMessage.hidden = YES;
//        _lblMessage.textColor = [UIColor darkGrayColor];
//        _lblMessage.textAlignment = NSTextAlignmentCenter;
//        [_lblMessage sizeToFit];
//    }
//    return _lblMessage;
//}
//


@end
