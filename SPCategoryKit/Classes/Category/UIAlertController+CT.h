//
//  UIAlertController+CT.h
//  CTIMForiOS
//
//  Created by Linst on 16/6/30.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CTAlertActionHandler)(UIAlertAction * action);


@interface UIAlertController (CT)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message action:(UIAlertAction *)action;

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <UIAlertAction *> *)actions;

+ (instancetype)actionControllerWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <UIAlertAction *> *)actions;
@end
