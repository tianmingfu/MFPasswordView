//
//  ViewController.m
//  PasswordTextField
//
//  Created by 田明甫 on 2017/8/25.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "ViewController.h"
#import "PowerEnterUITextField.h"
#import "MFPasswordview.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void)btnAction{
    
    MFPasswordview *mfpassWordView = [[MFPasswordview alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [mfpassWordView showPasswordInView:self.view];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
