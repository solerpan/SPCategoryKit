//
//  UIAlertController+CT.m
//  CTIMForiOS
//
//  Created by Linst on 16/6/30.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIAlertController+CT.h"

@implementation UIAlertController (CT)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancel];
    
    return alert;
}

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <UIAlertAction *> *)actions {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    for (UIAlertAction *action in actions) {
        [alert addAction:action];
    }
    return alert;
}

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message action:(UIAlertAction *)action {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:action];
    
    return alert;
}

+ (instancetype)actionControllerWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <UIAlertAction *> *)actions {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (UIAlertAction *action in actions) {
        [alert addAction:action];
    }
    
    return alert;
}

@end
