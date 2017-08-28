//
//  MFPasswordInputView.m
//  PasswordTextField
//
//  Created by 田明甫 on 2017/8/28.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "MFPasswordInputView.h"
#import "UIView+MFFrame.h"
#import "UIImage+MFPassword.h"
#import "PowerEnterUITextField.h"
@interface MFPasswordInputView ()
/**
 * 密码框图片
 */
@property (nonatomic , weak) UIImageView *backgroundImageView;
/**
 *  底部的输入框,用来响应用户点击弹出键盘
 */
@property (nonatomic , strong) PowerEnterUITextField *textField;
/**
 *  小圆点图片数组
 */
@property (nonatomic , strong) NSArray  *dotsArray;



@end
@implementation MFPasswordInputView
/**
 *  懒加载成员属性
 */
- (NSArray *)dotsArray
{
    if (_dotsArray == nil) {
        NSMutableArray *dotsArray = [NSMutableArray array];
        for (int i = 0 ; i < _passwordLength; i ++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = [UIImage mf_circleAndStretchableImageWithColor:self.dotColor size:CGSizeMake(self.dotWidth, self.dotWidth)];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            [self addSubview:imageView];
            [dotsArray addObject:imageView];
            imageView.hidden = YES;
        }
        _dotsArray = dotsArray;
    }
    
    return _dotsArray;
}



/**
 *  快速创建对象,
 *
 *  @param passwordLength 密码长度,默认6位
 *
 *  @return XLPasswordInputView实例对象
 */
+ (instancetype)passwordInputViewWithPasswordLength:(NSInteger)passwordLength;
{
    MFPasswordInputView *passwordInputView = [[self alloc] init];
    passwordInputView.passwordLength = passwordLength;
    return passwordInputView;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initial];
    }
    return self;
}

/**
 *  初始化
 */
- (void)initial
{
    
    _passwordLength = 6;
    _gridLineWidth = 1.0f;
    _gridLineColor = [UIColor purpleColor];
    _dotWidth = 12.0f;
    _dotColor = [UIColor purpleColor];
    _inputCount = 0;

    self.textField = ({
        PowerEnterUITextField *textField = [[PowerEnterUITextField alloc] init];
        textField.placeholder = @"";
        textField.clearButtonMode = UITextFieldViewModeNever;
        textField.passwordKeyboardType = Number;
        textField.secureTextEntry = YES;
        textField.doneButtonAction = ^(PowerEnterUITextField *powerEnterUITextField){
            NSLog(@"点击完成按钮，密码密文为：%@",powerEnterUITextField.value);
        };
        textField.inputContentsChanged = ^(PowerEnterUITextField *powerEnterUITextField) {
            NSLog(@"textFieldstring:%@",powerEnterUITextField.text);
            NSLog(@"textFieldstringvalue:%@",powerEnterUITextField.value);
            NSLog(@"已输入密码长度为：%lu",(unsigned long)powerEnterUITextField.text.length);
            
            [self textChange:powerEnterUITextField];
        };
        [textField becomeFirstResponder];
        [self addSubview:textField];
        textField.tintColor = [UIColor clearColor];
        textField.textColor = [UIColor clearColor];
        textField;
    });
    
    UIImageView *imageView = [[UIImageView alloc] init];
    self.backgroundImageView = imageView;
    [self addSubview:imageView];
    
    [self refreshUI];
}

- (void)textChange:(PowerEnterUITextField *)textField {
    NSString *text = textField.text;
    if (text.length > _passwordLength) {
        //substringToIndex,index从0开始, 不包含最后index所指的那个字符,在这里接到的子串不包含6所指的字符
        text = [text substringToIndex:_passwordLength];
        textField.text = text;
        [textField resignFirstResponder];
    }
    // 刷新位数
    self.inputCount = textField.text.length;
    

    if ([self.delegate respondsToSelector:@selector(passwordInputView:inputPassword:passwordLenth:)]) {
        [self.delegate passwordInputView:self inputPassword:textField.value passwordLenth:text.length];
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


/**
 *  在这里控制圆点的隐藏和显示
 *
 *  @param inputCount 当前用户输入的密码个数
 */
- (void)setInputCount:(NSInteger)inputCount
{
    inputCount = (inputCount > _passwordLength) ? _passwordLength : inputCount;
    _inputCount = inputCount;
        for ( int i = 0 ; i < inputCount; i ++) {
            UIImageView *dotImageView = self.dotsArray[i];
            dotImageView.hidden = NO;
        }
        for (NSInteger i = inputCount; i < self.dotsArray.count; i ++) {
            UIImageView *dotImageView = self.dotsArray[i];
            dotImageView.hidden = YES;
        }
}



- (void)refreshUI {
    
    self.backgroundImageView.image = [UIImage mf_passwordInputGridImageWithGridCount:self.passwordLength gridLineColor:self.gridLineColor gridLineWidth:self.gridLineWidth];

}
- (void)setPasswordLength:(NSUInteger)passwordLength
{
    _passwordLength  = passwordLength;
    [self refreshUI];
}

- (void)setGridLineColor:(UIColor *)gridLineColor
{
    _gridLineColor = gridLineColor;
    [self refreshUI];
}

- (void)setGridLineWidth:(CGFloat)gridLineWidth
{
    _gridLineWidth = gridLineWidth;
    [self refreshUI];
}

- (void)setDotColor:(UIColor *)dotColor
{
    _dotColor = dotColor;
    [self refreshUI];
}

- (void)setDotWidth:(CGFloat)dotWidth
{
    _dotWidth = dotWidth;
    [self refreshUI];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageWidth = self.dotWidth;
    CGFloat imageHeight = self.dotWidth;
    CGFloat gridWidth = self.mf_width / self.passwordLength ;
    for (int i = 0 ; i < self.dotsArray.count; i ++) {
        UIImageView *imageView = self.dotsArray[i];
        imageView.mf_width = imageWidth;
        imageView.mf_height = imageHeight;
        imageView.mf_centerY = self.mf_height * 0.5;
        imageView.mf_centerX = gridWidth * 0.5 + i * gridWidth;
    }
    self.textField.frame = self.bounds;
    self.backgroundImageView.frame = self.bounds;
}

@end
