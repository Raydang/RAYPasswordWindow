//
//  RAYPasswordWindow.m
//  RAYPasswordWindow
//
//  Created by richerpay on 15/5/28.
//  Copyright (c) 2015年 richerpay. All rights reserved.
//

#import "RAYPasswordWindow.h"

@interface RAYPasswordWindow (){
    
    UITextField *textField;
}


@end

@implementation RAYPasswordWindow

+ (RAYPasswordWindow *)sharedInstance {

    static id sharedInstance = nil;
    static dispatch_once_t  onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedInstance;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 20)];
        label.textAlignment =  NSTextAlignmentCenter;
        label.text = @"请输入密码:";
        [self addSubview:label];
        
        self.backgroundColor = [UIColor cyanColor];
        
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 200, 44)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.secureTextEntry = YES;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.layer.borderWidth = 1;
        textField.layer.cornerRadius = 10;
        textField.layer.borderColor = [UIColor whiteColor].CGColor;
        [self addSubview:textField];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        button.frame = CGRectMake(100, 230, 200, 44);
        [button setTitle:@"确定" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(completeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 10;
        button.layer.borderColor = [UIColor redColor].CGColor;
        
        [self addSubview:button];
        
    }
    return self;
}

- (void) show {
    
    [self makeKeyWindow];
    self.hidden = NO;
    
}

- (void)completeButtonPressed:(id)sender{
    
    if ([textField.text isEqualToString:@"0000"]) {
        [textField resignFirstResponder];
        [self resignKeyWindow];
        self.hidden = YES;
    }
    else {
        textField.text = @"";
        [textField resignFirstResponder];
        [self showErrorAlertView];
    }
}

- (void)showErrorAlertView{
    
    [textField resignFirstResponder];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"错误❌" delegate:self cancelButtonTitle:@"密码错误，正确密码是 0000" otherButtonTitles: nil];
    [alertView show];
    
//    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"错误❌"
//                                                                              message:@"密码错误，正确密码是 0000"
//                                                                       preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *alertAction){
//    }];
//     [alertController addAction:alertAction];
//    UIViewController *vc = self.rootViewController;
//    dispatch_async(dispatch_get_main_queue(), ^ {
//        [vc presentViewController:alertController animated:YES completion:nil];
//    });
    
}

@end
